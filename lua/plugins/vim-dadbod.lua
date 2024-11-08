return {
    { 'tpope/vim-dadbod', lazy = true },
    {
        'kristijanhusak/vim-dadbod-ui',
        dependencies = { 'tpope/vim-dadbod' },
        cmd = { 'DBUI', 'DBUIToggle', 'DBUIAddConnection', 'DBUIFindBuffer' },
        init = function()
            vim.g.db_ui_use_nerd_fonts = 1

            vim.g.db_ui_window_width = 40
            vim.g.db_ui_window_height = 20
            vim.g.db_ui_window_position = 'right'
        end,
    },
}
