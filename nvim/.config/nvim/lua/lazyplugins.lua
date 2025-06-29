-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out,                            "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    "navarasu/onedark.nvim",
    {
        "nvim-telescope/telescope.nvim",
        branch = "0.1.x",
        dependencies = { "nvim-lua/plenary.nvim" },
    },
    {
        "nvim-treesitter/nvim-treesitter",
        branch = "master",
        lazy = false,
        build = ":TSUpdate",
    },
    {
        "mason-org/mason-lspconfig.nvim",
        opts = {},
        dependencies = {
            { "mason-org/mason.nvim", opts = {} },
            "neovim/nvim-lspconfig",
        },
    },
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            "hrsh7th/nvim-cmp",
            -- Snippet
            "hrsh7th/vim-vsnip",
            "L3MON4D3/LuaSnip",
            "rafamadriz/friendly-snippets",
            "onsails/lspkind.nvim",
        },
    },
    {
        "lewis6991/gitsigns.nvim",
    },
    {
        "folke/which-key.nvim",
    },
    {
        "stevearc/conform.nvim",
        opts = {},
    },
    {
        "nvim-tree/nvim-tree.lua",
    },
    {
        "nvim-tree/nvim-web-devicons",
        opts = {},
    },
    {
        "akinsho/bufferline.nvim",
        version = "*",
        dependencies = "nvim-tree/nvim-web-devicons",
    },
})
