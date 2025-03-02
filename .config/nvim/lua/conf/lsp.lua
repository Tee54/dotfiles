-- Configuration for LSP
local lspconfig = require('lspconfig')

-- Configure servers for programming languages
local servers = {'clangd','lua_ls'} -- Add more servers here!!

for _, lsp in ipairs(servers) do 
	lspconfig[lsp].setup({
		on_attach = function(client, bufnr)
			local bufopt = {noremap = true, silent = true, buffer = bufnr }
			vim.keymap.set{'n', 'gd', vim.lsp.buf.definition, bufopt}
			vim.keymap.set{'n', 'gr', vim.lsp.buf.references, bufopt}
			vim.keymap.set{'n', 'K', vim.lsp.hover, bufopt}
			vim.keymap.set{'n', '<leader>rn', vim.lsp.buf.rename, bufopt}
		end,
	})
end

-- Diagnostics
vim.diagnostic.config({
	virtual_text = false,
	signs = true,
	update_in_insert = true,
	severity_sort = true,
})

-- Config LSP Servers 

lspconfig.lua_ls.setup({
	on_attach = on_attach,
	settings = {
		Lua = {
			runtime = {
				-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim).
				version = "LuaJIT",
			},
			diagnostics = {
				-- Get the language server to recognize the `vim` global.
				globals = { "vim" },
			},
			workspace = {
				-- Make the server aware of Neovim runtime files.
				library = vim.api.nvim_get_runtime_file("", true),
			},
			-- Do not send telemetry data containing a randomized but unique identifier.
			telemetry = {
				enable = false,
			},
		},
	},
})

lspconfig.clangd.setup ({
    on_attach = on_attach,
})


