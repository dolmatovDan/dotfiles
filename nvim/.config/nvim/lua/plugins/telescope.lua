return {
 {
  "nvim-telescope/telescope-ui-select.nvim",
 },
 {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.5",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
   require("telescope").setup({
    extensions = {
     ["ui-select"] = {
      require("telescope.themes").get_dropdown({}),
     },
    },
   })
   local builtin = require("telescope.builtin")
   vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
   vim.keymap.set("n", "<leader>fs", builtin.live_grep, {})
   vim.keymap.set("n", "<leader>fb", builtin.oldfiles, {})
   vim.keymap.set("n", "<leader>vh", ":Telescope help_tags<CR>")
   vim.keymap.set(
    "n",
    "<leader>fw",
    require("telescope.builtin").grep_string,
    { desc = "[S]earch current [W]ord" }
   )

   require("telescope").load_extension("ui-select")
   require("telescope").load_extension("harpoon")
  end,
 },
}
