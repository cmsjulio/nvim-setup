vim.opt.completeopt = { "menu", "menuone", "noselect" }
vim.opt.shortmess:append "c"

local cmp = require "cmp"

cmp.setup {
  sources = {
    { name = "nvim_lsp" },
    { name = "cody" },
    { name = "path" },
    { name = "buffer" },
  },
  mapping = {
    ["<C-n>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert },
    ["<C-p>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert },
    ["<C-y>"] = cmp.mapping(
      cmp.mapping.confirm {
        behavior = cmp.ConfirmBehavior.Insert,
        select = true,
      },
      { "i", "c" }
    ),
  },

}

-- Setup up vim-dadbod
cmp.setup.filetype({ "sql" }, {
  sources = {
    { name = "vim-dadbod-completion" },
    { name = "buffer" },
  },
})
