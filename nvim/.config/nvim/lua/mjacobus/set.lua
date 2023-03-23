vim.opt.guicursor = ""

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"


vim.o.ignorecase = true
vim.o.hidden = true
vim.o.smartcase = true
vim.o.background = "dark"
vim.wo.number = true
vim.wo.numberwidth = 2
-- vim.cmd([[colorscheme OceanicNext]])
-- vim.cmd([[colorscheme palenight]])
vim.api.nvim_set_option('clipboard', 'unnamed')

-- vim.api.nvim_exec("source ~/.config/nvim/config.vim", true)
