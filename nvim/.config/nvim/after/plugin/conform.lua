local conform = require("conform")
conform.setup()

vim.keymap.set("n", "<leader>saf", function()
    conform.format({ lsp_fallback = true })
end, { desc = "Format document" })

vim.keymap.set("v", "<leader>saf", function()
    conform.format({ lsp_fallback = true })
end, { desc = "Format selection" })
