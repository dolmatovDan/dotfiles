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

            vim.keymap.set("n", "gd", "<CMD>lua vim.lsp.buf.definition()<CR>", opts)
            vim.keymap.set("n", "<leader>gf", "<CMD>lua vim.lsp.buf.format()<CR>", opts)
            vim.keymap.set("n", "<leader>tr", "<CMD>Telescope lsp_references<CR>", opts)

            vim.api.nvim_set_keymap("i", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>",
                { noremap = true, silent = true })
            vim.api.nvim_set_keymap("s", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>",
                { noremap = true, silent = true })


            local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
            function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
                opts = opts or {}
                opts.border = opts.border or "rounded" -- Force rounded borders
                return orig_util_open_floating_preview(contents, syntax, opts, ...)
            end

            local capabilities = require("blink.cmp").get_lsp_capabilities()

            vim.lsp.config('gopls', {
                capabilities = capabilities,
                cmd = { "ya", "tool", "gopls", "serve" },
                settings = {
                    gopls = {
                        arcadiaIndexDirs = {
                            '~/arcadia/neuro/go',
                            '~/arcadia/neuroexpert/backend/',
                        },
                        expandWorkspaceToModule = false,
                    }
                }
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
    },
    -- {
    --     "saghen/blink.cmp",
    --     optional = true,
    --     opts = {
    --         sources = {
    --             default = { "dadbod" },
    --             providers = {
    --                 dadbod = { name = "Dadbod", module = "vim_dadbod_completion.blink" },
    --             },
    --         },
    --     },
    --     dependencies = {
    --         "kristijanhusak/vim-dadbod-completion",
    --     },
    -- },
}
