return {
    'johmsalas/text-case.nvim',
    dependencies = { 'nvim-telescope/telescope.nvim' },
    config = function()
        -- Disable default key mappings and load Telescope extension
        require('textcase').setup {
            default_keymappings_enabled = false, -- Disable default key mappings
            prefix = '<leader>rc', -- Set custom prefix for all commands
        }
        require('telescope').load_extension 'textcase'

        -- Custom key mappings with <leader>rc prefix
        local map = vim.api.nvim_set_keymap
        local opts = { noremap = true, silent = true }

        -- Current word mappings
        map('n', '<leader>rcu', '<cmd>lua require("textcase").current_word("to_upper_case")<CR>', vim.tbl_extend('force', opts, { desc = 'case: UPPER_CASE' }))
        map('n', '<leader>rcl', '<cmd>lua require("textcase").current_word("to_lower_case")<CR>', vim.tbl_extend('force', opts, { desc = 'case: lower_case' }))
        map('n', '<leader>rcs', '<cmd>lua require("textcase").current_word("to_snake_case")<CR>', vim.tbl_extend('force', opts, { desc = 'case: snake_case' }))
        map('n', '<leader>rcd', '<cmd>lua require("textcase").current_word("to_dash_case")<CR>', vim.tbl_extend('force', opts, { desc = 'case: dash-case' }))
        map(
            'n',
            '<leader>rcn',
            '<cmd>lua require("textcase").current_word("to_constant_case")<CR>',
            vim.tbl_extend('force', opts, { desc = 'case: CONSTANT_CASE' })
        )
        map('n', '<leader>rc.', '<cmd>lua require("textcase").current_word("to_dot_case")<CR>', vim.tbl_extend('force', opts, { desc = 'case: dot.case' }))
        map('n', '<leader>rc,', '<cmd>lua require("textcase").current_word("to_comma_case")<CR>', vim.tbl_extend('force', opts, { desc = 'case: comma,case' }))
        map(
            'n',
            '<leader>rca',
            '<cmd>lua require("textcase").current_word("to_phrase_case")<CR>',
            vim.tbl_extend('force', opts, { desc = 'case: phrase case' })
        )
        map('n', '<leader>rcc', '<cmd>lua require("textcase").current_word("to_camel_case")<CR>', vim.tbl_extend('force', opts, { desc = 'case: camelCase' }))
        map('n', '<leader>rcp', '<cmd>lua require("textcase").current_word("to_pascal_case")<CR>', vim.tbl_extend('force', opts, { desc = 'case: PascalCase' }))
        map('n', '<leader>rct', '<cmd>lua require("textcase").current_word("to_title_case")<CR>', vim.tbl_extend('force', opts, { desc = 'case: Title Case' }))
        map('n', '<leader>rcf', '<cmd>lua require("textcase").current_word("to_path_case")<CR>', vim.tbl_extend('force', opts, { desc = 'case: path-case' }))

        -- LSP rename mappings
        map('n', '<leader>rcU', '<cmd>lua require("textcase").lsp_rename("to_upper_case")<CR>', vim.tbl_extend('force', opts, { desc = 'LSP: UPPER_CASE' }))
        map('n', '<leader>rcL', '<cmd>lua require("textcase").lsp_rename("to_lower_case")<CR>', vim.tbl_extend('force', opts, { desc = 'LSP: lower_case' }))
        map('n', '<leader>rcS', '<cmd>lua require("textcase").lsp_rename("to_snake_case")<CR>', vim.tbl_extend('force', opts, { desc = 'LSP: snake_case' }))
        map('n', '<leader>rcD', '<cmd>lua require("textcase").lsp_rename("to_dash_case")<CR>', vim.tbl_extend('force', opts, { desc = 'LSP: dash-case' }))
        map(
            'n',
            '<leader>rcN',
            '<cmd>lua require("textcase").lsp_rename("to_constant_case")<CR>',
            vim.tbl_extend('force', opts, { desc = 'LSP: CONSTANT_CASE' })
        )
        map('n', '<leader>rc.', '<cmd>lua require("textcase").lsp_rename("to_dot_case")<CR>', vim.tbl_extend('force', opts, { desc = 'LSP: dot.case' }))
        map('n', '<leader>rc,', '<cmd>lua require("textcase").lsp_rename("to_comma_case")<CR>', vim.tbl_extend('force', opts, { desc = 'LSP: comma,case' }))
        map('n', '<leader>rcA', '<cmd>lua require("textcase").lsp_rename("to_phrase_case")<CR>', vim.tbl_extend('force', opts, { desc = 'LSP: phrase case' }))
        map('n', '<leader>rcC', '<cmd>lua require("textcase").lsp_rename("to_camel_case")<CR>', vim.tbl_extend('force', opts, { desc = 'LSP: camelCase' }))
        map('n', '<leader>rcP', '<cmd>lua require("textcase").lsp_rename("to_pascal_case")<CR>', vim.tbl_extend('force', opts, { desc = 'LSP: PascalCase' }))
        map('n', '<leader>rcT', '<cmd>lua require("textcase").lsp_rename("to_title_case")<CR>', vim.tbl_extend('force', opts, { desc = 'LSP: Title Case' }))
        map('n', '<leader>rcF', '<cmd>lua require("textcase").lsp_rename("to_path_case")<CR>', vim.tbl_extend('force', opts, { desc = 'LSP: path-case' }))
    end,
    keys = {
        { '<leader>rc.', '<cmd>TextCaseOpenTelescope<CR>', mode = { 'n', 'x' }, desc = 'Telescope' },
    },
    cmd = {
        'Subs',
        'TextCaseOpenTelescope',
        'TextCaseOpenTelescopeQuickChange',
        'TextCaseOpenTelescopeLSPChange',
        'TextCaseStartReplacingCommand',
    },
    lazy = false,
}
