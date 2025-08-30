vim.keymap.set("i", "jk", "<ESC>")
vim.keymap.set("i", "jK", "<ESC>")
vim.keymap.set("i", "Jk", "<ESC>")
vim.keymap.set("i", "JK", "<ESC>")
vim.wo.number = true

vim.keymap.set("c", "<C-p>", "<Up>")

vim.keymap.set("c", "<C-n>", "<Down>")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("x", "<leader>p", '"_dP')
vim.keymap.set("n", "<leader><leader>p", '"0p')

vim.keymap.set("n", "<leader>y", '"+y')
vim.keymap.set("v", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>Y", '"+Y')

vim.keymap.set("n", "<leader>c", '"+c')
vim.keymap.set("v", "<leader>c", '"+c')

-- quick fixes
vim.keymap.set("n", "<M-j>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<M-k>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

vim.keymap.set("n", "]b", ":bnext<CR>")
vim.keymap.set("n", "[b", ":bprev<CR>")
vim.keymap.set("n", "]B", ":bfirst<CR>")
vim.keymap.set("n", "[B", ":bnext<CR>")
vim.keymap.set("n", "<leader>bd", ":bdelete<CR>")

vim.keymap.set("c", "%%", "getcmdtype() == ':' ? expand('%:h').'/' : '%%'", { expr = true })

vim.keymap.set("n", "<C-o>", "<C-o>zz")
vim.keymap.set("n", "<C-i>", "<C-i>zz")
vim.keymap.set("n", "G", "Gzz")

function VSetSearch()
 local temp = vim.fn.getreg("s") -- Get the contents of register 's'
 vim.cmd('normal! gv"sy') -- Select the visually highlighted text and copy it to register 's'
 -- Set the search register '/' with the escaped content of register 's'
 local search_pattern = "\\V" .. vim.fn.substitute(vim.fn.escape(vim.fn.getreg("s"), "/\\"), "\n", "\\n", "g")
 vim.fn.setreg("/", search_pattern)
 -- Restore the original content of register 's'
 vim.fn.setreg("s", temp)
end

-- Create mappings for visual mode
vim.api.nvim_set_keymap("x", "*", ":<C-u>lua VSetSearch()<CR>/<C-R>=@/<CR><CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("x", "#", ":<C-u>lua VSetSearch()<CR>?<C-R>=@/<CR><CR>", { noremap = true, silent = true })

vim.keymap.set("n", "<leader>h", ":nohl<CR>")
