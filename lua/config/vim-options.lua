-- Leader
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Font
vim.g.have_nerd_font = true

-- Lines
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
vim.opt.signcolumn = 'yes'
vim.opt.number = true
vim.opt.wrap = false
vim.opt.breakindent = true
vim.opt.cursorline = true

-- Line indents
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.tabstop = 4
vim.opt.expandtab = true
vim.opt.autoindent = true

-- Search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Always split right and below
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Enable spell checking globally
vim.opt.spell = true
vim.opt.spelllang = 'en_us'
vim.opt.spellcapcheck = ""
vim.opt.spelloptions:append "camel"

-- General
vim.opt.guicursor = 'n-v-c:block,i-ci-ve:block,r-cr:hor20,o:hor50'
vim.opt.backspace = 'indent,eol,start'
vim.opt.clipboard = 'unnamedplus'
vim.opt.inccommand = 'split'
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300
vim.opt.scrolloff = 10
vim.opt.termguicolors = true
vim.opt.undofile = true
vim.cmd("syntax on")
