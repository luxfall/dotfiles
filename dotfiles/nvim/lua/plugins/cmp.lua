return {
    "hrsh7th/nvim-cmp",
    event = { "InsertEnter", "CmdlineEnter" },
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
        "rafamadriz/friendly-snippets",
        "onsails/lspkind.nvim",
    },
    config = function()
        local luasnip = require("luasnip")
        local cmp = require("cmp")

        local mappings = cmp.mapping.preset.insert({
            ["<C-k>"] = cmp.mapping.select_prev_item(),
            ["<C-j>"] = cmp.mapping.select_next_item(),
            ["<C-b>"] = cmp.mapping.scroll_docs(-4),
            ["<C-f>"] = cmp.mapping.scroll_docs(4),
            ["<C-Space>"] = cmp.mapping.complete(),
            ["<C-e>"] = cmp.mapping.abort(),
            ["<CR>"] = cmp.mapping.confirm({ select = true }),
            ["<Tab>"] = cmp.mapping(function(fallback)
                if luasnip.expand_or_jumpable() then
                    luasnip.expand_or_jump()
                else
                    fallback()
                end
            end, { "i", "s" }),
            ["<S-Tab>"] = cmp.mapping(function(fallback)
                if luasnip.jumpable(-1) then
                    luasnip.jump(-1)
                else
                    fallback()
                end
            end, { "i", "s" }),
        })

        local sources = cmp.config.sources({
            { name = "copilot", group_index = 1 },
            { name = "nvim_lsp", group_index = 2 },
            { name = "luasnip", group_index = 2 },
            { name = "nvim_lsp_signature_help", group_index = 2 },
        }, {
            { name = "buffer", group_index = 3 },
            { name = "path", group_index = 3 },
        })

        cmp.setup({
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },
            mapping = mappings,
            sources = sources,
            formatting = {
                fields = { "kind", "abbr" },
                format = require("lspkind").cmp_format({
                    mode = "symbol",
                    maxwidth = { abbr = 70, },
                    ellipsis_char = "...",
                })
            },
            window = {
                completion = {
                    border = "rounded",
                    winblend = 30,
                    scrollbar = false,
                    max_height = 50,
                },
                documentation = {
                    border = "rounded",
                    winblend = 30,
                    scrollbar = false,
                },
            },
        })

        cmp.setup.cmdline({ "/", "?" }, {
            mapping = cmp.mapping.preset.cmdline(),
            sources = { { name = "buffer" } }
        })

        cmp.setup.cmdline(":", {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources(
                { { name = "path" } },
                { { name = "cmdline" } }
            )
        })
    end,
}
