local dap = require('dap')
local dap_ui = require('dapui')
dap_ui.setup()
require('dap-python').setup('~/.virtualenvs/debugpy/bin/python')

-- dap.adapters.python = {
--     type = 'executable',
--     command = 'python',
--     args = {'-m', 'debugpy.adapter'}
-- }
-- dap.configurations.python = {
--     {
--         type = 'python',
--         require = 'launch',
--         name = "Launch file",
--         program = "${file}",
--         pythonPath = function() return '/usr/bin/python3' end,
--     },
-- }

vim.keymap.set('n', "<leader>tb", dap.toggle_breakpoint)
vim.keymap.set('n', '<leader>db', dap_ui.toggle)
-- require('dap-python').resolve_python = function()
--     return '/absolute/path/to/python'
-- end
