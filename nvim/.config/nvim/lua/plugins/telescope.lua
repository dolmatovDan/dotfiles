return {
    {
        "nvim-telescope/telescope-ui-select.nvim",
    },
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.5",
        dependencies = {
            { "nvim-lua/plenary.nvim" },
            { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        },
        config = function()
            require("telescope").setup({
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown({}),
                    },
                    fzf = {},
                },
            })
            local builtin = require("telescope.builtin")
            vim.keymap.set("n", "<leader>f", builtin.find_files, {})
            vim.keymap.set("n", "<leader>ts", builtin.live_grep, {})
            vim.keymap.set("n", "<leader>tb", builtin.oldfiles, {})
            vim.keymap.set("n", "<leader>vh", ":Telescope help_tags<CR>")
            vim.keymap.set("n", "<leader>tt", ":TodoTelescope<CR>", { desc = "find todos in project" })
            vim.keymap.set(
                "n",
                "<leader>tw",
                require("telescope.builtin").grep_string,
                { desc = "[S]earch current [W]ord" }
            )

            require("telescope").load_extension("ui-select")
            require("telescope").load_extension("harpoon")
            require("telescope").load_extension("fzf")

            require "config.telescope.multigrep".setup()
        end,
    },
}
