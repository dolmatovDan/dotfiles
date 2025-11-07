return {
  "mrcjkb/haskell-tools.nvim",
  ft = { "haskell", "lhaskell", "cabal", "cabalproject" },
  version = "^6",
  config = function()
    local ht = require("haskell-tools")
    vim.keymap.set('n', '<leader>hs', ht.hoogle.hoogle_signature, {buffer=0, desc="Hoogle signature"})
  end,
}

