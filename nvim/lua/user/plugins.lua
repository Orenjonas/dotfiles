require("lazy").setup({
    { "catppuccin/nvim",                 name = "catppuccin" },
    { "nvim-treesitter/nvim-treesitter", cmd = "TSUpdate" },
    "feline-nvim/feline.nvim",
    "folke/neodev.nvim",
    "tpope/vim-commentary",
    "tpope/vim-surround",
    "tpope/vim-repeat",
    "nvim-tree/nvim-tree.lua",
    "nvim-tree/nvim-web-devicons",
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
    "windwp/nvim-autopairs",
    "RRethy/vim-illuminate",
    "lukas-reineke/lsp-format.nvim",
    "folke/trouble.nvim",
    "mfussenegger/nvim-dap",
    { "mfussenegger/nvim-dap-python", dependencies = "mfussenegger/nvim-dap" },
    { "rcarriga/nvim-dap-ui",         dependencies = "mfussenegger/nvim-dap" },
    "mbbill/undotree",
    "https://github.com/jpalardy/vim-slime",
    "https://github.com/JamshedVesuna/vim-markdown-preview",
    "Vonr/align.nvim",
    {
        "mcchrish/zenbones.nvim",
        -- Optionally install Lush. Allows for more configuration or extending the colorscheme
        -- If you don't want to install lush, make sure to set g:zenbones_compat = 1
        -- In Vim, compat mode is turned on as Lush only works in Neovim.
        dependencies = "rktjmp/lush.nvim"
    },
    { "lukas-reineke/indent-blankline.nvim" },
    { 
        "danymat/neogen", -- annotation generator
        dependencies = "nvim-treesitter/nvim-treesitter", 
        config = true,
        -- Uncomment next line if you want to follow only stable versions
        -- version = "*" 
    },
    {'lervag/vimtex', lazy=false},
    "ellisonleao/gruvbox.nvim",
    -- {"c0r73x/neotags.lua", build="make"}
    "ludovicchabant/vim-gutentags",
    {
        "kiyoon/treesitter-indent-object.nvim",
        keys = {
            {
                "ai",
                "<Cmd>lua require'treesitter_indent_object.textobj'.select_indent_outer()<CR>",
                mode = {"x", "o"},
                desc = "Select context-aware indent (outer)",
            },
            {
                "aI",
                "<Cmd>lua require'treesitter_indent_object.textobj'.select_indent_outer(true)<CR>",
                mode = {"x", "o"},
                desc = "Select context-aware indent (outer, line-wise)",
            },
            {
                "ii",
                "<Cmd>lua require'treesitter_indent_object.textobj'.select_indent_inner()<CR>",
                mode = {"x", "o"},
                desc = "Select context-aware indent (inner, partial range)",
            },
            {
                "iI",
                "<Cmd>lua require'treesitter_indent_object.textobj'.select_indent_inner(true)<CR>",
                mode = {"x", "o"},
                desc = "Select context-aware indent (inner, entire range)",
            },
        },
    },
}
)
