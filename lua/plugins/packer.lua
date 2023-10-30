-- プラグインマネージャ packer のセットアップ --

-- Auto PackerSync whenever you save this (plugins/init.lua) file
vim.api.nvim_create_augroup('packer_user_config', {})
vim.api.nvim_clear_autocmds({
    group = 'packer_user_config',
})
vim.api.nvim_create_autocmd('BufWritePost', {
    group = 'packer_user_config',
    pattern = '*/plugins/init.lua',
    callback = function()
        vim.cmd([[source <afile> | PackerSync]])
    end
})

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer manage itself --
    use { 'wbthomason/packer.nvim', opt = true }

    -- Colorschemes --
    use { 'EdenEast/nightfox.nvim' }
    use { 'Mofiqul/dracula.nvim' }
    use { 'folke/tokyonight.nvim' }

    -- Icons --
    use {
        'kyazdani42/nvim-web-devicons',
        config = [[require 'nvim-web-devicons'.setup()]],
    }

    -- Statuslines --
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true },
        config = [[require 'plugins.lualine']],
    }

    -- Language servers --
    use {
        'neoclide/coc.nvim',
        branch = 'release',
        config = function()
            require 'plugins.coc'
            -- require 'plugins.coc_explorer'
        end,
    }

    -- Treesitter --
    use {
        'nvim-treesitter/nvim-treesitter',
        event = 'VimEnter',
        run = ':TSUpdate',
        config = [[require 'plugins.treesitter']],
    }

    -- Terminals --
    use { 'kassio/neoterm' }
    use {
        'akinsho/toggleterm.nvim',
        event = { 'VimEnter' },
        config = [[require 'plugins.toggleterm']],
    }

    -- File Explorers --
    use {
        'nvim-telescope/telescope.nvim',
        event = { 'VimEnter' },
        requires = { 'nvim-lua/plenary.nvim' },
        config = [[require 'plugins.telescope']],
    }
    use {
        'nvim-tree/nvim-tree.lua',
        event = { 'VimEnter' },
        config = [[require 'plugins.nvim_tree']],
    }
    -- telescope extensions
    use {
        'nvim-telescope/telescope-file-browser.nvim',
        requires = { 'nvim-telescope/telescope.nvim' },
    }
    -- use {
    --    'nvim-telescope/telescope-frecency.nvim',
    --    requires = {'kkharji/sqlite.lua', opt = true },
    -- }
    use { "LinArcX/telescope-command-palette.nvim" }
    use {
        'https://git.sr.ht/~havi/telescope-toggleterm.nvim',
        requires = {
            'nvim-telescope/telescope.nvim',
            'akinsho/nvim-toggleterm.lua',
        },
    }

    -- Tabpage Integrations --
    use {
        'akinsho/bufferline.nvim',
        requires = 'nvim-tree/nvim-web-devicons',
        config = [[require 'plugins.bufferline']],
    }

    -- etc. --
    use {
        'numToStr/Comment.nvim',
        config = [[require 'Comment'.setup()]]
    }
    use {
        'windwp/nvim-autopairs',
        config = function() require 'nvim-autopairs'.setup {} end
    }
end)
