-- プラグインマネージャ `Lazy` のセットアップ

-- lazyの起動設定
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        '--branch=stable', -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- プラグインの読み込み
require('lazy').setup({
    -- Colorschemes --
    {
        'folke/tokyonight.nvim',
        lazy = false,
        config = function()
            require('plugins.colorschemes.tokyonight')
        end,
    },

    -- Icons --
    {
        'kyazdani42/nvim-web-devicons',
        config = function()
            require('nvim-web-devicons').setup()
        end,
    },

    -- Statuslines --
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'kyazdani42/nvim-web-devicons' },
        config = function()
            require('plugins.statuslines.lualine')
        end,
    },

    -- Completions --
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/vim-vsnip',
    'hrsh7th/cmp-vsnip',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/nvim-cmp',
    'onsails/lspkind.nvim',
    {
        'hrsh7th/nvim-cmp',
        dependencies = {
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/vim-vsnip',
            'hrsh7th/cmp-vsnip',
            'hrsh7th/cmp-cmdline',
            'hrsh7th/nvim-cmp',
            'onsails/lspkind.nvim',
        },
        config = function()
            require('plugins.completions.cmp')
        end,
    },

    -- {
    --     'nvim-treesitter/nvim-treesitter',
    --     lazy = false,
    --     config = function()
    --         require('plugins.treesitter')
    --     end,
    -- },

    -- Language servers --
    -- Builtin LSP
    'neovim/nvim-lspconfig',
    'williamboman/mason.nvim',
    {
        'williamboman/mason-lspconfig.nvim',
        dependencies = {
            'neovim/nvim-lspconfig',
            'williamboman/mason.nvim',
            'hrsh7th/nvim-cmp',
        },
        config = function()
            require('plugins.language_servers.mason_lspconfig')
        end,
    },

    -- Coc.nvim
    -- {
    --     'neoclide/coc.nvim',
    --     branch = 'release',
    --     config = function()
    --         require('plugins.language_servers.coc')
    --         require('plugins.language_servers.coc_extensions')
    --     end,
    -- },

    -- Terminals --
    'kassio/neoterm',
    {
        'akinsho/toggleterm.nvim',
        version = '*',
        config = function()
            require('plugins.toggleterm')
        end,
    },

    -- File Explorers --
    {
        'nvim-telescope/telescope.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' },
        lazy = false,
        config = function()
            require('plugins.telescope')
        end
    },
    {
        'nvim-tree/nvim-tree.lua',
        lazy = false,
        config = function()
            require('plugins.nvim_tree')
        end
    },

    -- telescope extensions --
    {
        'nvim-telescope/telescope-file-browser.nvim',
        dependencies = { 'nvim-telescope/telescope.nvim' },
    },
    'LinArcX/telescope-command-palette.nvim',
    {
        'https://git.sr.ht/~havi/telescope-toggleterm.nvim',
        dependencies = {
            'nvim-telescope/telescope.nvim',
            'akinsho/nvim-toggleterm.lua',
        },
    },

    -- Tabpage Integrations --
    {
        'akinsho/bufferline.nvim',
        dependencies = 'nvim-tree/nvim-web-devicons',
        config = function()
            require('plugins.bufferline')
        end
    },

    -- etc. --
    {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    },
    {
        'petertriho/nvim-scrollbar',
        config = function()
            require('scrollbar').setup()
        end
    },
    {
        'lukas-reineke/indent-blankline.nvim',
        main = 'ibl',
    },
})
