vim.o.hidden = true             -- opening a new file when the current buffer has unsaved changes (the unsaved changes can still be accessed)
vim.o.clipboard = 'unnamedplus' -- allows neovim to access the system clipboard
vim.o.backup = false
vim.o.updatetime = 300          -- faster completion (4000ms default)

vim.wo.number = true            -- set numbered lines
vim.o.encoding = 'utf-8'
vim.o.fileencoding = 'utf-8'
vim.o.title = true
vim.o.cmdheight = 1
vim.o.list = true -- show non-printing characters
vim.opt.listchars = {
    tab = '|-▶', -- or '▶_|'
    space = '･',
    trail = '■',
    eol = '↲',
    extends = '»',
    precedes = '«',
    nbsp = '␣',
}
vim.o.expandtab = true -- convert tab to spaces
vim.o.tabstop = 4      -- the number of spaces inserted for a tab
vim.o.shiftwidth = 4   -- the number of spaces inserted for earch indentation
vim.o.shell = 'fish'
vim.o.colorcolumn = '80,100'

vim.o.ignorecase = true -- ignore case when search
vim.o.smartcase = true  -- smart case (require ignorecase = true)

vim.o.mouse = ''        -- 'a': enable mouse input | '': disable
vim.o.belloff = 'all'   -- disable beep sound

