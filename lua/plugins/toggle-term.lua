return {
    'akinsho/toggleterm.nvim',
    config = function()
        require('toggleterm').setup {
            size = 10, -- Default size of the terminal
            open_mapping = [[<c-\>]], -- Global mapping to toggle the terminal
            direction = 'horizontal', -- Default direction for normal terminals
            float_opts = {
                border = 'curved', -- Border style (options: 'single', 'double', 'shadow', 'curved', etc.)
                width = 150, -- Width of the floating terminal
                height = 25, -- Height of the floating terminal
                winblend = 3, -- Transparency level of the floating terminal
                highlights = {
                    border = 'Normal', -- Border highlight group
                    background = 'Normal', -- Background highlight group
                },
            },
        }
    end,
}
