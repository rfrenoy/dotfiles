vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.keymap.set("n", "-", vim.cmd.Ex) -- need nvim 0.8+
vim.keymap.set("i", "jk", "<ESC>")

-- LSP keybindings using Telescope (applied when LSP attaches)
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspKeymaps", { clear = true }),
  callback = function(ev)
    local opts = { buffer = ev.buf }
    local telescope = require("telescope.builtin")

    vim.keymap.set("n", "<leader>gd", telescope.lsp_definitions, vim.tbl_extend("force", opts, { desc = "Go to definition" }))
    vim.keymap.set("n", "<leader>gr", telescope.lsp_references, vim.tbl_extend("force", opts, { desc = "Find references" }))
    vim.keymap.set("n", "<leader>gi", telescope.lsp_implementations, vim.tbl_extend("force", opts, { desc = "Go to implementation" }))
    vim.keymap.set("n", "<leader>gy", telescope.lsp_type_definitions, vim.tbl_extend("force", opts, { desc = "Go to type definition" }))
    vim.keymap.set("n", "<leader>ds", telescope.lsp_document_symbols, vim.tbl_extend("force", opts, { desc = "Document symbols" }))
    vim.keymap.set("n", "<leader>ws", telescope.lsp_workspace_symbols, vim.tbl_extend("force", opts, { desc = "Workspace symbols" }))
  end,
})

