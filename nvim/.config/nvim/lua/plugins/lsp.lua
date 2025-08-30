return {
    {
        "williamboman/mason.nvim",
        lazy = false,
        config = function()
            require("mason").setup()
        end,
    },
    {
        "neovim/nvim-lspconfig",
        lazy = false,
        dependencies = {
            "Saghen/blink.cmp",
            version = "1.*",
        },
        config = function()
            require("blink.cmp").setup()
            vim.diagnostic.config({
                float = { border = "rounded" },
            })

            local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
            function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
                opts = opts or {}
                opts.border = opts.border or "rounded" -- Force rounded borders
                return orig_util_open_floating_preview(contents, syntax, opts, ...)
            end

            local capabilities = require("blink.cmp").get_lsp_capabilities()

            local lspconfig = require("lspconfig")

            lspconfig.gopls.setup({
                capabilities = capabilities,
            })

            lspconfig.lua_ls.setup({
                capabilities = capabilities,
            })
        end,
    },
}
