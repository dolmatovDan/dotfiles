-- ~/.config/nvim/lua/plugins/lsp.lua
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
            require("blink.cmp").setup({})

            vim.diagnostic.config({
                float = { border = "rounded" },
                virtual_text = true,
                signs = true,
                underline = true,
                update_in_insert = false,
            })
            vim.api.nvim_create_autocmd('LspAttach', {
                callback = function(args)
                    local client = vim.lsp.get_client_by_id(args.data.client_id)
                    if client and client.supports_method('textDocument/inlayHint') then
                        vim.lsp.inlay_hint.enable(true, { bufnr = args.buf })
                    end
                end,
            })

            local opts = { noremap = true, silent = true }

            vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
            vim.keymap.set("n", "<leader>gf", function()
                vim.lsp.buf.format({ async = true })
            end, opts)
            vim.keymap.set("n", "<leader>tr", "<CMD>Telescope lsp_references<CR>", opts)

            vim.keymap.set({ "i", "s" }, "<C-k>", function()
                vim.lsp.buf.signature_help()
            end, { noremap = true, silent = true })

            local orig_open = vim.lsp.util.open_floating_preview
            function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
                opts = opts or {}
                opts.border = opts.border or "rounded"
                return orig_open(contents, syntax, opts, ...)
            end

            local capabilities = require("blink.cmp").get_lsp_capabilities()

            vim.lsp.config('gopls', {
                capabilities = capabilities,
                cmd = { "ya", "tool", "gopls", "serve" },
                settings = {
                    gopls = {
                        arcadiaIndexDirs = {
                            "~/arcadia/neuro/go",
                            "~/arcadia/neuroexpert/backend/",
                        },
                        expandWorkspaceToModule = false,
                    },
                },
            })
            vim.lsp.enable('gopls')

            vim.lsp.config('lua_ls', { capabilities = capabilities })
            vim.lsp.enable('lua_ls')

            vim.lsp.config('clangd', { capabilities = capabilities })
            vim.lsp.enable('clangd')

            vim.lsp.config('pyright', { capabilities = capabilities })
            vim.lsp.enable('pyright')

            vim.lsp.config('sqlls', { capabilities = capabilities })
            vim.lsp.enable('sqlls')

            vim.lsp.config('rust_analyzer', { capabilities = capabilities })
            vim.lsp.enable('rust_analyzer')
        end,
    }

}
