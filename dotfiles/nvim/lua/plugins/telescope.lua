return {
    "nvim-telescope/telescope.nvim",
    version = "*",
    dependencies = {
        "nvim-lua/plenary.nvim",
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    keys = {
        { "<leader>ff", function() require("telescope.builtin").find_files() end, desc = "Find Files" },
        { "<leader>fg", function() require("telescope.builtin").live_grep() end, desc = "Live Grep" },
        {
            "<leader>fs",
            function() require("telescope.builtin").grep_string({ search = vim.fn.input("Grep > ") }) end,
            desc = "Grep String"
        },
        {
            "<leader>fw",
            function()
                local word = vim.fn.expand("<cword>")
                require("telescope.builtin").grep_string({ search = word })
            end,
            desc = "Grep String (cword)"
        },
        {
            "<leader>fW",
            function()
                local word = vim.fn.expand("<cWORD>")
                require("telescope.builtin").grep_string({ search = word })
            end,
            desc = "Grep String (cWORD)"
        },
        { "<leader>fb", function() require("telescope.builtin").buffers() end, desc = "Find Buffers" },
        { "<leader>fh", function() require("telescope.builtin").help_tags() end, desc = "Help Tags" },
        { "<leader>fr", function() require("telescope.builtin").lsp_references() end, desc = "Show References" },
        { "<leader>fd", function() require("telescope.builtin").lsp_definitions() end, desc = "Show Definitions" },
    },
}
