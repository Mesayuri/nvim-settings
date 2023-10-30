local ok, nightfox = pcall(require, 'nightfox')
if not ok then
    print('failed to load nightfox')
    return
end

nightfox.setup {

}

vim.cmd [[colorscheme nightfox]]
