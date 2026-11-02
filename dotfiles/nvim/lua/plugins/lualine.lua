return {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-tree/nvim-web-devicons", },
    opts = {
        options = {
            section_separators = { left = "", right = "" },
            component_separators = { left = "", right = "" },
            globalstatus = true,
        },
        sections = {
            lualine_b = {
                {
                    "filename",
                    symbols = {
                        modified = "●",
                        readonly = "",
                    },
                },
            },
            lualine_c = { "branch" },
            lualine_x = { },
        },
    },
}
