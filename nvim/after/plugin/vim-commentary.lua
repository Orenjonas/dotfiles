-- Control v to comment our lines
vim.keymap.set("v", "<A-/>", ":Commentary<CR>`>j")
vim.keymap.set("i", "<A-/>", "<ESC>:Commentary<CR>j")
vim.keymap.set("n", "<A-/>", ":Commentary<CR>j")
