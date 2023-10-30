local status_ok, lualine = pcall(require, 'lualine')
if not status_ok then
    print('failed to load lualine')
    return
end

lualine.setup {
    options = {
        theme = 'tokyonight',
    },
    extensions = {
        'toggleterm',
        'nvim-tree',
        'neo-tree'
    }
}
