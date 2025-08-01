local mason_lspconfig = require("mason-lspconfig")
local cmp = require("cmp")
local lspkind = require("lspkind")

mason_lspconfig.setup({
	ensure_installed = {
		"pylsp",
		"lua_ls",
		"vtsls",
	},
	handlers = {
		function(server_name)
			require("lspconfig")[server_name].setup({})
		end,
	},
	exclude = {
		"clangd",
		"rust_analyzer",
	},
})

if vim.fn.executable("clangd") then
	vim.lsp.enable("clangd")
end
if vim.fn.executable("rust_analyzer") then
	vim.lsp.enable("rust_analyzer")
end

-- Remove warning for undefined vim
vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
		},
	},
})

-- Python-LSP config
-- This config is only for linting
-- See conform.lua for formatting
vim.lsp.config("pylsp", {
	settings = {
		pylsp = {
			plugins = {
				pylint = { enabled = false },
				ruff = { enabled = true },
				black = { enabled = false },
				flake8 = { enabled = false },
				pycodestyle = { enabled = false },
				pyflakes = { enabled = false },
				mccabe = { enabled = false },
			},
		},
	},
})

-- setup cmp
cmp.setup({
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body) -- for `luasnip` users.
		end,
	},
	formatting = {
		fields = { "abbr", "kind", "menu" },
		expandable_indicator = true,
		format = lspkind.cmp_format({
			-- mode = 'symbol', -- show only symbol annotations
			-- maxwidth = 50,
			-- ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
			show_labeldetails = true, -- show labeldetails in menu. disabled by default
			-- the function below will be called before any actual modifications from lspkind
			-- so that you can provide more controls on popup customization. (see [#30](https://github.com/onsails/lspkind-nvim/pull/30))
			before = function(entry, vim_item)
				return vim_item
			end,
		}),
	},
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	mapping = cmp.mapping.preset.insert({
		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.abort(),
		["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
	}),
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "nvim-lsp-signature-help" },
		{ name = "vsnip" }, -- For vsnip users.
		{ name = "luasnip" }, -- For luasnip users.
		-- { name = 'ultisnips' }, -- For ultisnips users.
		-- { name = 'snippy' }, -- For snippy users.
	}, {
		{ name = "buffer" },
	}),
})

-- To use git you need to install the plugin petertriho/cmp-git and uncomment lines below
-- Set configuration for specific filetype.
--[[ cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
        { name = 'git' },
    }, {
        { name = 'buffer' },
    })
})
require("cmp_git").setup() ]]
--

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ "/", "?" }, {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = "buffer" },
	},
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(":", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = "path" },
	}, {
		{ name = "cmdline" },
	}),
	matching = { disallow_symbol_nonprefix_matching = false },
})
