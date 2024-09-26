require("lazy").setup({
    -- { "catppuccin/nvim",                 name = "catppuccin" },
    "marko-cerovac/material.nvim",
    "EdenEast/nightfox.nvim",
    "nvim-lualine/lualine.nvim",
    "navarasu/onedark.nvim",
    { "catppuccin/nvim",                 name = "catppuccin", priority = 1000 },
    { "nvim-treesitter/nvim-treesitter", cmd = "TSUpdate" },
    -- {
    -- -- 'freddiehaddad/feline.nvim',
    -- opts = {},
    -- config = function(_, opts)
    --     require('feline').setup()
    --     require('feline').winbar.setup() -- to use winbar
    --     -- require('feline').statuscolumn.setup() -- to use statuscolumn
    --     --
    --     --     -- require('feline').use_theme()          -- to use a custom theme
    -- end
    -- },
    "folke/neodev.nvim",
    {
        'numToStr/Comment.nvim',
        opts = {
            -- add any options here
        }
    },
    "tpope/vim-surround",
    "tpope/vim-repeat",
    "nvim-tree/nvim-tree.lua",
    "nvim-tree/nvim-web-devicons",
    "ryanoasis/vim-devicons",
    "tpope/vim-fugitive",
    "lewis6991/gitsigns.nvim",
    {
        "nvim-telescope/telescope.nvim",
        branch = "0.1.x",
        dependencies = {
            { "nvim-lua/plenary.nvim" },
            { "gbrlsnchs/telescope-lsp-handlers.nvim" }
        }
    },
    {
        "VonHeikemen/lsp-zero.nvim",
        branch = "v1.x",
        dependencies = {
            -- LSP Support
            { "neovim/nvim-lspconfig" },             -- Required
            { "williamboman/mason.nvim" },           -- Optional
            { "williamboman/mason-lspconfig.nvim" }, -- Optional

            -- Autocompletion
            { "hrsh7th/nvim-cmp" },         -- Required
            { "hrsh7th/cmp-nvim-lsp" },     -- Required
            { "hrsh7th/cmp-buffer" },       -- Optional
            { "hrsh7th/cmp-path" },         -- Optional
            { "saadparwaiz1/cmp_luasnip" }, -- Optional
            { "hrsh7th/cmp-nvim-lua" },     -- Optional

            -- Snippets
            { "L3MON4D3/LuaSnip" },             -- Required
            { "rafamadriz/friendly-snippets" }, -- Optional
            -- { "SirVer/ultisnips" }
        }
    },
    -- "mfussenegger/nvim-lint",
    {
        "jay-babu/mason-null-ls.nvim",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "williamboman/mason.nvim",
            "nvimtools/none-ls.nvim",
            "nvim-lua/plenary.nvim",
            "nvimtools/none-ls-extras.nvim",
        },
        -- config = function()
        --     require("your.null-ls.config") -- require your null-ls config here (example below)
        -- end,
    },
    "windwp/nvim-autopairs",
    "RRethy/vim-illuminate",
    "lukas-reineke/lsp-format.nvim",
    "folke/trouble.nvim",
    -- "mfussenegger/nvim-dap",
    { "mfussenegger/nvim-dap-python", dependencies = "mfussenegger/nvim-dap" },
    { "rcarriga/nvim-dap-ui",         dependencies = "mfussenegger/nvim-dap" },
    "mbbill/undotree",
    "https://github.com/jpalardy/vim-slime",
    "https://github.com/JamshedVesuna/vim-markdown-preview",
    {
        "mcchrish/zenbones.nvim",
        -- Optionally install Lush. Allows for more configuration or extending the colorscheme
        -- If you don't want to install lush, make sure to set g:zenbones_compat = 1
        -- In Vim, compat mode is turned on as Lush only works in Neovim.
        dependencies = "rktjmp/lush.nvim"
    },
    {
        "danymat/neogen", -- annotation generator
        dependencies = "nvim-treesitter/nvim-treesitter",
        config = true,
        -- Uncomment next line if you want to follow only stable versions
        -- version = "*"
    },
    -- { 'lervag/vimtex',                       lazy = true },
    "ellisonleao/gruvbox.nvim",
    -- {"c0r73x/neotags.lua", build="make"}
    "ludovicchabant/vim-gutentags",
    -- {
    --     "kiyoon/treesitter-indent-object.nvim",
    --     keys = {
    --         {
    --             "ai",
    --             "<Cmd>lua require'treesitter_indent_object.textobj'.select_indent_outer()<CR>",
    --             mode = { "x", "o" },
    --             desc = "Select context-aware indent (outer)",
    --         },
    --         {
    --             "aI",
    --             "<Cmd>lua require'treesitter_indent_object.textobj'.select_indent_outer(true)<CR>",
    --             mode = { "x", "o" },
    --             desc = "Select context-aware indent (outer, line-wise)",
    --         },
    --         {
    --             "ii",
    --             "<Cmd>lua require'treesitter_indent_object.textobj'.select_indent_inner()<CR>",
    --             mode = { "x", "o" },
    --             desc = "Select context-aware indent (inner, partial range)",
    --         },
    --         {
    --             "iI",
    --             "<Cmd>lua require'treesitter_indent_object.textobj'.select_indent_inner(true)<CR>",
    --             mode = { "x", "o" },
    --             desc = "Select context-aware indent (inner, entire range)",
    --         },
    --     },
    -- },
    'michaeljsmith/vim-indent-object',
    {
        "lukas-reineke/indent-blankline.nvim",
        tag = "v2.20.8", -- Use v2
        event = "BufReadPost",
        config = function()
            vim.opt.list = true
            require("indent_blankline").setup {
                space_char_blankline = " ",
                show_current_context = true,
                show_current_context_start = true,
            }
        end,
        main = "ibl",
        opts = {}
    },
    "tommcdo/vim-exchange",
    "wellle/targets.vim",
    { 'stevearc/conform.nvim',  opts = {}, },
    { "zbirenbaum/copilot.lua", lazy = true },
    { 'Vonr/align.nvim',        branch = "v2", lazy = true, },
    "jidn/vim-dbml",
    { 'kevinhwang91/nvim-ufo', dependencies = { 'kevinhwang91/promise-async' } },
    "PeterRincker/vim-argumentative",
    {
        'kristijanhusak/vim-dadbod-ui',
        dependencies = {
            { 'tpope/vim-dadbod',                     lazy = true },
            { 'kristijanhusak/vim-dadbod-completion', ft = { 'sql', 'mysql', 'plsql' }, lazy = true },
        },
        cmd = {
            'DBUI',
            'DBUIToggle',
            'DBUIAddConnection',
            'DBUIFindBuffer',
        },
        init = function()
            -- Your DBUI configuration
            vim.g.db_ui_use_nerd_fonts = 1
        end,
    },

})
