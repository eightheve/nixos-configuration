-- treesitter
require("nvim-treesitter.configs").setup({
  highlight = { enable = true },
  indent = { enable = true },
})

require("nvim-paredit").setup({})

require("lualine").setup({})
require("which-key").setup({})
vim.cmd('packadd conjure')

vim.g.mapleader = " "
vim.g.maplocalleader = " "
