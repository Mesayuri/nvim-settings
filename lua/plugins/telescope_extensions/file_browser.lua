local M = {}

M.set_keymaps = function (telescope)
    local file_browser = telescope.extensions.file_browser
    vim.keymap.set('n', '<leader>b', file_browser.file_browser, { noremap = true })
end

return M
