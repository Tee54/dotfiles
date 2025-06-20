return {
    "neovim/nvim-lspconfig",
    event = {"bufReadPre", "BufNewFile"},
    config = function()
        require("core.lsp")
    end,
}
