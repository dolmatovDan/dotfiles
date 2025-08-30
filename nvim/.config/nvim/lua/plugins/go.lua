return {
 {
  "ray-x/go.nvim",
  dependencies = { -- optional packages
   "ray-x/guihua.lua",
   "neovim/nvim-lspconfig",
   "nvim-treesitter/nvim-treesitter",
  },
  config = function()
   require("go").setup()
  end,
  event = { "CmdlineEnter" },
  ft = { "go", "gomod" },
  build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
 },
 {
  "maxandron/goplements.nvim",
  ft = "go",
  opts = {
   -- your configuration comes here
   -- or leave it empty to use the default settings
   -- refer to the configuration section below
  },
 },
}
