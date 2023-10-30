local status_ok, treesitter = pcall(require, 'nvim-treesitter.configs')
if not status_ok then
    vim.api.nvim_echo(
        { { 'warning:', 'WarningMsg' }, { ' failed to load nvim-treesitter.configs' } },
        true,
        {}
    )
    return
end

treesitter.setup {
    auto_install = true,
    highlight = {
        enable = true,
    },
}
