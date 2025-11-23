return {
    'nvim-telescope/telescope.nvim',
    cmd = 'Telescope',
    dependencies = {
        'nvim-lua/plenary.nvim',
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
}
