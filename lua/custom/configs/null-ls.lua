local null_ls = require("null-ls")
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local roc_format = {
  method = null_ls.methods.FORMATTING,
  filetypes = {"roc"},
  generator = null_ls.formatter({
    command = "sh",
    args = {"roc", "format", "$0"},
    to_stdin = true,
    from_stderr = true,
  }),
}

local opts = {
  sources = {
    null_ls.builtins.formatting.gofumpt,
    null_ls.builtins.formatting.goimports_reviser,
    null_ls.builtins.formatting.golines,
    roc_format,
  },
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({
        group = augroup,
        buffer = bufnr,
      })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({ bufnr = bufnr })
        end
      })
    end
  end
}
return opts
