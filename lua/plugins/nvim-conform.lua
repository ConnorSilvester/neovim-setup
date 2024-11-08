return {
    'stevearc/conform.nvim',
    event = { 'BufWritePre' },
    cmd = { 'ConformInfo' },
    keys = {
        {
            '<leader>f',
            function()
                require('conform').format { async = true, lsp_format = 'fallback' }
            end,
            mode = '',
            desc = '[F]ormat buffer',
        },
    },
    opts = {
        notify_on_error = false,
        format_on_save = function(_)
            -- Always disable format on save
            return false
        end,
        formatters_by_ft = {
            lua = { 'stylua' },
            cmake = { 'cmake-format' },
            java = { 'clang_format' },
            make = { 'shfmt' },
        },
    },
}
