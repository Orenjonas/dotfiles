vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.wrap = false

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.termguicolors = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.scrolloff = 8 -- Start scrolling 10 lines before edge of viewpoint
vim.opt.sidescrolloff = 8

vim.opt.colorcolumn = "80"
vim.opt.signcolumn = "yes"
vim.opt.guicursor = "i-ci:ver30-iCursor-blinkwait300-blinkon200-blinkoff150"
-- guicursor = "", -- Fix for mysterious 'q' letters
vim.opt.cursorline = true

vim.opt.completeopt = { "menu", "menuone", "noselect" }


-- vim.opt.updatetime = 300, -- Faster completion (default is 4000)

-- From https://github.com/horseinthesky/dotfiles/blob/master/files/lua/settings.lua
-- Search
vim.opt.incsearch = true
vim.opt.hlsearch = false
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.list = true
vim.opt.listchars = "tab:» ,trail:·,nbsp:+"

vim.opt.pumheight = 5
vim.opt.pumblend = 5

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        vim.highlight.on_yank { on_visual = false, timeout = 100 }
    end,
})

-- Return to last edit position when opening files (You want this!)
vim.api.nvim_create_autocmd("BufReadPost", {
    callback = function()
        local last_pos = vim.api.nvim_buf_get_mark(0, '"')
        local lcount = vim.api.nvim_buf_line_count(0)

        if last_pos[1] > 0 and last_pos[1] <= lcount then
            pcall(vim.api.nvim_win_set_cursor, 0, last_pos)
        end
    end,
})


vim.opt.clipboard = 'unnamedplus'

-- Yank to windows clipboard in WSL
-- if vim.fn.has("wsl") == 1 then
--     if vim.fn.executable("wl-copy") == 0 then
--         print("wl-clipboard not found, clipboard integration won't work")
--     else
--         vim.g.clipboard = {
--             name = "wl-clipboard (wsl)",
--             copy = {
--                 ["+"] = 'wl-copy --foreground --type text/plain',
--                 ["*"] = 'wl-copy --foreground --primary --type text/plain',
--             },
--             paste = {
--                 ["+"] = (function()
--                     return vim.fn.systemlist('wl-paste --no-newline|sed -e "s/\r$//"', {''}, 1) -- '1' keeps empty lines
--                 end),
--                 ["*"] = (function()
--                     return vim.fn.systemlist('wl-paste --primary --no-newline|sed -e "s/\r$//"', {''}, 1)
--                 end),
--             },
--             cache_enabled = true
--         }
--     end
-- end
--
-- Use system clipboard / WSL fix
if vim.fn.has('wsl') == 1 then
    vim.g.clipboard = {
        name = 'WslClipboard',
        copy = {
            ['+'] = 'clip.exe',
            ['*'] = 'clip.exe',
        },
        paste = {
            ['+'] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
            ['*'] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
        },
        cache_enabled = 0,
    }
end
