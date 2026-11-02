require("config.set")
require("config.remap")
require("config.lazy_init")

require("lazy").setup({
    require "plugins.actions-preview",
    require "plugins.cmp",
    require "plugins.fugitive",
    require "plugins.harpoon",
    require "plugins.indentline",
    require "plugins.lsp",
    require "plugins.lualine",
    require "plugins.luasnip",
    require "plugins.misc",
    require "plugins.notify",
    require "plugins.nvim-tree",
    require "plugins.telescope",
})

require("config.post")
