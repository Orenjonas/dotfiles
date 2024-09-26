require('neodev').setup({
    library = { plugins = { "nvim-dap-ui" }, types = true },
})
local lsp = require('lsp-zero')


lsp.preset('recommended')
lsp.setup_nvim_cmp({
    preselect = 'none',
    completion = {
        completeopt = 'menu,menuone,noinsert,noselect'
    },
})
lsp.ensure_installed({ 'pylsp' })


lsp.configure('pylsp',
    {
        settings = {
            pylsp = {
                plugins = {
                    pyls_black = { enabled = true },
                    isort = { enabled = true, profile = "black" },
                    rope_autoimport = { enabled = true },
                    pydocstyle = { enabled = true },
                    yapf = { enabled = true }
                },
            },
        },
    }
)

lsp.on_attach(function(client, buffer_number)
    local opts = { buffer = buffer_number, remap = false }

    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "gi", function() vim.lsp.buf.implementation() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>s", function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set("n", "<leader>vd", function()
        vim.diagnostic.open_float({
            { scope = "buffer" }
        })
    end, opts)
    vim.keymap.set("n", "<leader>dn", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "<leader>dp", function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set("n", "<leader>dl", "<cmd>Telescope diagnostics<cr>", opts)
    vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>rf", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("i", "<c-p>", function() vim.lsp.buf.signature_help() end, opts)
end)

-- local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

lsp.format_mapping('<leader>g', {
    format_opts = {
        async = false,
        timeout_ms = 10000,
    },
    servers = {
        ['null-ls'] = { 'sql' }
    }
})

lsp.setup()


-- Completion
local cmp = require 'cmp'
-- local cmp_action = require('lsp-zero').cmp_action()
local luasnip = require "luasnip"


local null_ls = require("null-ls")
local null_opts = lsp.build_options('null-ls', {})

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup({
    on_attach = function(client, bufnr)
        null_opts.on_attach(client, bufnr)
        if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = augroup,
                buffer = bufnr,
                callback = function()
                    -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
                    -- on later neovim version, you should use vim.lsp.buf.format({ async = false }) instead
                    -- vim.lsp.buf.formatting_sync()
                    vim.lsp.buf.format({
                        async = false,
                        -- filter = function(client)
                        --     return client.name == "null-ls"
                        -- end
                    })
                    -- vim.lsp.buf.format({ bufnr = bufnr })
                end,
            })
        end
    end,
    sources = {
        null_ls.builtins.diagnostics.sqlfluff,
        -- null_ls.builtins.diagnostics.sqlfluff.with({
        --     extra_args = { "--dialect", "tsql" }, -- change to your dialect
        -- }),
        null_ls.builtins.formatting.sqlfluff,
        -- null_ls.builtins.formatting.sqlfluff.with({
        -- filetypes = { "sql" },
        -- extra_args = { "--config", "setup.cfg" },
        -- extra_args = { "--dialect", "bigquery" }, -- change to your dialect
        -- extra_args = { "--dialect", "tsql" }, -- change to your dialect
        -- extra_args = { "--config", "~/.dotfiles/nvim/tsql_setup.cfg" },
        -- }),
        -- null_ls.builtins.formatting.stylua,
        -- null_ls.builtins.diagnostics.eslint,
        --         null_ls.builtins.completion.spell,
        -- require("none-ls.diagnostics.eslint_d"),
        --         require("none-ls.diagnostics.cpplint"),
        --         require("none-ls.formatting.jq"),
        require("none-ls.code_actions.eslint"),
    },
    ensure_installed = { "sqlfluff" },
    methods = {
        diagnostics = true,
        formatting = true,
        -- code_actions = true,
        completion = true,
        hover = true,
    },
})


--
-- local sources = {
--     null_ls.builtins.diagnostics.sqlfluff.with({
--         -- extra_args = { "--dialect", "bigquery" }, -- change to your dialect
--         extra_args = { "--config", "setup.cfg" }, -- change to your dialect
--     }),
-- }

require('luasnip.loaders.from_vscode').lazy_load()

local lsp_zero = require('lsp-zero')

cmp.setup({
    snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
            -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
            require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
            -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
            -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
        end,
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<tab>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        ['<CR>'] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = false
        }), -- Set `select` to `false` to only confirm explicitly selected items.
        ["<c-k>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            else
                fallback()
            end
        end, { "i", "s" }),

        ["<c-j>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { "i", "s" }),

    }),
    sources = cmp.config.sources({
        { name = 'path' },
        { name = 'nvim_lsp' },
        -- { name = 'vsnip' }, -- For vsnip users.
        { name = 'luasnip' }, -- For luasnip users.
        -- { name = 'ultisnips' }, -- For ultisnips users.
        -- { name = 'snippy' }, -- For snippy users.
    }, {
        { name = 'buffer' },
    })
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
        { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
        { name = 'buffer' },
    })
})

-- Snippets
local ls = require "luasnip"

ls.config.set_config {
    -- Keep the last snippet active so you can jump back in.
    history = true,

    -- For dynamic snippets, update as you type
    updateevents = "TextChanged,TextChangedI",

    -- Autosnippets
    enable_autosnippets = true,
}

require("luasnip.loaders.from_vscode").load({ include = { "python" } }) -- Load only python snippets

-- cmp.setup({
--   },
--   mapping = {
--     ['<C-f>'] = cmp_action.luasnip_jump_forward(),
--     ['<C-b>'] = cmp_action.luasnip_jump_backward(),
--     ["<CR>"] = cmp.mapping.confirm { select = true },
--     ["<Tab>"] = cmp.mapping(function(fallback)
--         if cmp.visible() then
--             cmp.select_next_item()
--         elseif luasnip.expand_or_jumpable() then
--             luasnip.expand_or_jump()
--         elseif has_words_before() then
--             cmp.complete()
--         else
--             fallback()
--         end
--     end, { "i", "s" }),

--     ["<S-Tab>"] = cmp.mapping(function(fallback)
--         if cmp.visible() then
--             cmp.select_prev_item()
--         elseif luasnip.jumpable(-1) then
--             luasnip.jump(-1)
--         else
--             fallback()
--         end
--     end, { "i", "s" }),
-- },
-- snippet = {
--     expand = function(args)
--         local luasnip = prequire("luasnip")
--         if not luasnip then
--             return
--         end
--         luasnip.lsp_expand(args.body)
--     end,
-- },
-- })
--
--


-- Diagnostics
local util = require 'lspconfig.util'
local lsp = vim.lsp

-- local function fix_all(opts)
--     opts = opts or {}
--
--     local eslint_lsp_client = util.get_active_client_by_name(opts.bufnr, 'sqlfluff')
--     if eslint_lsp_client == nil then
--         return
--     end
--
--     local request
--     if opts.sync then
--         request = function(bufnr, method, params)
--             eslint_lsp_client.request_sync(method, params, nil, bufnr)
--         end
--     else
--         request = function(bufnr, method, params)
--             eslint_lsp_client.request(method, params, nil, bufnr)
--         end
--     end
--
--     local bufnr = util.validate_bufnr(opts.bufnr or 0)
--     request(0, 'workspace/executeCommand', {
--         command = 'sqlfluff.applyAllFixes',
--         arguments = {
--             {
--                 uri = vim.uri_from_bufnr(bufnr),
--                 version = lsp.util.buf_versions[bufnr],
--             },
--         },
--     })
-- end


-- Diagnostics
vim.diagnostic.config({
    virtual_text = true,
    signs = true
})

-- Disable ESLint LSP server and hide virtual text in Neovim
-- Add this to your init.lua or init.vim file
local isLspDiagnosticsVisible = true
vim.keymap.set("n", "<leader>lx", function()
    isLspDiagnosticsVisible = not isLspDiagnosticsVisible
    vim.diagnostic.config({
        virtual_text = isLspDiagnosticsVisible,
        underline = isLspDiagnosticsVisible
    })
end)

vim.keymap.set("n", "<leader>fsql",
    function()
        vim.lsp.buf.format({ timeout_ms = 10000 })
    end
)
