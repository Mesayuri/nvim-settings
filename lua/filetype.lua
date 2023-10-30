local M = {}

local function set_indent(tab_length, is_hard_tab)
    if is_hard_tab then
        vim.bo.expandtab = false
    else
        vim.bo.expandtab = true
    end

    vim.bo.shiftwidth  = tab_length
    vim.bo.softtabstop = tab_length
    vim.bo.tabstop     = tab_length
end

-- Language Settings --
M.typescript = function()
    set_indent(2, false)
end

M.javascript = function()
    set_indent(2, false)
end

M.html = function()
    set_indent(2, false)
end

M.css = function()
    set_indent(2, false)
end

M.json = function()
    set_indent(2, false)
end

M.lua = function()
    set_indent(4, false)
end

M.python = function()
    set_indent(4, false)
end

M.go = function()
    set_indent(4, true)
end

-- return --
local filetypes = setmetatable(M, {
    __index = function()
        return function()
            set_indent(2, false)
        end
    end
})

vim.api.nvim_create_augroup('vimrc_augroup', {})
vim.api.nvim_create_autocmd('FileType', {
    group = 'vimrc_augroup',
    pattern = '*',
    callback = function(args) filetypes[args.match]() end
})
