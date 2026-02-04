return {
  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require("null-ls")
    local sources = {
      null_ls.builtins.formatting.stylua,
      null_ls.builtins.formatting.hclfmt,
      null_ls.builtins.formatting.black,
      null_ls.builtins.formatting.isort,
      null_ls.builtins.formatting.prettier,
      null_ls.builtins.formatting.yamlfmt,
      null_ls.builtins.formatting.markdownlint,
      null_ls.builtins.formatting.shfmt,
    }

    if vim.fn.executable("goimports") == 1 then
      table.insert(sources, null_ls.builtins.formatting.goimports)
    end

    if vim.fn.executable("gofumpt") == 1 then
      table.insert(sources, null_ls.builtins.formatting.gofumpt)
    end

    null_ls.setup({
      sources = sources,
    })
    vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
  end,
}
