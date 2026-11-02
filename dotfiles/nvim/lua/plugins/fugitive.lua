return {
    "tpope/vim-fugitive",
    cmd = { "Git", "G" },
    keys = {
        { "<leader>gg", vim.cmd.Git, desc = "Git: Fugitive open" },
        { "gh", "<cmd>diffget //2<CR>", desc = "Git: Accept Left (Ours)" },
        { "gl", "<cmd>diffget //3<CR>", desc = "Git: Accept Right (Theirs)" },
        { "<leader>gl", ":Gclog<CR>", desc = "Git: Log" },
        { "<leader>gp", ":G pull<CR>", desc = "Git: Pull" },
        { "<leader>gP", ":G pull<Space>", desc = "Git: Pull (Edit)" },
        { "<leader>gb", ":G branch<Space>", desc = "Git: Branch" },
        { "<leader>gs", ":G switch<Space>", desc = "Git: Switch" },
        { "<leader>gr", ":G reset --soft<Space>", desc = "Git: Reset soft" },
        { "<leader>grs", ":G reset --soft<Space>", desc = "Git: Reset soft" },
        { "<leader>grh", ":G reset --hard<Space>", desc = "Git: Reset hard" },
    },
}

