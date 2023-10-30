local status_ok, telescope = pcall(require, 'telescope')
if not status_ok then
    print('failed to load telescope')
    return
end

-- builtin settings --
local builtin = require 'telescope.builtin'
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})


-- extensions --
-- load execution configuration files
local command_palette = require 'plugins.telescope_extensions.command_palette'
local file_browser = require 'plugins.telescope_extensions.file_browser'
local toggleterm = require 'plugins.telescope_extensions.toggleterm'

-- set keymaps
command_palette.set_keymaps(telescope)
file_browser.set_keymaps(telescope)
toggleterm.set_keymaps(telescope)

-- setup telescope
telescope.setup {
    extensions = {
        command_palette = command_palette.palette_settings
    },
}

-- load extensions
telescope.load_extension 'file_browser'
telescope.load_extension 'command_palette'
telescope.load_extension 'toggleterm'
