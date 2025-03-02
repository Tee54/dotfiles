return {
	{
		"hrsh7th/nvim-cmp", --Autocompletion
		event = "InsertEnter",
        dependencis = {
	        "hrsh7th/cmp-nvim-lsp", -- Sources for autocompletation lsp
	        "L3MON4D3/LuaSnip", -- Git Signs
        },
		config = function()
            local cmp = require('cmp')
			require('cmp').setup({
				snippet = {
				  expand = function(args)
				  	require("luasnip").lsp_expand(args.body)
				  end,
				},
				mapping = {
					['<C-y>'] = cmp.mapping.confirm({select = true})
				},
				sources = { {name = "nvim_lsp"}
			    },
			})
		end,
	},
}
