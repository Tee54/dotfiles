-- Configuration for LSP
local lspconfig = require('lspconfig')

-- Configure servers for programming languages
local servers = {'clangd','asm_lsp','lua_ls'} -- Add more servers here!!

for _, lsp in ipairs(servers) do 
	lspconfig[lsp].setup({
		on_attach = function(client, bufnr)
			local bufopt = {noremap = true, silent = true, buffer = bufnr }
			vim.keymap.set{'n', 'gd', vim.lsp.buf.definiton, bufopts}
			vim.keymap.set{'n', 'gr', vim.lsp.buf.references, bufopts}
			vim.keymap.set{'n', 'K', vim.lsp.hover, bufopts}
			vim.keymap.set{'n', '<leader>rn', vim.lsp.buf.rename, bufopts}
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
