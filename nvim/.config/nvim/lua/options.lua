-- Basic settings
vim.opt.nu = true -- Show line numbers
vim.opt.relativenumber = true -- Relative line numbers
vim.opt.tabstop = 4 -- Number of spaces that a <Tab> counts for
vim.opt.shiftwidth = 4 -- Number of spaces to use for each step of (auto)indent
vim.opt.expandtab = true -- Use spaces instead of tabs
vim.opt.smartindent = true -- Smart autoindenting on new lines
vim.opt.wrap = false -- Disable line wrapping
vim.opt.hlsearch = true -- Highlight search results

vim.opt.scrolloff = 8

-- Fixes gitsigns jumping around by enabling signcolumn
vim.opt.signcolumn = "yes"

vim.opt.textwidth = 100
vim.opt.colorcolumn = "100" -- Highlight column

-- Warning colors when length exceeds recommended length
vim.cmd([[highlight OverLength ctermbg=darkred guibg=#592929]])

local function highlight_overlength()
	local col = vim.opt.textwidth:get()
	vim.fn.matchadd("Overlength", "\\%>" .. col .. "v.", 100)
end

vim.api.nvim_create_autocmd({ "InsertLeave", "BufWinEnter" }, {
	callback = highlight_overlength,
})

-- Diagnostics configuration
vim.diagnostic.config({
	virtual_text = true,
})
