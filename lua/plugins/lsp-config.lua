return {
	{
		"williamboman/mason.nvim",
		lazy = false,
		opt = { automatic_installation = true, 
		PATH = "prepend", -- "skip" seems to cause the spawning error
		},
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		ensure_installed = { "lua_ls", "rust_analyzer", "clangd", "bash-language-server","pyright","clangd" },
		auto_install = true,

	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			local cmp_nvim_lsp = require("cmp_nvim_lsp")

			local capabilities = cmp_nvim_lsp.default_capabilities()
			local lspconfig = require("lspconfig")
			lspconfig.clangd.setup({
				capabilities = capabilities,
			})
			lspconfig.rust_analyzer.setup({
				capabilities = capabilities,
			})
			lspconfig.pyright.setup({
				capabilities = capabilities,
			})
			lspconfig.tsserver.setup({
				capabilities = capabilities,
			})
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
			})
			lspconfig.gopls.setup({
				capabilities = capabilities,
			})
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
}

