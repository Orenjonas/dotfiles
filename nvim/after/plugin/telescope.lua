require("telescope").load_extension("lsp_handlers")

local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>gt', builtin.current_buffer_tags, {})
vim.keymap.set('n', '<leader>gf', builtin.git_files, {})
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<leader>fs', builtin.grep_string, {})
vim.keymap.set('n', '<leader>ps', function()
    builtin.grep_string({ search = vim.fn.input("Search for: ") });
end)
vim.keymap.set('n', '<leader>bs', builtin.current_buffer_fuzzy_find, {})

vim.keymap.set('n', '<leader>ts', builtin.builtin, {})
vim.keymap.set('n', '<leader>bb', builtin.buffers, {})
vim.keymap.set('n', '<leader>cm', builtin.commands, {})

require("telescope").setup({
    extensions = {
        lsp_handlers = {
            code_action = {
                telescope = require('telescope.themes').get_dropdown({})
            }
        }
    }
})
