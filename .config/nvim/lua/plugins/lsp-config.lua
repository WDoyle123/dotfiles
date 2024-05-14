return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "jedi_language_server", "bashls", "cssls", "dockerls", "golangci_lint_ls", "html", "jsonls", "quick_lint_js", "markdown_oxide", "sqlls", "svelte", "tailwindcss", "terraformls", "yamlls" }
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup({
        capabilities = capabilities
      })
      lspconfig.bashls.setup({
        cmd = {"bash-language-server", "start"},
        capabilities = capabilities
      })
      lspconfig.cssls.setup({
        capabilities = capabilities
      })
      lspconfig.dockerls.setup({
        capabilities = capabilities
      })
      lspconfig.golangci_lint_ls.setup({
        capabilities = capabilities
      })
      lspconfig.html.setup({
        capabilities = capabilities
      })
      lspconfig.jsonls.setup({
        capabilities = capabilities
      })
      lspconfig.quick_lint_js.setup({
        capabilities = capabilities
      })
      lspconfig.markdown_oxide.setup({
        capabilities = capabilities
      })
      lspconfig.jedi_language_server.setup({
        capabilities = capabilities
      })
      lspconfig.sqlls.setup({
        capabilities = capabilities
      })
      lspconfig.svelte.setup({
        capabilities = capabilities
      })
      lspconfig.tailwindcss.setup({
        capabilities = capabilities
      })
      lspconfig.terraformls.setup({
        capabilities = capabilities
      })
      lspconfig.yamlls.setup({
        capabilities = capabilities
      })
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
      vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, {})
    end
  }
}
