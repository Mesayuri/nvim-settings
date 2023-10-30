-- VSCode like: tab to the bottom of the editor
vim.keymap.set(
    'n', '<leader>t', '<CMD>belowright new<CR><CMD>terminal<CR>',
    { noremap = true, silent = false }
)

vim.keymap.set('t', '<ESC>', [[<C-\><C-n>]], { noremap = true })
vim.keymap.set('t', '<C-W>q', '<CMD>quit<CR>', { noremap = true })

-- Open with insert mode
vim.api.nvim_create_autocmd('termopen', {
    command = 'startinsert',
})
