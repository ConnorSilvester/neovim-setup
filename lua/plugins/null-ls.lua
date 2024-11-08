return {
    'jose-elias-alvarez/null-ls.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' }, -- Ensure plenary is also installed
    config = function()
        local null_ls = require 'null-ls'
        local formatting = null_ls.builtins.formatting

        null_ls.setup {
            sources = {
                formatting.black.with { extra_args = { '--fast' } }, -- Black for Python
            },
            on_attach = function(client, bufnr)
                if client.supports_method 'textDocument/formatting' then
                    -- Create the group if it doesn't exist
                    local group = vim.api.nvim_create_augroup('LspFormatting', { clear = true })
                    vim.api.nvim_clear_autocmds { group = group, buffer = bufnr }
                    vim.api.nvim_create_autocmd('BufWritePre', {
                        group = group,
                        buffer = bufnr,
                        callback = function()
                            vim.lsp.buf.format { bufnr = bufnr }
                        end,
                    })
                end
            end,
        }
    end,
}
