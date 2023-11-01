-- check after/plugin/lazy-keymap.lua for other mappings
require("zh3ro.set")
local vimrc = vim.fn.stdpath("config") .. "/lua/zh3ro/vimrc.vim"
vim.cmd.source(vimrc)

-- appending lines above and below
vim.cmd('nnoremap <silent> <A-j> :<C-u>call append(line("."),   repeat([""], v:count1))<CR>')
vim.cmd('nnoremap <silent> <A-k> :<C-u>call append(line(".")-1, repeat([""], v:count1))<CR>')

-- window/tab navigation
vim.cmd('nnoremap <silent> <c-t> :tabnew<CR>')
vim.cmd('nnoremap <silent> <c-w> :bdelete!<CR>')
vim.cmd('nnoremap <silent> " :tabnext<CR>')
vim.cmd('nnoremap <silent> <s-tab> :tabprevious<CR>')
vim.cmd('nnoremap <silent> <c-space><c-o> :split %<CR>')
vim.cmd('nnoremap <silent> <c-space><c-e> :vsplit %<CR>')
vim.cmd('nnoremap <silent> <leader>o :tabnew %<CR>')
vim.cmd('nnoremap <silent> <A-o> :only<CR>')

vim.cmd('nnoremap <silent> <leader>h <c-w>h')
vim.cmd('nnoremap <silent> <leader>j <c-w>j')
vim.cmd('nnoremap <silent> <leader>k <c-w>k')
vim.cmd('nnoremap <silent> <leader>l <c-w>l')
vim.cmd('nnoremap <silent> <leader>o :tabnew %<CR>')
vim.cmd('nnoremap <silent> <leader>c <c-w>c')
vim.cmd('nnoremap <silent> <leader>w <c-6>') --reopen last visited buffer
-- select all with <c-a>
vim.cmd('nnoremap <silent> <c-a> ggVG')


-- Esc in terminal mode (:ter) send back to normal mode
vim.cmd('tnoremap <silent> <Esc> <C-\\><c-n>')



