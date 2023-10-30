local status_ok, nvim_tree = pcall(require, 'nvim-tree')
if not status_ok then
    print('failed to load nvim_tree')
    return
end

nvim_tree.setup {
    view = {
        width = '25%',
    },
}

vim.keymap.set('n', '<leader><TAB>', '<CMD>NvimTreeToggle<CR>', { silent = true })
