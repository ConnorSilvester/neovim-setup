return {
    'matze/vim-move',
    keys = {
        -- Move line down with Alt+j
        { '<M-j>', '<Plug>MoveLineDown', mode = 'n', desc = 'Move line down' },
        { '<M-j>', '<Plug>MoveBlockDown', mode = 'v', desc = 'Move selection down' },

        -- Move line up with Alt+k
        { '<M-k>', '<Plug>MoveLineUp', mode = 'n', desc = 'Move line up' },
        { '<M-k>', '<Plug>MoveBlockUp', mode = 'v', desc = 'Move selection up' },
    },
}
