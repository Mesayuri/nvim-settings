local status_ok, bufferline = pcall(require, 'bufferline')
if not status_ok then
    print('failed to load bufferline')
    return
end

vim.opt.termguicolors = true
bufferline.setup {
    options = {
        diagnostics = 'coc',
        --- count is an integer representing total count of errors
        --- level is a string "error" | "warning"
        --- diagnostics_dict is a dictionary from error level ("error", "warning" or "info")to number of errors for each level.
        --- this should return a string
        diagnostics_indicator = function(count, level, diagnostics_dict, context)
            local s = " "
            for e, n in pairs(diagnostics_dict) do
                local sym = e == "error" and " "
                    or (e == "warning" and " " or "")
                s = s .. n .. sym
            end
            return s
        end,
        indicator = {
            style = 'underline',
        },
        offsets = {
            {
                filetype = 'NvimTree',
                text = 'File Explorer',
                highlight = 'Directory',
                text_align = 'left'
            }
        },
        show_buffer_close_icons = false,
        show_close_icons = false,
        numbers = function(opts)
            return string.format('%s·%s', opts.raise(opts.id), opts.lower(opts.ordinal))
        end,
    }
}

-- Keymaps --
vim.keymap.set('n', '<S-l>', '<CMD>BufferLineCycleNext<CR>', { silent = true })
vim.keymap.set('n', '<S-h>', '<CMD>BufferLineCyclePrev<CR>', { silent = true })
vim.keymap.set('n', ']b', '<CMD>BufferLineMoveNext<CR>', { silent = true })
vim.keymap.set('n', '[b', '<CMD>BufferLineMovePrev<CR>', { silent = true })
