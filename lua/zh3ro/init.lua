require("zh3ro.set")
print('loaded')
local vimrc = vim.fn.stdpath("config") .. "/lua/zh3ro/vimrc.vim"

vim.cmd('nnoremap <silent> <A-j> :<C-u>call append(line("."),   repeat([""], v:count1))<CR>')
vim.cmd('nnoremap <silent> <A-k> :<C-u>call append(line(".")-1, repeat([""], v:count1))<CR>')

vim.cmd.source(vimrc)
