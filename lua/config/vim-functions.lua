local function disable_spell_check_for_filetypes()
    local ignore_spell_filetypes = { 'lua' }

    local ft = vim.bo.filetype
    if vim.tbl_contains(ignore_spell_filetypes, ft) then
        vim.opt.spell = false
    end
end

vim.api.nvim_create_autocmd('FileType', {
    callback = disable_spell_check_for_filetypes,
})

vim.cmd [[
augroup MySpellCheck
    autocmd!
    autocmd FileType * syntax match SpellCheck /\w\+/
augroup END
]]

vim.api.nvim_create_autocmd('TextYankPost', {
    group = vim.api.nvim_create_augroup('highlight_yank', {}),
    desc = 'Hightlight selection on yank',
    pattern = '*',
    callback = function()
        vim.highlight.on_yank { higroup = 'IncSearch', timeout = 500 }
    end,
})

vim.cmd [[
  augroup GlobalSettings
    autocmd!
    autocmd BufRead,BufNewFile * setlocal shiftwidth=4 tabstop=4 softtabstop=4 expandtab
  augroup END
]]

function _G.enter_terminal_mode()
    vim.cmd 'startinsert'
end

if vim.fn.has 'wsl' == 1 then
    if vim.fn.executable 'wl-copy' == 0 then
        print "wl-clipboard not found, clipboard integration won't work"
    else
        vim.g.clipboard = {
            name = 'wl-clipboard (wsl)',
            copy = {
                ['+'] = 'wl-copy --foreground --type text/plain',
                ['*'] = 'wl-copy --foreground --primary --type text/plain',
            },
            paste = {
                ['+'] = function()
                    return vim.fn.systemlist('wl-paste --no-newline|sed -e "s/\r$//"', { '' }, 1) -- '1' keeps empty lines
                end,
                ['*'] = function()
                    return vim.fn.systemlist('wl-paste --primary --no-newline|sed -e "s/\r$//"', { '' }, 1)
                end,
            },
            cache_enabled = true,
        }
    end
end

function _G.insert_spaces()
    local start_pos = vim.fn.getpos "'<"
    local end_pos = vim.fn.getpos "'>"
    local start_line = start_pos[2]
    local end_line = end_pos[2]
    local spaces = '    '

    for line = start_line, end_line do
        vim.fn.setline(line, spaces .. vim.fn.getline(line))
    end

    vim.fn.setpos("'<", start_pos)
    vim.fn.setpos("'>", end_pos)
    vim.cmd 'normal! gv'
end

function _G.insert_spaces_normal()
    local line = vim.fn.line '.'
    local current_col = vim.fn.col '.'
    local spaces = '    '
    local current_line = vim.fn.getline(line)

    local new_line = current_line:sub(1, current_col - 1) .. spaces .. current_line:sub(current_col)
    vim.fn.setline(line, new_line)

    vim.fn.cursor(line, current_col + #spaces)
end

function _G.create_note()
    local title = vim.fn.input 'Enter note title: '
    local note_dir = '/home/connor/MainFiles/Obsidian/Main/inbox'

    -- Format the file name: replace spaces with underscores
    local file_name = title:gsub(' ', '_')
    local formatted_file_name = os.date '%d-%m-%Y' .. '_' .. file_name .. '.md'

    -- Construct the full file path
    local note_filename = note_dir .. '/' .. formatted_file_name

    -- Create the file
    local file = io.open(note_filename, 'w')
    if file then
        file:close()

        -- Change to the note directory and open the note
        vim.cmd('cd ' .. note_dir)
        vim.cmd('edit ' .. note_filename)
    else
        print('Error creating note: ' .. note_filename)
    end
end

function _G.RemoveBeforePipe()
    -- Get the current line
    local line = vim.fn.getline '.'
    -- Use pattern matching to extract the part after the '|'
    local new_line = line:gsub('%[%[(.-)%|(.+)%]%]', '[[%2]]')
    -- Set the new line back to the buffer
    vim.fn.setline('.', new_line)
end

vim.api.nvim_create_autocmd('VimEnter', {
    callback = function()
        vim.api.nvim_set_keymap('n', '<C-i>', '<C-i>', { noremap = true, desc = 'Go forward in jump list' })
    end,
})

function _G.MultiCursorBackspace()
    -- Check if the `multiple_cursors#get_positions` function exists
    if vim.fn.exists('*multiple_cursors#get_positions') == 1 then
        local cursor_positions = vim.fn['multiple_cursors#get_positions']()
        local count = #cursor_positions

        -- If Telescope is active or only one cursor is present, perform a normal backspace
        if vim.bo.filetype == 'TelescopePrompt' or count <= 1 then
            -- Feed the actual backspace key for normal behavior
            vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<BS>', true, false, true), 'n', true)
        else
            -- Multiple cursors are active; perform multi-cursor backspace manually
            for _, pos in ipairs(cursor_positions) do
                vim.api.nvim_win_set_cursor(0, pos)  -- Move to each cursor position
                vim.cmd('normal! X')  -- Delete the character before each cursor
            end
        end
    else
        -- If `multiple_cursors#get_positions` doesn't exist, use normal backspace behavior
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<BS>', true, false, true), 'n', true)
    end
end

function _G.ClearAllCursors()
    if vim.fn.exists('*multiple_cursors#reset') == 1 then
        vim.fn['multiple_cursors#reset']()  -- Clear all cursors if the function exists
    else
        print("Multiple cursors plugin function not found.")
    end
end
