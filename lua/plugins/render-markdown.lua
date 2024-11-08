return {
    'MeanderingProgrammer/render-markdown.nvim',
    ft = { 'markdown' },
    dependencies = {
        'nvim-lua/plenary.nvim',
    },
    config = function()
        require('render-markdown').setup {
            heading = {
                enabled = false,
            },
            file_types = { 'markdown' },
        }
    end,
}
