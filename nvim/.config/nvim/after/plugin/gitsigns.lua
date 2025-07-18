local gitsigns = require('gitsigns')

gitsigns.setup {
    signs = {
        add          = { text = '┃' },
        change       = { text = '┃' },
        delete       = { text = '_' },
        topdelete    = { text = '‾' },
        changedelete = { text = '~' },
        untracked    = { text = '┆' },
    },
    signs_staged = {
        add          = { text = '┃' },
        change       = { text = '┃' },
        delete       = { text = '_' },
        topdelete    = { text = '‾' },
        changedelete = { text = '~' },
        untracked    = { text = '┆' },
    },
    signs_staged_enable = true,
    signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
    numhl      = true, -- Toggle with `:Gitsigns toggle_numhl`
    linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
    word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
    watch_gitdir = {
        follow_files = true
    },
    auto_attach = true,
    attach_to_untracked = false,
    current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
    current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
        delay = 1000,
        ignore_whitespace = false,
        virt_text_priority = 100,
        use_focus = true,
    },
    current_line_blame_formatter = '<author>, <author_time:%R> - <summary>',
    sign_priority = 6,
    update_debounce = 100,
    status_formatter = nil, -- Use default
    preview_config = {
        -- Options passed to nvim_open_win
        style = 'minimal',
        relative = 'cursor',
        row = 0,
        col = 1
    },
    on_attach = function(bufnr)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
        end

        -- Navigation
        map('n', ']c', function()
            if vim.wo.diff then
                vim.cmd.normal({']c', bang = true})
            else
                gs.nav_hunk('next')
            end
        end)

        map('n', '[c', function()
            if vim.wo.diff then
                vim.cmd.normal({'[c', bang = true})
            else
                gs.nav_hunk('prev')
            end
        end)

        -- Actions
        map('n', '<leader>hs', gs.stage_hunk, { desc = "Stage hunk"})
        map('n', '<leader>hr', gs.reset_hunk, { desc = "Reset hunk"})
        map('v', '<leader>hs', function() gs.stage_hunk({ vim.fn.line('.'), vim.fn.line('v') }) end, { desc = "Stage hunk"})
        map('v', '<leader>hr', function() gs.reset_hunk({ vim.fn.line('.'), vim.fn.line('v') }) end, { desc = "Reset hunk"})
        map('n', '<leader>hu', gs.undo_stage_hunk, { desc = "Undo stage hunk"})

        map('n', '<leader>hS', gs.stage_buffer, { desc = "Stage buffer"})
        map('n', '<leader>hR', gs.reset_buffer, { desc = "Reset buffer"})

        map('n', '<leader>hd', gs.diffthis, { desc = "Hunk diff"})
        map('n', '<leader>hD', function() gs.diffthis('~') end, { desc = "Hunk diff with ~"})

        -- Toggles
        map('n', '<leader>tb', gs.toggle_current_line_blame, { desc = "Toggle current line blame"})
        map('n', '<leader>tw', gs.toggle_word_diff, { desc = "Toggle word diff"})

        -- Text object
        map({'o', 'x'}, 'ih', gs.select_hunk, { desc = "Select hunk"})
    end
}
