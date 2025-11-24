return {
    'nvim-telescope/telescope.nvim',
    cmd = 'Telescope',
    dependencies = {
        'nvim-lua/plenary.nvim',
	'BurntSushi/ripgrep',
    },
    keys = function()
        local lazy_telescope = function(builtin)
            return function(...)
                require('telescope.builtin')[builtin](...)
            end
        end
        return {
            { '<leader>fb', lazy_telescope('buffers'),                   desc = 'Find buffers' },
            { '<leader>fd', lazy_telescope('diagnostics'),               desc = 'Find diagnostics' },
            { '<leader>fg', lazy_telescope('git_files'),                 desc = 'Find Git files' },
            { '<leader>ff', lazy_telescope('find_files'),                desc = 'Find files' },
            { '<leader>/', lazy_telescope('live_grep'),                 desc = 'Find files by content' },
            { '<leader>fh', lazy_telescope('help_tags'),                 desc = 'Find help tags' },
            { '<leader>fo', lazy_telescope('oldfiles'),                  desc = 'Find recently opened files' },
            { '<leader>fw', lazy_telescope('grep_string'),               desc = 'Find word in buffer' },
            { '<leader>b/', lazy_telescope('current_buffer_fuzzy_find'), desc = 'Find fuzzy match in current buffer' },
        }
    end,
    config = true,
    opts = function()
	local function find_command()
            if 1 == vim.fn.executable("rg") then
              return { "rg", "--files", "--color", "never", "-g", "!.git" }
            elseif 1 == vim.fn.executable("fd") then
              return { "fd", "--type", "f", "--color", "never", "-E", ".git" }
            elseif 1 == vim.fn.executable("fdfind") then
              return { "fdfind", "--type", "f", "--color", "never", "-E", ".git" }
            elseif 1 == vim.fn.executable("find") and vim.fn.has("win32") == 0 then
              return { "find", ".", "-type", "f" }
            elseif 1 == vim.fn.executable("where") then
              return { "where", "/r", ".", "*" }
            end
        end

	return {
            defaults = {
                vimgrep_arguments = {
                    "rg",
                    "--color=never",
                    "--no-heading",
                    "--with-filename",
                    "--line-number",
                    "--column",
                    "--smart-case",
                    "--hidden",  -- Search hidden files
                    "--glob=!.git/",  -- Exclude .git directory
                },
            },
            pickers = {
                find_files = {
                  find_command = find_command(),
                  hidden = true,
                },
                live_grep = {
                    additional_args = function()
                        return { "--hidden", "--glob=!.git/" }
                    end,
                },
            },
        }
    end,
}
