-- check after/plugin/lazy-keymap.lua for other mappings
require("zh3ro.set")
local vimrc = vim.fn.stdpath("config") .. "/lua/zh3ro/vimrc.vim"
vim.cmd.source(vimrc)

vim.cmd('nnoremap <silent> <A-j> :<C-u>call append(line("."),   repeat([""], v:count1))<CR>')
vim.cmd('nnoremap <silent> <A-k> :<C-u>call append(line(".")-1, repeat([""], v:count1))<CR>')

vim.cmd('nnoremap <silent> <c-t> :lua vim.cmd("tabnew")<CR>')
vim.cmd('nnoremap <silent> <c-w> :bdelete!<CR>')
vim.cmd('nnoremap <silent> " :tabnext<CR>')
vim.cmd('nnoremap <silent> <s-tab> :tabprevious<CR>')

-- select all with <c-a>
vim.cmd('nnoremap <silent> <c-a> ggVG')


-- Esc in terminal mode (:ter) send back to normal mode
vim.cmd('tnoremap <silent> <Esc> <C-\\><c-n>')



