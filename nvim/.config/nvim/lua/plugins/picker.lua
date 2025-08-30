return {
    'nvim-mini/mini.pick',
    version = '*' ,
    config = function ()
        require('mini.pick').setup()
        vim.keymap.set('n', '<leader>ff', ":Pick files<CR>")
        vim.keymap.set('n', '<leader>vh', ":Pick help<CR>")
        vim.keymap.set('n', '<leader>fs', ":Pick grep_live<CR>")
    end
}
