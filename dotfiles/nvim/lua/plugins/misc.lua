return {
    {
        "jinh0/eyeliner.nvim",
        config = function()
            require("eyeliner").setup({
                highlight_on_key = true,
                dim = true,
            })
            vim.api.nvim_set_hl(0, "EyelinerPrimary", { fg="#FF0000", bold = true })
            vim.api.nvim_set_hl(0, "EyelinerSecondary", { fg="#FF0000" })
        end
    },

    {
        "stevearc/quicker.nvim",
        ft = "qf",
        opts = {},
        keys = {
            { "<leader>q", function() require("quicker").toggle() end, mode = { "n" }, desc = "Toggle loclist", },
            { ">", function() require("quicker").expand({ before = 2, after = 2, add_to_existing = true }) end, desc = "Expand quickfix context", },
            { "<", function() require("quicker").collapse() end, desc = "Collapse quickfix context", },
        },
    },

    {
        "numToStr/Comment.nvim",
        event = "VeryLazy",
        opts = {},
    },

    {
        "lewis6991/gitsigns.nvim",
        event = "VeryLazy",
        opts = {
            sign_priority = 50,
        },
    },

    {
        "smjonas/inc-rename.nvim",
        cmd = "IncRename",
        opts = {},
    },

    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        opts = {},
    },

    {
        "kylechui/nvim-surround",
        version = "^3.0.0",
        event = "VeryLazy",
        opts = {},
    },

    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        ft = { "c", "cpp", "rust", "python" },
        dependencies = {
            { "nvim-treesitter/nvim-treesitter-textobjects", lazy = true, },
            { "nvim-treesitter/nvim-treesitter-context", lazy = true, },
        },
        opts = {
            ensure_installed = {
                "bash", "c", "lua", "vim", "vimdoc", "python", "json", "markdown", "markdown_inline"
            },
            sync_install = false,
            auto_install = true,
            indent = {
                enable = true,
                disable = { "python", "yaml" },
            },
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },
        },
    },

    {
        "mbbill/undotree",
        keys = {
            { "<leader>u", vim.cmd.UndotreeToggle, desc = "UndoTree: Toggle" }
        },
    },

    {
        "RRethy/vim-illuminate",
        event = { "VeryLazy" },
    },

    {
        "tpope/vim-sleuth",
        event = { "BufReadPost", "BufNewFile" },
    },
}
