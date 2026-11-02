return {
    "luukvbaal/statuscol.nvim",
    event = "VeryLazy",
    config = function()
        require("custom.statuscol_clicks")

        local builtin = require("statuscol.builtin")
        require("statuscol").setup({
            relculright = true,
            ft_ignore  = { "NvimTree", "fugitive", "dap-repl", "dapui_stacks", "dapui_scopes", "dapui_watches", "dapui_console" },
            segments = {
                { sign = { namespace = { "gitsigns" }, maxwidth = 1, }, },
                {
                    sign = {
                        name = { "Dap" },
                        maxwidth = 1,
                        auto = true
                    },
                    click = "v:lua.StatuscolClicks.DapModify"
                },
                { text = { "%l " }, },
            }
        })
    end,
}
