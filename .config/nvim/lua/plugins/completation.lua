return {
    {
        "hrsh7th/nvim-cmp", -- Autocompletion
        event = "InsertEnter",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp", -- Sources for autocompletation 
            "hrsh7th/cmp-buffer", -- Sources for actual buffer
            "L3MON4D3/LuaSnip", -- Snippets for cmp
        },
        config = function()
            local cmp = require('cmp')

            local cfg = {
                snippet = {
                    expand = function(args)
                        require("luasnip").lsp_expand(args.body)
                    end,
                },
                mapping = cmp.mapping.preset.insert({
                    ['<CR>'] = cmp.mapping.confirm({ select = true }),-- Confirm
                    ['<C-j>'] = cmp.mapping.select_next_item(), -- Next
                    ['<C-k>'] = cmp.mapping.select_prev_item(),-- Back
            }),
                sources = {
                    { name = 'buffer' },
                    { name = 'nvim_lsp'},
                },
            }
            cmp.setup(cfg)
        end,
    }
}
