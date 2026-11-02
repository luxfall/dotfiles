
-- Move selection up/down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("x", "<leader>p", [["_dP]], { desc = "Replace & Preserve Yank" })
vim.keymap.set({"n", "v"}, "<leader>d", [["_d]], { desc = "Delete & Preserve Yank" })

vim.keymap.set("v", "<leader>y", [["+y]], { desc = "Yank selection to clipboard" })
vim.keymap.set("n", "<leader>Y", [["+Y]], { desc = "Yank line to clipboard" })

vim.keymap.set("n", "<leader>=", "ma=ap'a", { desc = "Reformat Paragraph & Peserve Cursor" })
vim.keymap.set("n", "<leader>w", "<cmd>w<CR>", { desc = "Save Current File" })
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
    { desc = "Rename (Native)" })
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { desc = "Make executalbe", silent = true })

-- Easier movement to beginning and ending of the line
vim.keymap.set({"n", "v", "o", "x"}, "H", "^")
vim.keymap.set({"n", "v", "o", "x"}, "L", "$")

-- Escape remaps
vim.keymap.set("i", "jk", "<Esc>")
vim.keymap.set("i", "jj", "<Esc>")

-- Center after jump paragraph
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Center after jumping to next/prev search target
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "#", "#zzzv")
vim.keymap.set("n", "*", "*zzzv")

-- Next/Prev quickfix list target
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")

-- Reset cursor position after merging lines
vim.keymap.set("n", "J", "mzJ`z")

