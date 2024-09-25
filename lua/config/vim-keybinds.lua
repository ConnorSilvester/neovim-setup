vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Disable arrow keys
vim.keymap.set('n', '<left>', '')
vim.keymap.set('n', '<right>', '')
vim.keymap.set('n', '<up>', '')
vim.keymap.set('n', '<down>', '')

-- Change focus
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Workspace
vim.keymap.set('n', '<leader>ws', '<C-w>v', { desc = 'Split window vertically' })
vim.keymap.set('n', '<leader>wc', '<C-w>h', { desc = 'Split window horizontally' })
vim.keymap.set('n', '<leader>wr', '<C-w>=', { desc = 'Resize window back to equal' })
vim.keymap.set('n', '<leader>we', '<cmd>close<CR>', { desc = 'Close current split' })

vim.keymap.set('n', '<leader>wt', '<cmd>tabnew<CR>', { desc = 'Open new tab' })
vim.keymap.set('n', '<leader>wq', '<cmd>tabclose<CR>', { desc = 'Close current tab' })
vim.keymap.set('n', '<leader>wn', '<cmd>tabn<CR>', { desc = 'Go to next tab' })
vim.keymap.set('n', '<leader>wp', '<cmd>tabp<CR>', { desc = 'Go to prev tab' })

-- Save quit
vim.keymap.set('n', '<C-s>', ':w<CR>', { desc = 'Save file' })
vim.keymap.set('n', '<leader>q', ':wq<CR>', { desc = 'Quit and save' })
vim.keymap.set('n', '<leader>Q', ':q!<CR>', { desc = 'Quit without saving' })

-- Terminal
vim.api.nvim_set_keymap('n', '<leader>tt', '<cmd>ToggleTerm direction=horizontal<CR><cmd>lua vim.defer_fn(enter_terminal_mode, 50)<CR>', { noremap = true, silent = true, desc = 'Toggle Terminal' })
vim.api.nvim_set_keymap('n', '<leader>tf', '<cmd>ToggleTerm direction=float<CR><cmd>lua vim.defer_fn(enter_terminal_mode, 50)<CR>', { noremap = true, silent = true, desc = 'Toggle Floating Terminal' })
vim.keymap.set('t', '<Esc>', [[<C-\><C-n><cmd>ToggleTerm<CR>]], { noremap = true, silent = true })

-- Explorer
vim.keymap.set('n', '<leader>ee', '<cmd>NvimTreeToggle<CR>', { desc = 'Toggle file explorer' })
vim.keymap.set('n', '<leader>ef', '<cmd>NvimTreeFindFileToggle<CR>', { desc = 'Toggle find file' })
vim.keymap.set('n', '<leader>ec', '<cmd>NvimTreeCollapse<CR>', { desc = 'Collapse file explorer' })
vim.keymap.set('n', '<leader>er', '<cmd>NvimTreeRefresh<CR>', { desc = 'Refresh file explorer' })

-- Insert Tabs and New Lines
vim.api.nvim_set_keymap('x', '<Tab>', [[:<C-u>lua insert_spaces()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<Tab>', [[:<C-u>lua insert_spaces()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Tab>', [[:lua insert_spaces_normal()<CR>]], { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<CR>', 'o<ESC>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<BS>', 'O<ESC>', { noremap = true, silent = true })

-- Normal Vim remaps
vim.api.nvim_set_keymap('n', 'dx', 'dd', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', 'dd', '"_dd', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'x', '"_x', { noremap = true, silent = true })

vim.api.nvim_set_keymap('v', 'p', '"_dP', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', 'd', '"_d', { noremap = true, silent = true })

vim.keymap.set('n', 'dc', 'd$', { desc = "Delete to end of line" })
-- Telescope Search Keymaps
-- See nvim-telescope.lua

