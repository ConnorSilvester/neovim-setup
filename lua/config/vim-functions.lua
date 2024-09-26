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
