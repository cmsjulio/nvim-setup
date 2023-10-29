local key_map = function(mode, key, result)
  vim.api.nvim_set_keymap(
    mode,
    key,
    result,
    {noremap = true, silent = true}
  )
end

local lsp_zero = require('lsp-zero')
lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
lsp_zero.default_keymaps({buffer = bufnr})
key_map('n', '<leader>gr', ":lua require('telescope.builtin').lsp_references()<CR>")
end)


-- require("mason").setup()

-- require('mason-lspconfig').setup({
--   ensure_installed = {
--   },
--   handlers = {
--     lsp_zero.default_setup,
--   },
-- })
-- 
