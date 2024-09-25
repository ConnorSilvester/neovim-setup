return {
    'nvim-tree/nvim-tree.lua',
    version = '*',
    lazy = false,
    dependencies = {
        'nvim-tree/nvim-web-devicons',
    },
    config = function()
        require('nvim-tree').setup {}

        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1

        require('nvim-tree').setup {
            sort = {
                sorter = 'case_sensitive',
            },
            view = {
                width = 30,
                relativenumber = true,
            },
            renderer = {
                indent_markers = {
                    enable = true,
                },
            },
            actions = {
                open_file = {
                    window_picker = {
                        enable = false,
                    },
                },
            },
            filters = {
                custom = { '.DS_Store' },
            },
            git = {
                ignore = false,
            },
        }
    end,
}
