return {
    {
        "leoluz/nvim-dap-go",
        dependencies = {
            "mfussenegger/nvim-dap",
        },
        ft = "go",
        config = function()
            require("dap-go").setup()
            vim.keymap.set('n', '<leader>dt', require('dap-go').debug_test())
        end
    },
}
