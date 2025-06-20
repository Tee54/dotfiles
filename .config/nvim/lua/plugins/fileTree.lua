return {
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
}
