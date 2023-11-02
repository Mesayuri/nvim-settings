-- プラグインマネージャ `Lazy` のセットアップ

-- lazyの起動設定
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        '--branch=stable',
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

local opts = {
    defaults = {
        -- デフォルトで遅延読み込みを有効にする。各プラグインの読み込み設定で、
        -- 明示的に読み込みタイミングを設定しない場合そのプラグインは有効にならないので注意。
        lazy = true,
    },
}

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
    -- 'sainnhe/everforest',

    -- Icons --
    {
        'kyazdani42/nvim-web-devicons',
        lazy = false,
        tag = 'nerd-v2-compat',  -- NerdFontのv3への対応が完了しておらず表示が崩れるのでv2を使用
        config = function()
            require('nvim-web-devicons').setup()
        end,
    },

    -- Statuslines --
    {
        'nvim-lualine/lualine.nvim',
        event = 'VeryLazy',
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
            'onsails/lspkind.nvim',
        },
        event = 'InsertEnter',
        config = function()
            require('plugins.completions.cmp')
        end,
    },

    -- Highlight --
    {
        'nvim-treesitter/nvim-treesitter',
        event = 'VeryLazy',
        build = ':TSUpdate',
        config = function()
            require('plugins.treesitter')
        end,
    },
    {
        'RRethy/vim-illuminate',
        event = 'VeryLazy',
    },

    -- Language servers --
    -- Builtin LSP
    'neovim/nvim-lspconfig',
    {
        'williamboman/mason.nvim',
        event = 'VimEnter',
        build = ':MasonUpdate',
    },
    {
        'williamboman/mason-lspconfig.nvim',
        dependencies = {
            'neovim/nvim-lspconfig',
            'williamboman/mason.nvim',
            'hrsh7th/nvim-cmp',
        },
        event = 'VeryLazy',
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
        event = 'VeryLazy',
        -- cmd = 'ToggleTerm',
        version = '*',
        config = function()
            require('plugins.toggleterm')
        end,
    },

    -- File Explorers --
    {
        'nvim-telescope/telescope.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' },
        event = 'VeryLazy',
        config = function()
            require('plugins.telescope')
        end
    },
    {
        'nvim-tree/nvim-tree.lua',
        event = 'VeryLazy',
        config = function()
            require('plugins.nvim_tree')
        end
    },

    -- telescope extensions --
    {
        'nvim-telescope/telescope-file-browser.nvim',
        event = 'VeryLazy',
        dependencies = { 'nvim-telescope/telescope.nvim' },
    },
    'LinArcX/telescope-command-palette.nvim',
    {
        'https://git.sr.ht/~havi/telescope-toggleterm.nvim',
        event = 'VeryLazy',
        dependencies = {
            'nvim-telescope/telescope.nvim',
            'akinsho/nvim-toggleterm.lua',
        },
    },

    -- Tabpage Integrations --
    {
        'akinsho/bufferline.nvim',
        event = 'VimEnter',
        dependencies = 'nvim-tree/nvim-web-devicons',
        config = function()
            require('plugins.bufferline')
        end
    },

    -- etc. --
    {
        -- greeter --
        'goolord/alpha-nvim',
        lazy = false,
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function ()
          require('alpha').setup(require('alpha.themes.dashboard').config)
        end,
    },
    {
        -- toggle comment --
        'numToStr/Comment.nvim',
        event = 'VeryLazy',
        config = function()
            require('Comment').setup()
        end
    },
    {
        'petertriho/nvim-scrollbar',
        event = 'VeryLazy',
        config = function()
            require('scrollbar').setup()
        end
    },
    {
        'lukas-reineke/indent-blankline.nvim',
        event = 'VeryLazy',
        main = 'ibl',
    },
},
opts
)
