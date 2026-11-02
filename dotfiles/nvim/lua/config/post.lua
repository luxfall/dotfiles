
local yank_group = vim.api.nvim_create_augroup("HighlightYank", {})
vim.api.nvim_create_autocmd("TextYankPost", {
    group = yank_group,
    pattern = "*",
    callback = function()
        vim.highlight.on_yank({
            higroup = "IncSearch",
            timeout = 40,
        })
    end,
})

local custom = vim.api.nvim_create_augroup("Custom", {})
vim.api.nvim_create_autocmd("BufWritePre", {
    group = custom,
    pattern = "*",
    command = [[%s/\s\+$//e]],
})

