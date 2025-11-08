vim.keymap.set('n', '<F7>', function()
    vim.cmd('!g++ -std=c++17 -Wextra -g -fsanitize=address,undefined -fno-omit-frame-pointer -DLOCAL -Wall -O2 % -o %:r')
end, {})

vim.keymap.set('n', '<F8>', function()
    vim.cmd('!g++ -std=c++17 -Wextra -DLOCAL -Wall -O2 % -o %:r')
end, {})
