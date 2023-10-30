local status_ok, toggleterm = pcall(require, 'toggleterm')
if not status_ok then
    print('failed to load toggleterm')
    return
end

-- Setup
toggleterm.setup {
    open_mapping = [[<C-t>]],
    direction = 'float',
    float_opts = {
        border = 'curved',
    },
    winbar = {
        enabled = true,
    },
}

-- Keymaps
function _G.set_terminal_keymaps()
    local opts = { buffer = 0 }
    vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
    vim.keymap.set('t', 'jj', [[<C-\><C-n>]], opts)
    vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
    vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
    vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
    vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')


local Terminal = require 'toggleterm.terminal'.Terminal
local lazygit = Terminal:new {
    cmd = 'lazygit', hidden = true
}

function _lazygit_toggle()
    lazygit:toggle()
end

local ops = { noremap = true, silent = true }
vim.keymap.set('n', '<leader>g', [[<Cmd>lua _lazygit_toggle()<CR>]], ops)
