local lazypath = vim.fn.stdpath("data").."/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "
local plugins = {
    {
        'nvim-telescope/telescope.nvim', version = '0.1.5',
        -- or                            , branch = '0.1.x',
        dependencies = { {'nvim-lua/plenary.nvim'} }
    },
    {
        "folke/zen-mode.nvim",
        opts = {}
    },
    {
        "folke/twilight.nvim",
        opts = {}
    },
    {
        "iamcco/markdown-preview.nvim",
        cmd = {"MarkdownPreviewToggle","MarkdownPreview","MarkdownPreviewStop"},
        build = "cd app && npm i",
        init = function()
            vim.g.mkdp_filetypes = { "markdown" }
        end,
        ft = { "markdown" }
    },
    {
        "preservim/vim-pencil"
    },
    {
        'rose-pine/neovim',
        name = 'rose-pine',
        config = function()
            vim.cmd('colorscheme rose-pine')
        end
    },
    'nvim-treesitter/nvim-treesitter', run= ':TSUpdate',
    'theprimeagen/harpoon',
    'mbbill/undotree',
    'tpope/vim-fugitive',
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        dependencies = {
            'neovim/nvim-lspconfig',
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',
            'hrsh7th/nvim-cmp',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-nvim-lua',
            'saadparwaiz1/cmp_luasnip',
            'L3MON4D3/LuaSnip',
            'rafamadriz/friendly-snippets'
        }
    },
    {
        "epwalsh.obsidian.nvim",
        version = "*",
        lazy = true,
        ft = "markdown",
        dependencies = {
            "nvim-lua/plenary.nvim"
        },
        opts = {
            workspace = {
                {
                    name = "Frozen Worlds",
                    path = "~/Documents/vaults/Frozen Worlds"
                },
                {
                    name = "Personnal",
                    path = "~/Documents/vaults/PKMS"
                },
                {
                    name = "Worldbuilder Project",
                    path = "~/Documents/vaults/Worldbuilder project"
                }
            }
        }
    },
}
require("lazy").setup(plugins,{})
