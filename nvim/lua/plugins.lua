local lazypath = vim.fn.stdpath("data") .. "lazy/lazy.vim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
	"git",
	"clone", 
	"--filter=blob:none",
	"https://github.com/folke/lazy.nvim.git",
	"--branch=stable", -- latest stable release
	lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
	-- LSP and autocompletion
	{
		"neovim/nvim-lspconfig", -- LSP
		event = {"BufReadPre", "BufNewFile"},
		config = function()
			require('lsp')
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

	{"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"}, -- Better highlight for syntaxis

-- Navigation
	{"nvim-telescope/telescope.nvim", dependencies = {"nvim-lua/plenary.nvim"}}, -- Search
	{"folke/which-key.nvim", event = "VeryLazy"}, -- Show shortcuts
    
-- File Explorer
    {
        "nvim-tree/nvim-tree.lua",
        dependencies = {
            "nvim-tree/nvim-web-devicons" --optional, for icons
        },
        config = function()
            require("nvim-tree").setup({
                view = {
                    width = 30,
                    side = "left",
                },
                renderer = {
                    icons = {
                        show = {
                            folder = true,
                            file = true, 
                            folder_arrow = true, 
                        },
                    },
                },
            })
        end
    },
})
