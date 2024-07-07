-- vim.g.ale_sql_sqlfluff_options = "--dialect bigquery --config pyproject.toml" -- --dialect bigquery
-- vim.g.ale_lint_on_text_changed = 'never'
-- vim.g.ale_use_neovim_diagnostics_api = 1
-- vim.g.ale_lint_on_insert_leave = 0

-- " You can disable this option too
-- " if you don't want linters to run on opening a file
-- let g:ale_lint_on_enter = 0


-- require('lint').linters_by_ft = {
--     markdown = { 'vale', },
--     sql = { 'sqlfluff' },
--     python = { "pylint" },
-- }
--
-- vim.api.nvim_create_autocmd({ "BufWritePost" }, {
--     callback = function()
--         -- try_lint without arguments runs the linters defined in `linters_by_ft`
--         -- for the current filetype
--         require("lint").try_lint()
--
--         -- You can call `try_lint` with a linter name or a list of names to always
--         -- run specific linters, independent of the `linters_by_ft` configuration
--         -- require("lint").try_lint("cspell")
--     end,
-- })
--
-- -- local ns = require("lint").get_namespace("sqlfluff")
-- -- vim.diagnostic.config({ config = '/home/jonas/projects/pyproject.toml' }, ns)
--
-- -- local sqlfluff = require('lint').linters.sqlfluff
-- -- sqlfluff.args = {
-- --     '-d',
-- --     'bigquery'
-- --     -- <- Add a new parameter here
-- --     -- '--report=json',
-- --     -- '-'
-- -- }
--
-- -- require('lint').linters.sqlfluff = {
-- --     cmd = 'python3 -m sqlfluff lint',
-- --     stdin = false,                                                -- or false if it doesn't support content input via stdin. In that case the filename is automatically added to the arguments.
-- --     append_fname = true,                                          -- Automatically append the file name to `args` if `stdin = false` (default: true)
-- --     args = { '--config', '/home/jonas/projects/pyproject.toml' }, -- list of arguments. Can contain functions with zero arguments that will be evaluated once the linter is used.
-- --     stream = nil,                                                 -- ('stdout' | 'stderr' | 'both') configure the stream to which the linter outputs the linting result.
-- --     ignore_exitcode = false,                                      -- set this to true if the linter exits with a code != 0 and that's considered normal.
-- --     env = nil,                                                    -- custom environment table to use with the external process. Note that this replaces the *entire* environment, it is not additive.
-- --     -- parser = your_parse_function
-- -- }
--
--
-- -- -- Show linter in statusline
-- -- local lint_progress = function()
-- --     local linters = require("lint").get_running()
-- --     if #linters == 0 then
-- --         return "󰦕"
-- --     end
-- --     return "󱉶 " .. table.concat(linters, ", ")
-- -- end
