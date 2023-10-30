local M = {}

M.set_keymaps = function (telescope)
    local toggleterm = telescope.extensions.toggleterm
    vim.keymap.set('n', '<leader>ft', toggleterm.toggleterm, { noremap = true })
end

return M
