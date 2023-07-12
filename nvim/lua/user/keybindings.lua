vim.g.mapleader = " "
vim.keymap.set("i", "jk", "<esc>l", { silent = true })
vim.keymap.set("t", "jk", [[<C-\><C-n>]], { silent = true })

-- move visual selection
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- -- append line below to current line without moving cursor
-- vim.keymap.set("n", "J", "mzJ`z")

-- yank to system clipboard
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>Y", "\"+Y")

-- edit nvimrc
vim.keymap.set("n", "<leader>erc", ":edit ~/.config/nvim/init.lua <cr>")
-- edit dotfiles
vim.keymap.set("n", "<leader>edf", ":edit ~/.dotfiles <cr>")

-- -- open urls with netrw disabled (when using nvim-tree)
-- if vim.fn.has("mac") == 1 then
--     vim.keymap.set("n", "gx", '<Cmd>call jobstart(["open", expand("<cfile>")], {"detach": v:true})<CR>')
-- elseif vim.fn.has("unix") == 1 then
--     vim.keymap.set("n", "gx", '<Cmd>call jobstart(["xdg-open", expand("<cfile>")], {"detach": v:true})<CR>', {})
-- end

-- -- Splits
-- vim.keymap.set( "n", "<leader>;", "<cmd>vsplit n<CR>" )
-- vim.keymap.set( "n", "<leader>'", "<cmd>split n<CR>" )
-- -- Center search results
-- vim.keymap.set( "n", "n", "nzz" )
-- vim.keymap.set( "n", "N", "Nzz" )
-- split navigation
vim.keymap.set( "n", "<C-J>", "<C-W><C-J>" )
vim.keymap.set( "n", "<C-K>", "<C-W><C-K>" )
vim.keymap.set( "n", "<C-L>", "<C-W><C-L>" )
vim.keymap.set( "n", "<C-H>", "<C-W><C-H>" )
-- split resizing
vim.keymap.set( "n", "<C-Left>", "<cmd>vertical resize +3<CR>" )
vim.keymap.set( "n", "<C-Right>", "<cmd>vertical resize -3<CR>" )
vim.keymap.set( "n", "<C-Up>", "<cmd>resize +3<CR>" )
vim.keymap.set( "n", "<C-Down>", "<cmd>resize -3<CR>" )
vim.keymap.set( "i", "<C-Left>", "<cmd>vertical resize +3<CR>" )
vim.keymap.set( "i", "<C-Right>", "<cmd>vertical resize -3<CR>" )
vim.keymap.set( "i", "<C-Up>", "<cmd>resize +3<CR>" )
vim.keymap.set( "i", "<C-Down>", "<cmd>resize -3<CR>" )
-- Buffers
vim.keymap.set( "n", "]b", "<cmd>bnext<CR>" )
vim.keymap.set( "n", "[b", "<cmd>bprev<CR>" )
vim.keymap.set( "n", "<leader>B", ":ls<CR>:b<Space>" )
vim.keymap.set( "n", "<leader>bd", "<cmd>bdelete<CR>" )
vim.keymap.set( "n", "<leader>bo", "<cmd>%bdelete|edit#|bdelete#<CR>" )
vim.keymap.set( "n", "<C-w>d", "<cmd>bdelete<CR>" )
-- Tabs
vim.keymap.set( "n", "]t", "<cmd>tabn<CR>" )
vim.keymap.set( "n", "[t", "<cmd>tabp<CR>" )
vim.keymap.set( "n", "<leader>tt", "<cmd>tabnew<CR>" )
vim.keymap.set( "n", "<leader>tl", "<cmd>tabnext<cr>" )
vim.keymap.set( "n", "<leader>th", "<cmd>tabprevious<cr>" )
vim.keymap.set( "n", "<leader>tj", "<cmd>tablast<CR>" )
vim.keymap.set( "n", "<leader>tk", "<cmd>tabfirst<CR>" )
vim.keymap.set( "n", "<leader>tc", "<cmd>tabclose<CR>" )
vim.keymap.set( "n", "<leader>to", "<cmd>tabonly<cr>" )
vim.keymap.set( "n", "<leader>tH", "<cmd>-tabmove<CR>" )
vim.keymap.set( "n", "<leader>tL", "<cmd>+tabmove<CR>" )
vim.keymap.set( "n", "<leader>tJ", "<cmd>tabmove 0<CR>" )
vim.keymap.set( "n", "<leader>tK", "<cmd>tabmove $<CR>" )
-- <tab> / <s-tab> | Circular windows navigation
vim.keymap.set( "n", "<Tab>", "<cmd>tabn<CR>" )
vim.keymap.set( "n", "<S-Tab>", "<cmd>tabp<CR>" )
-- Terminal
vim.keymap.set( "t", "<esc>", "(&filetype == 'fzf') ? '<Esc>' : '<c-\\><c-n>'", { expr = true } )
vim.keymap.set( "n", "<leader>`", ":10split <Bar> :terminal<CR>" )
-- quickfix list
vim.keymap.set( "n", "<leader>qo", "<cmd>copen<CR>" )
vim.keymap.set( "n", "]q", "<cmd>cnext<CR>" )
vim.keymap.set( "n", "[q", "<cmd>cprev<CR>" )
vim.keymap.set( "n", "<leader>qc", "<cmd>cclose<CR>" )
-- location list
vim.keymap.set( "n", "<leader>lo", "<cmd>lopen<CR>" )
vim.keymap.set( "n", "]l", "<cmd>lnext<CR>" )
vim.keymap.set( "n", "[l", "<cmd>lprev<CR>" )
vim.keymap.set( "n", "<leader>lc", "<cmd>lclose<CR>" )
-- Replace all tabs with 4 whitespaces
vim.keymap.set( "n", "<leader>T", "<cmd>%s/\t/    /g<CR>" )
-- Strip all trailing whitespace in the current file
vim.keymap.set( "n", "<leader>W", "<cmd>%s/\\s\\+$//<cr>:let @/=''<CR>" )
-- Visual shifting (does not exit Visual mode)
vim.keymap.set( "v", "<", "<gv" )
vim.keymap.set( "v", ">", ">gv" )
-- Linewise wrapped lines movement
vim.keymap.set( "n", "j", "gj" )
vim.keymap.set( "n", "k", "gk" )
-- \v selects code that was just pasted in the visual mode last used
vim.keymap.set( "n", "<leader>v", "'`[' . strpart(getregtype(), 0, 1) . '`]'", { expr = true } )
-- Yank all buffer
vim.keymap.set( "n", "<leader>A", "<cmd>%y<CR>" )
-- Visual all buffer
vim.keymap.set( "n", "ggVG", "<cmd>%y<CR>" )
-- -- Make undo stop on these symbols
-- vim.keymap.set( "i", ",", ",<C-g>u" )
-- vim.keymap.set( "i", ".", ".<C-g>u" )
-- vim.keymap.set( "i", "!", "!<C-g>u" )
-- vim.keymap.set( "i", "?", "?<C-g>u" )
-- -- Move text
-- vim.keymap.set( "v", "<A-j>", ":m '>+1<CR>gv=gv" )
-- vim.keymap.set( "v", "<A-k>", ":m '<-2<CR>gv=gv" )
-- vim.keymap.set( "i", "<A-j>", "<esc>:m .+1<CR>==i" )
-- vim.keymap.set( "i", "<A-k>", "<esc>:m .-2<CR>==i" )
-- vim.keymap.set( "n", "<A-j>", ":m .+1<CR>==" )
-- vim.keymap.set( "n", "<A-k>", ":m .-2<CR>==" )
-- Press * to search for the term under the cursor and then press a key below
-- to replace all instances of it in the current file.
-- Second binding is for comfirmation.
vim.keymap.set( "n", "<leader>rr", ":%s///g<Left><Left>" )
vim.keymap.set( "n", "<leader>rc", ":%s///gc<Left><Left><Left>" )
-- The same as above but instead of acting on the whole file it will be
-- restricted to the previously visually selected range. You can do that by
-- pressing *, visually selecting the range you want it to apply to and then
-- press a key below to replace all instances of it in the current selection.
vim.keymap.set( "x", "<leader>rr", ":s///g<Left><Left>" )
vim.keymap.set( "x", "<leader>rc", ":s///gc<Left><Left><Left>" )
-- Press key below on the word or on visual selection and type a replacement term.
-- Press . to repeat the replacement again. Useful
-- for replacing a few instances of the term (comparable to multiple cursors).
vim.keymap.set( "n", "<leader>rs", ":let @/='\\<'.expand('<cword>').'\\>'<CR>cgn" )
vim.keymap.set( "x", "<leader>rs", '"sy:let @/=@s<CR>cgn' )


-- -- Text-objects
-- -- https://thevaluable.dev/vim-create-text-objects/

-- Python multiline string as text object
vim.keymap.set("x", "im", '<esc>w?"""<cr>elvNh')
vim.keymap.set("o", "im", '<esc>w?"""<cr>elvNh')


