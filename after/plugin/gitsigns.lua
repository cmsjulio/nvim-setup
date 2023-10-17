--print("gitsigns loaded")


    require('gitsigns').setup {
      signs = {
        add          = { text = '+' },
        change       = { text = 'M' },
        delete       = { text = '_' },
        topdelete    = { text = '‾' },
        changedelete = { text = '~' },
        untracked    = { text = '┆' },
      }}
