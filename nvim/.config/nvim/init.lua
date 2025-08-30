vim.g.mapleader = " "
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    { import = "plugins" },
})

require("keys")
require("opts")

vim.keymap.set('i', "jk", '<Esc>', { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("s", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", { noremap = true, silent = true })

local format_sync_grp = vim.api.nvim_create_augroup("goimports", {})
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
   require('go.format').goimports()
  end,
  group = format_sync_grp,
})
