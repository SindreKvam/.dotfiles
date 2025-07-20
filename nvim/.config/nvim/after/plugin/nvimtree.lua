-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

-- setup with some options
require("nvim-tree").setup({
    sort = {
        sorter = "case_sensitive",
    },
    view = {
        -- adaptive_size = true,
        width = 30,
    },
    renderer = {
        group_empty = true,
    },
    filters = {
        dotfiles = true,
    },
    actions = {
        open_file = {
            quit_on_open = false,
        },
    },
})

vim.keymap.set({ "n" }, "<leader>ex", ":NvimTreeOpen<Cr>", { desc = "Open explorer" })
