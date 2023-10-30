local ok, tokyonight = pcall(require, 'tokyonight')
if not ok then
    print('failed to load tokyonight')
    return
end

tokyonight.setup {
    style = 'moon',
    light_style = 'day',
}

vim.cmd [[colorscheme tokyonight]]
