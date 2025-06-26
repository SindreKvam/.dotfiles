local conform = require("conform")

conform.setup({
	format_on_save = {
		-- These options will be passed to conform.format()
		timeout_ms = 5000,
		lsp_format = "fallback",
	},
	formatters_by_ft = {
		lua = { "stylua" },
		python = { "black" },
	},
})

conform.formatters.black = {
	prepend_args = function(self, ctx)
		return { "--line-length=90" }
	end,
}
