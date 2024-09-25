return {
    -- Main LSP Configuration
    'neovim/nvim-lspconfig',
    dependencies = {
        { 'williamboman/mason.nvim', config = true },
        'williamboman/mason-lspconfig.nvim',
        'WhoIsSethDaniel/mason-tool-installer.nvim',
        { 'j-hui/fidget.nvim', opts = {} },
        'hrsh7th/cmp-nvim-lsp',
    },
    config = function()
        vim.api.nvim_create_autocmd('LspAttach', {
            group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
            callback = function(event)
                local map = function(keys, func, desc, mode)
                    mode = mode or 'n'
                    vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
                end

                map('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
                map('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
                map('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
                map('<leader>sa', require('telescope.builtin').lsp_document_symbols, 'Search Alias')
                map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
                map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

                local client = vim.lsp.get_client_by_id(event.data.client_id)
                if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
                    local highlight_augroup = vim.api.nvim_create_augroup('kickstart-lsp-highlight', { clear = false })
                    vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
                        buffer = event.buf,
                        group = highlight_augroup,
                        callback = vim.lsp.buf.document_highlight,
                    })

                    vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
                        buffer = event.buf,
                        group = highlight_augroup,
                        callback = vim.lsp.buf.clear_references,
                    })

                    vim.api.nvim_create_autocmd('LspDetach', {
                        group = vim.api.nvim_create_augroup('kickstart-lsp-detach', { clear = true }),
                        callback = function(event2)
                            vim.lsp.buf.clear_references()
                            vim.api.nvim_clear_autocmds { group = 'kickstart-lsp-highlight', buffer = event2.buf }
                        end,
                    })
                end
            end,
        })

        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

        local servers = {
            clangd = {},
            gradle_ls = {},
            jdtls = {},
            cmake = {},
            bashls = {},
            solargraph = {},
            lua_ls = {
                settings = {
                    Lua = {
                        completion = {
                            callSnippet = 'Replace',
                        },
                    },
                },
            },
        }

        require('mason').setup()
        local ensure_installed = vim.tbl_keys(servers or {})
        vim.list_extend(ensure_installed, {
            'clangd',
            'stylua',
            'gradle_ls',
            'jdtls',
            'cmake-language-server',
            'bash-language-server',
            'solargraph',
        })
        require('mason-tool-installer').setup { ensure_installed = ensure_installed }

        require('mason-lspconfig').setup {
            handlers = {
                function(server_name)
                    local server = servers[server_name] or {}
                    server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
                    require('lspconfig')[server_name].setup(server)
                end,
            },
        }

        -- Additional LSP configurations
        require('lspconfig').jdtls.setup {
            cmd = { 'jdtls' },
            root_dir = require('lspconfig.util').root_pattern('.git', 'pom.xml', 'build.gradle'),
            settings = {
                java = {
                    contentProvider = {
                        preferred = 'fernflower',
                    },
                    codeGeneration = {
                        toString = {
                            includePackage = true,
                            includeType = true,
                            includeModifiers = true,
                        },
                        useBlocks = true,
                    },
                    completion = {
                        importOrder = {
                            'java',
                            'javax',
                            'com',
                            'org',
                            'net',
                        },
                    },
                },
            },
        }

        require('lspconfig').cmake.setup {
            cmd = { 'cmake-language-server', 'start' },
            root_dir = require('lspconfig.util').root_pattern('CMakeLists.txt', '.git'),
        }

        require('lspconfig').bashls.setup {
            cmd = { 'bash-language-server', 'start' },
            root_dir = require('lspconfig.util').root_pattern '.git',
            filetypes = { 'sh' },
        }

        require('lspconfig').solargraph.setup {
            cmd = { 'solargraph', 'stdio' },
            root_dir = require('lspconfig.util').root_pattern '.git',
            filetypes = { 'ruby' },
        }
    end,
}
