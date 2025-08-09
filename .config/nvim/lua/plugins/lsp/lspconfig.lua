return {
    "neovim/nvim-lspconfig",
    event = {"bufReadPre", "BufNewFile"},
    opt = function()
        require("core.lsp")
    end,
}
