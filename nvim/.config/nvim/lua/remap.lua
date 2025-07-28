vim.g.mapleader = " "

-- Update half page jumps to center the cursor
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Copy to clipboard
vim.keymap.set("n", "<leader>yy", '"+yy')
vim.keymap.set("v", "<leader>y", '"+y')
vim.keymap.set({ "n", "v" }, "<leader>p", '"+p')

vim.keymap.set({ "n", "v", "o" }, "ø", "^")
vim.keymap.set({ "n", "v", "o" }, "æ", "$")

vim.keymap.set("n", "<leader>|", ":vsplit<Cr>")
vim.keymap.set("n", "<leader>-", ":split<Cr>")
