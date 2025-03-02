return {
    {
		"neovim/nvim-lspconfig", -- LSP
		event = {"BufReadPre", "BufNewFile"},
		config = function()
			require('conf.lsp')
		end,
	},

	{
		"williamboman/mason.nvim", -- Administrador for lsp services
		build = ":MasonUpdate",
		config = function()
			require('mason').setup()
		end,
	},

	{
		"williamboman/mason-lspconfig.nvim", -- Support for mason with lspconfig
		after = "mason.nvim",
		config = function()
			require('mason-lspconfig').setup({
				automatic_installation = true,
			})
		end,
	},
}
