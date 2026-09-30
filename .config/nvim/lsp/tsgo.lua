return {
  cmd = { 'tsc', '--lsp', '--stdio' },
  filetypes = { 'typescript', 'typescriptreact', 'javascript', 'javascriptreact' },
  root_markers = { 'package-lock.json', '.git' },
}
