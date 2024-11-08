vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Disable arrow keys
vim.keymap.set('n', '<left>', '')
vim.keymap.set('n', '<right>', '')
vim.keymap.set('n', '<up>', '')
vim.keymap.set('n', '<down>', '')

-- Change focus
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })

-- Workspace
vim.keymap.set('n', '<leader>ws', '<C-w>v', { desc = 'Split window vertically' })
vim.keymap.set('n', '<leader>wc', '<C-w>s', { desc = 'Split window horizontally' })
vim.keymap.set('n', '<leader>wr', '<C-w>=', { desc = 'Resize window back to equal' })
vim.keymap.set('n', '<leader>we', '<cmd>close<CR>', { desc = 'Close current split' })

vim.keymap.set('n', '<leader>wt', '<cmd>tabnew<CR>', { desc = 'Open new tab' })
vim.keymap.set('n', '<leader>wq', '<cmd>tabclose<CR>', { desc = 'Close current tab' })
vim.keymap.set('n', '<leader>wn', '<cmd>tabn<CR>', { desc = 'Go to next tab' })
vim.keymap.set('n', '<leader>wp', '<cmd>tabp<CR>', { desc = 'Go to prev tab' })

-- Restart Java LSP
vim.api.nvim_set_keymap('n', '<leader>wj', ':LspRestart jdtls<CR>', { noremap = true, silent = true })

-- Save quit
vim.keymap.set('n', '<C-s>', ':w<CR>', { desc = 'Save file' })
vim.keymap.set('n', '<leader>q', ':wq<CR>', { desc = 'Quit and save' })
vim.keymap.set('n', '<leader>Q', ':q!<CR>', { desc = 'Quit without saving' })

-- Terminal
vim.api.nvim_set_keymap('n', '<leader>tt', '<cmd>ToggleTerm direction=horizontal<CR><cmd>lua vim.defer_fn(enter_terminal_mode, 50)<CR>', { noremap = true, silent = true, desc = 'Toggle Terminal' })
vim.api.nvim_set_keymap('n', '<leader>tf', '<cmd>ToggleTerm direction=float<CR><cmd>lua vim.defer_fn(enter_terminal_mode, 50)<CR>', { noremap = true, silent = true, desc = 'Toggle Floating Terminal' })
vim.keymap.set('t', '<Esc>', [[<C-\><C-n><cmd>ToggleTerm<CR>]], { noremap = true, silent = true })
vim.keymap.set('t', '<C-q>', [[<C-\><C-n><cmd>ToggleTerm<CR>]], { noremap = true, silent = true })
vim.keymap.set('t', '<C-d>', [[<C-\><C-n>]], { noremap = true, silent = true })
vim.keymap.set('t', '<C-u>', [[<C-\><C-n>]], { noremap = true, silent = true })

-- Markdown
vim.api.nvim_set_keymap('n', '<leader>tg', ':MarkdownPreview<CR>', { noremap = true, silent = true, desc = 'Markdown Preview Online' })

-- Dadbod
vim.api.nvim_set_keymap('n', '<leader>ed', ':DBUIToggle<CR>', { noremap = true, silent = true })

-- Explorer
vim.keymap.set('n', '<leader>ee', '<cmd>NvimTreeToggle<CR>', { desc = 'Toggle file explorer' })
vim.keymap.set('n', '<leader>ef', '<cmd>NvimTreeFindFileToggle<CR>', { desc = 'Toggle find file' })
vim.keymap.set('n', '<leader>ec', '<cmd>NvimTreeCollapse<CR>', { desc = 'Collapse file explorer' })
vim.keymap.set('n', '<leader>er', '<cmd>NvimTreeRefresh<CR>', { desc = 'Refresh file explorer' })
vim.keymap.set('n', '<leader>e=', '<cmd>NvimTreeResize +10<CR>', { desc = 'Extend' })
vim.keymap.set('n', '<leader>e-', '<cmd>NvimTreeResize -10<CR>', { desc = 'Shrink' })

-- Insert Tabs and New Lines
vim.api.nvim_set_keymap('x', '<Tab>', [[:<C-u>lua insert_spaces()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<Tab>', [[:<C-u>lua insert_spaces()<CR>]], { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<CR>', 'o<ESC>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<BS>', 'O<ESC>', { noremap = true, silent = true })

-- Spell check remaps
vim.api.nvim_set_keymap('n', '<leader>ga', 'zg', { noremap = true, silent = true, desc = 'Add word to spell list' })
vim.api.nvim_set_keymap('n', '<leader>gr', 'zug', { noremap = true, silent = true, desc = 'Remove word from spell list' })
vim.api.nvim_set_keymap('n', '<leader>gg', 'z=', { noremap = true, silent = true, desc = 'Replace spelling mistake' })
vim.api.nvim_set_keymap('n', '<leader>gG', ':spellr<CR>', { noremap = true, silent = true, desc = 'Replace spelling mistake' })
vim.api.nvim_set_keymap('n', '<leader>gn', ']s', { noremap = true, silent = true, desc = 'Next spelling error' })
vim.api.nvim_set_keymap('n', '<leader>gp', '[s', { noremap = true, silent = true, desc = 'Previous spelling error' })
vim.api.nvim_set_keymap('n', '<leader>gt', ':set spell!<CR>', { noremap = true, silent = true, desc = 'Toggle spell checking' })

-- Obsidian Keybindings
vim.keymap.set('n', '<leader>oo', ':cd /home/connor/MainFiles/Obsidian/Main<CR>', { noremap = true, silent = true, desc = 'Obsidian: CD to vault' })
vim.keymap.set('n', '<leader>on', ':lua create_note()<CR>', { noremap = true, silent = true, desc = 'Obsidian: New Note' })
vim.keymap.set('n', '<leader>ol', ':ObsidianBacklinks<CR>', { noremap = true, silent = true, desc = 'Obsidian: Backlinks' })
vim.keymap.set('n', '<leader>ot', ':ObsidianTemplate new_note_template.md<CR>', { noremap = true, silent = true, desc = 'Obsidian: Add not template' })
vim.keymap.set('n', '<leader>of', ':s/\\(# \\)[^_]*_/\\1/ | s/_/ /g | nohlsearch<CR>', { noremap = true, silent = true, desc = 'Obsidian: Format title' })
vim.keymap.set('n', '<leader>op', ':ObsidianPasteImg<CR>', { noremap = true, silent = true, desc = 'Obsidian: Paste Image' })
vim.keymap.set('n', '<leader>od', ':lua RemoveBeforePipe()<CR>', { noremap = true, silent = true, desc = 'Obsidian: RemoveBeforePipe' })

-- Normal Vim remaps
vim.keymap.set('n', 'dc', 'd$', { desc = 'Delete to end of line' })
vim.keymap.set('n', '<leader>k', '<cmd>nohlsearch<CR>', { desc = 'Clear Search' })
vim.keymap.set('n', '<leader>j', '<ESC>', { desc = 'ESC' })
vim.keymap.set('v', '<leader>j', '<ESC>', { desc = 'ESC' })

-- Bullet Point
vim.api.nvim_set_keymap('n', '<leader>b', 'I- <Esc>', { noremap = true, silent = true, desc = 'Make line a bullet point' })

vim.api.nvim_set_keymap('n', '<Leader>h', '<C-o>', { noremap = true, silent = true, desc = 'Next Jump' })
vim.api.nvim_set_keymap('n', '<Leader>l', '<C-i>', { noremap = true, silent = true, desc = 'Prev Jump' })

vim.api.nvim_set_keymap('n', '<Tab>', ':bnext<CR>', { noremap = true, silent = true, desc = 'Next Buffer' })
vim.api.nvim_set_keymap('n', '<S-Tab>', ':bprevious<CR>', { noremap = true, silent = true, desc = 'Prev Buffer' })

vim.keymap.set('i', '<BS>', MultiCursorBackspace, { desc = 'Delete backward across all cursors' })

-- Telescope Search Keymaps
-- See nvim-telescope.lua
