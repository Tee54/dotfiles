-- LSP configuration
local lspconfig =  require("lspconfig")
local mason_lspconfig = require("mason-lspconfig")

-- Servers configuration
local on_attach = function(client, bufnr)

    -- Basic Options
        local opts = {noremap = true, silent = true, buffer = bufnr }
        local map = vim.keymap.set
			map{'n', 'gd', vim.lsp.buf.definition, opts, 'Go To Definition'}
			map{'n', 'gr', vim.lsp.buf.references, opts, 'Show Reference'}
			map{'n', 'K', vim.lsp.buf.hover, opts, 'Hover Documentation'}
            map{'n', '<leader>rn', vim.lsp.buf.rename, opts, 'Rename Symbol'}
    end

-- Configure global lsp settings
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Servers
local servers = {
    "lua_ls",
    "clangd",
    "harper_ls",
}

-- Set server configuration
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup({
    on_attach = on_attach,
    capabilities = capabilities,
  })
end

-- Run specific setup on servers
lspconfig.lua_ls.setup({
    settings = {
            Lua = {
                runtime = { version = 'LuaJIT' },
                diagnostics = { globals = { 'vim' }},
                workspaces = {
                    library = vim.api.nvim_get_runtime_file("", true),
                    checkThirdParty = false
                },
                telemetry = { enable = false },
            }
        }
})

lspconfig.clangd.setup({
    capabilities = {
            OffsetEncoding = 'utf-8',
        },
        cmd = {
            "clangd",
            "--background-index",
            "--clang-tidy",
            "--header-insertion=never",
            "--completion-style=detailed",
            "--function-arg-placeholders",
            "--fallback-style=llvm",
        }
})

lspconfig.harper_ls.setup({
    settings = {
        ["harper-ls"] = {
            linters = {
                SentenceCapitalization = false, -- Change this if markdown
                SpellCheck = false, -- Change this if markdown
            },
            markdown = {
                IgnoreLinkTitle = false
            },
            diagnosticSeverity = "hint",
            isolateEnglish = false,
            dialect = "American",
        }
    }
})
