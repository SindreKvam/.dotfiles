vim.g.mapleader = " "

-- Copy to clipboard
vim.keymap.set("n", "<leader>yy", '"+yy')
vim.keymap.set("v", "<leader>y", '"+y')

vim.keymap.set({ "n", "v", "o" }, "ø", "^")
vim.keymap.set({ "n", "v", "o" }, "æ", "$")
