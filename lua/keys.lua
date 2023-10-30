local keymap = vim.api.nvim_set_keymap

-- Remap space as leader key
keymap('', '<Space>', '<Nop>', { silent = true })
vim.g.mapleader = ' '

-- Normal --

-- Ctrl + w が押しにくい位置にある場合に --
-- local wincmd_opts = { noremap = true }
-- vim.keymap.set('n', '<leader>h', [[<CMD>wincmd h<CR>]], wincmd_opts)
-- vim.keymap.set('n', '<leader>j', [[<CMD>wincmd j<CR>]], wincmd_opts)
-- vim.keymap.set('n', '<leader>k', [[<CMD>wincmd k<CR>]], wincmd_opts)
-- vim.keymap.set('n', '<leader>l', [[<CMD>wincmd l<CR>]], wincmd_opts)
-- vim.keymap.set('n', '<leader>qq', [[<CMD>wincmd q<CR>]], wincmd_opts)

-- Insert --
keymap('i', 'jj', [[<Esc><CMD>update<CR>]], { noremap = true, silent = false })
