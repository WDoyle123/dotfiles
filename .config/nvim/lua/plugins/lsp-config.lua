return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"jedi_language_server",
					"bashls",
					"cssls",
					"dockerls",
					"gopls",
					"golangci_lint_ls",
					"html",
					"jsonls",
					"quick_lint_js",
					"markdown_oxide",
					"sqlls",
					"svelte",
					"tailwindcss",
					"terraformls",
					"yamlls",
					"ts_ls",
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local servers = {
				"lua_ls",
				"cssls",
				"dockerls",
				"golangci_lint_ls",
				"html",
				"jsonls",
				"quick_lint_js",
				"markdown_oxide",
				"jedi_language_server",
				"sqlls",
				"svelte",
				"tailwindcss",
				"terraformls",
				"yamlls",
				"ts_ls",
			}

			for _, server in ipairs(servers) do
				vim.lsp.config(server, {
					capabilities = capabilities,
				})
				vim.lsp.enable(server)
			end

			vim.lsp.config("bashls", {
				cmd = { "bash-language-server", "start" },
				capabilities = capabilities,
			})
			vim.lsp.enable("bashls")

			vim.lsp.config("gopls", {
				capabilities = capabilities,
				settings = {
					gopls = {
						gofumpt = true,
						staticcheck = true,
						analyses = {
							unusedparams = true,
							shadow = true,
						},
					},
				},
			})
			vim.lsp.enable("gopls")

			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
			vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, {})
			vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, {})
			vim.keymap.set("n", "]d", vim.diagnostic.goto_next, {})
			vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, {})
		end,
	},
}
