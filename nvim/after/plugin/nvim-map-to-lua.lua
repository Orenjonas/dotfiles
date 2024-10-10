vim.api.nvim_set_keymap("", "<leader>w", "<Plug>CamelCaseMotion_w", { silent = true, })
vim.api.nvim_set_keymap("", "<leader>b", "<Plug>CamelCaseMotion_b", { silent = true, })
vim.api.nvim_set_keymap("", "<leader>e", "<Plug>CamelCaseMotion_e", { silent = true, })
vim.api.nvim_set_keymap("", "<leader>ge", "<Plug>CamelCaseMotion_ge", { silent = true, })
-- unmap w
-- unmap b
-- unmap e
-- unmap ge

vim.api.nvim_set_keymap("o", "<leader>iw", "<Plug>CamelCaseMotion_iw", { silent = true, })
vim.api.nvim_set_keymap("x", "<leader>iw", "<Plug>CamelCaseMotion_iw", { silent = true, })
vim.api.nvim_set_keymap("o", "<leader>ib", "<Plug>CamelCaseMotion_ib", { silent = true, })
vim.api.nvim_set_keymap("x", "<leader>ib", "<Plug>CamelCaseMotion_ib", { silent = true, })
vim.api.nvim_set_keymap("o", "<leader>ie", "<Plug>CamelCaseMotion_ie", { silent = true, })
vim.api.nvim_set_keymap("x", "<leader>ie", "<Plug>CamelCaseMotion_ie", { silent = true, })

vim.api.nvim_set_keymap("i", "<S-Left>", "<C-o><Plug>CamelCaseMotion_b", { silent = true, })
vim.api.nvim_set_keymap("i", "<S-Right>", "<C-o><Plug>CamelCaseMotion_w", { silent = true, })
