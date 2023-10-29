local key_map = function(mode, key, result)
  vim.api.nvim_set_keymap(
    mode,
    key,
    result,
    {noremap = true, silent = true}
  )
end

function quit_window_delete_buffer()
    vim.cmd('bdelete!')
end

key_map('n', '<c-t>', ':lua vim.cmd("tabnew")<CR>')
key_map('n', '<c-x>', ':lua quit_window_delete_buffer()<CR>')
key_map('n', '"', ':lua vim.cmd("tabnext")<CR>')
key_map('n', '<s-tab>', ':lua vim.cmd("tabprevious")<CR>')
