require("conform").setup({
    formatters_by_ft = {
        lua = { "stylua" },
        -- Conform will run multiple formatters sequentially
        python = { "isort", "black" },
        -- Use a sub-list to run only the first available formatter
        javascript = { { "prettierd", "prettier" } },
        -- sql = { "sql_formatter" }
        sql = { "sleek" }
    },
    -- formatters = {
    --     sql_formatter = {
    --         -- Change where to find the command
    --         command = "./config_sql_formatter.json",
    --         -- Adds environment args to the sql_formatter formatter
    --         env = {
    --             YAMLFIX_SEQUENCE_STYLE = "block_style",
    --         },
    --     },
    -- }
})

require("conform").setup({
    formatters = {
        sleek = {
            -- Change where to find the command
            command = "/home/jonas/.cargo/bin/sleek",
            args = { "-i", "2", "-U", "-l", "4" }
            -- Adds environment args to the formatter
            -- env = {
            --   YAMLFIX_SEQUENCE_STYLE = "block_style",
            -- },
        },
    },
})

-- Shortcut to format buffer
vim.keymap.set({ "n", "v" }, "<leader>f", function()
    require("conform").format({ async = true, lsp_fallback = true }, function(err)
        if not err then
            -- If we formatted in visual mode, escape to normal mode after formatting
            if vim.startswith(vim.api.nvim_get_mode().mode:lower(), "v") then
                vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", true)
            end
        end
    end)
end, { desc = "Format buffer" })

-- key for conform.format()

-- sql_formatter - A whitespace formatter for different query languages.
-- sqlfluff - A modular SQL linter and auto-formatter with support for multiple dialects and templated code.
-- sqlfmt - sqlfmt formats your dbt SQL files so you don't have to. It is similar in nature to Black, gofmt, and rustfmt (but for SQL)

-- -- Configuration options
-- language the SQL dialect to use (when using format()).
-- dialect the SQL dialect to use (when using formatDialect() since version 12).
-- tabWidth amount of indentation to use.
-- useTabs to use tabs for indentation.
-- keywordCase uppercases or lowercases keywords.
-- dataTypeCase uppercases or lowercases data types.
-- functionCase uppercases or lowercases function names.
-- identifierCase uppercases or lowercases identifiers. (experimental!)
-- indentStyle defines overall indentation style. (deprecated!)
-- logicalOperatorNewline newline before or after boolean operator (AND, OR, XOR).
-- expressionWidth maximum number of characters in parenthesized expressions to be kept on single line.
-- linesBetweenQueries how many newlines to insert between queries.
-- denseOperators packs operators densely without spaces.
-- newlineBeforeSemicolon places semicolon on separate line.
-- params collection of values for placeholder replacement.
-- paramTypes specifies parameter placeholders types to support.
