local M = {}

local groups = {}

local function valid_wins(group)
  return vim.tbl_filter(vim.api.nvim_win_is_valid, group.wins)
end

local function align(group)
  local wins = valid_wins(group)
  for _, win in ipairs(wins) do
    vim.wo[win].scrollbind = false
  end

  local so = vim.o.scrolloff
  for i = 2, #wins do
    local prev_bot = vim.api.nvim_win_call(wins[i - 1], function()
      return vim.fn.line("w$")
    end)
    vim.api.nvim_win_call(wins[i], function()
      local last = vim.fn.line("$")
      local top = math.min(prev_bot + 1, last)
      vim.fn.winrestview({ topline = top, lnum = math.min(top + so, last), col = 0 })
    end)
  end

  for _, win in ipairs(wins) do
    vim.api.nvim_win_call(win, function()
      vim.wo.scrollbind = true
    end)
  end
end

local function disable(tab)
  local group = groups[tab]
  if not group then
    return
  end
  groups[tab] = nil
  vim.api.nvim_del_augroup_by_id(group.augroup)

  for i, win in ipairs(group.wins) do
    if vim.api.nvim_win_is_valid(win) then
      if i == 1 then
        vim.wo[win].scrollbind = false
        vim.wo[win].foldenable = group.foldenable
      else
        vim.api.nvim_win_close(win, false)
      end
    end
  end
end

local function enable(count)
  local tab = vim.api.nvim_get_current_tabpage()
  local first = vim.api.nvim_get_current_win()
  local group = { wins = { first }, foldenable = vim.wo[first].foldenable }

  vim.wo[first].foldenable = false
  for _ = 2, count do
    vim.cmd("rightbelow vsplit")
    table.insert(group.wins, vim.api.nvim_get_current_win())
  end
  vim.api.nvim_set_current_win(first)

  group.augroup = vim.api.nvim_create_augroup("Columns" .. tab, { clear = true })
  vim.api.nvim_create_autocmd("WinResized", {
    group = group.augroup,
    callback = function()
      for _, win in ipairs(vim.v.event.windows) do
        if vim.tbl_contains(group.wins, win) then
          align(group)
          return
        end
      end
    end,
  })
  vim.api.nvim_create_autocmd("WinClosed", {
    group = group.augroup,
    callback = function(args)
      local closed = tonumber(args.match)
      if not vim.tbl_contains(group.wins, closed) then
        return
      end
      group.wins = vim.tbl_filter(function(win)
        return win ~= closed and vim.api.nvim_win_is_valid(win)
      end, group.wins)
      vim.schedule(function()
        if groups[tab] ~= group then
          return
        end
        if #group.wins < 2 then
          disable(tab)
        else
          align(group)
        end
      end)
    end,
  })

  groups[tab] = group
  align(group)
end

function M.toggle(count)
  local tab = vim.api.nvim_get_current_tabpage()
  local group = groups[tab]
  if group then
    disable(tab)
    if count == nil or count == #group.wins then
      return
    end
  end
  enable(count or 2)
end

vim.api.nvim_create_user_command("Columns", function(opts)
  local count = opts.args ~= "" and tonumber(opts.args) or nil
  if count and count < 2 then
    vim.notify("Columns: count must be at least 2", vim.log.levels.ERROR)
    return
  end
  M.toggle(count)
end, { nargs = "?", desc = "Toggle reading the buffer in N scroll-bound columns" })

return M
