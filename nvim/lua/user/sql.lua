vim.api.nvim_create_autocmd("FileType", {
    pattern = "sql",
    callback = function()
        vim.opt.foldmethod = 'indent'
    end
})
