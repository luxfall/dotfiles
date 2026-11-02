return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
        {
            "<leader>M",
            function()
                local harpoon = require("harpoon")
                harpoon.ui:toggle_quick_menu(harpoon:list())
            end,
            desc = "Harpoon: Open Quick Menu"
        },
        {
            "<leader>m",
            function()
                local harpoon = require("harpoon")
                harpoon:list():add()
            end,
            desc = "Harpoon: Add Location" },
        {
            "<leader>1",
            function()
                local harpoon = require("harpoon")
                harpoon:list():select(1)
            end,
            desc = "Harpoon: Select List Item (1)"
        },
        {
            "<leader>2",
            function()
                local harpoon = require("harpoon")
                harpoon:list():select(2)
            end,
            desc = "Harpoon: Select List Item (2)"
        },
        {
            "<leader>3",
            function()
                local harpoon = require("harpoon")
                harpoon:list():select(3)
            end,
            desc = "Harpoon: Select List Item (3)"
        },
        {
            "<leader>4",
            function()
                local harpoon = require("harpoon")
                harpoon:list():select(4)
            end,
            desc = "Harpoon: Select List Item (4)"
        },
        {
            "<leader>p",
            function()
                local harpoon = require("harpoon")
                harpoon:list():prev()
            end,
            desc = "Harpoon: Select Previous List Item"
        },
        {
            "<leader>n",
            function()
                local harpoon = require("harpoon")
                harpoon:list():next()
            end,
            desc = "Harpoon: Select Next List Item"
        },
    },
}
