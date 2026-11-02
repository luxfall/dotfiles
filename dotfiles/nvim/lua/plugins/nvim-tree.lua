return {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    cmd = { "NvimTreeToggle", "NvimTreeOpen", "NvimTreeClose" },
    keys = {
        {
            "<leader>e",
            "<cmd>NvimTreeToggle<CR>",
            desc = "NvimTree: Toggle"
        }
    },
    config = function()
        local nvimtree = require("nvim-tree")
        local api = require "nvim-tree.api"

        local function my_on_attach(bufnr)
            local function opts(desc)
                return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
            end

            api.config.mappings.default_on_attach(bufnr)

            vim.keymap.set("n", ".", api.tree.change_root_to_node, opts("Set Root"))
            vim.keymap.set("n", "?", api.tree.toggle_help, opts("Help"))
        end

        nvimtree.setup({
            on_attach = my_on_attach,
            update_focused_file = {
                enable = true,
                update_root = true,
                ignore_list = {},
            },
            renderer = {
                group_empty = true,
                indent_markers = { enable = true },
                icons = { show = { git = false } },
            },
            actions = {
                open_file = {
                    window_picker = { enable = false },
                },
            },
            view = {
                signcolumn = "no",
            },
        })
    end
}

