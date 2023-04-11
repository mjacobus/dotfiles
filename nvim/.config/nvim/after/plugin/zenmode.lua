
vim.keymap.set("n", "<leader>zz", function()
    require("zen-mode").setup {
        window = {
            width = 120,
            options = { }
        },
    }
    require("zen-mode").toggle()
    vim.wo.wrap = false
    vim.wo.number = true
end)


vim.keymap.set("n", "<leader>zZ", function()
    require("zen-mode").setup {
        window = {
            width = 120,
            options = { }
        },
    }
    require("zen-mode").toggle()
    vim.wo.wrap = false
    vim.wo.number = false
    vim.opt.colorcolumn = "0"
end)
