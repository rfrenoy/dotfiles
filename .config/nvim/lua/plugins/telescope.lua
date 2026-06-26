return {
    'nvim-telescope/telescope.nvim',
    cmd = 'Telescope',
    dependencies = {
        'nvim-lua/plenary.nvim',
	'BurntSushi/ripgrep',
	'nvim-telescope/telescope-live-grep-args.nvim',
    },
    keys = function()
        local lazy_telescope = function(builtin)
            return function(...)
                require('telescope.builtin')[builtin](...)
            end
        end
        local live_grep_args = function(...)
            require('telescope').extensions.live_grep_args.live_grep_args(...)
        end
        return {
            { '<leader>fb', lazy_telescope('buffers'),                   desc = 'Find buffers' },
            { '<leader>fd', lazy_telescope('diagnostics'),               desc = 'Find diagnostics' },
            { '<leader>fg', lazy_telescope('git_files'),                 desc = 'Find Git files' },
            { '<leader>ff', lazy_telescope('find_files'),                desc = 'Find files' },
            { '<leader>/', live_grep_args,                              desc = 'Find files by content' },
            { '<leader>fh', lazy_telescope('help_tags'),                 desc = 'Find help tags' },
            { '<leader>fo', lazy_telescope('oldfiles'),                  desc = 'Find recently opened files' },
            { '<leader>fw', lazy_telescope('grep_string'),               desc = 'Find word in buffer' },
            { '<leader>b/', lazy_telescope('current_buffer_fuzzy_find'), desc = 'Find fuzzy match in current buffer' },
            { '<leader>fc', lazy_telescope('commands'), desc = 'Find commands' },
        }
    end,
    config = function(_, opts)
        require('telescope').setup(opts)
        require('telescope').load_extension('live_grep_args')
    end,
    opts = function()
        local lga_actions = require('telescope-live-grep-args.actions')
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
            extensions = {
                live_grep_args = {
                    auto_quoting = true,
                    -- search hidden files and skip .git, matching the live_grep picker
                    vimgrep_arguments = {
                        "rg",
                        "--color=never",
                        "--no-heading",
                        "--with-filename",
                        "--line-number",
                        "--column",
                        "--smart-case",
                        "--hidden",
                        "--glob=!.git/",
                    },
                    mappings = {
                        i = {
                            -- wrap the term in quotes so you can append raw rg args
                            ["<C-k>"] = lga_actions.quote_prompt(),
                            -- jump straight to typing a folder glob
                            ["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
                        },
                    },
                },
            },
        }
    end,
}
