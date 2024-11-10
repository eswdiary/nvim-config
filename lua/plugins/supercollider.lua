return {
    'davidgranstrom/scnvim',

    config = function()
        local scnvim = require 'scnvim'
        local map = scnvim.map
        local map_expr = scnvim.map_expr

        -- snippet 設定
        vim.g.scnvim_snippet_format = "luasnip"

        -- eval flash 設定 
        vim.g.scnvim_eval_flash_duration = 300
        vim.g.scnvim_eval_flash_repeats = 1

        -- doc 的顯示設定
        -- vim.g.scnvim_scdoc = 1

        scnvim.setup({
            keymaps = {
                ['<C-e>'] = map('editor.send_line', { 'i', 'n' }),
                ['<S-Enter>'] = {
                    map('editor.send_block', { 'i', 'n' }),
                    map('editor.send_selection', 'x'),
                },
                ['<CR>'] = map('postwin.toggle'),
                ['<Cs-P>'] = map('postwin.clear', { 'n', 'i' }),
                ['<C-.>'] = map('sclang.hard_stop', { 'n', 'x', 'i' }),
                ['<leader>ss'] = map('sclang.start'),
                ['<leader>sr'] = map('sclang.recompile'),
                ['<C-b>'] = map_expr('s.boot'),
                ['<F3>'] = map_expr('s.meter'),
            },
            editor = {
                highlight = {
                    color = 'IncSearch',    -- IncSearch, TermCursor
                    type = 'flash',     -- flash, fade
                },
            },
            postwin = {
                float = {
                    enabled = false,
                },
            },
            -- 覺得沒有比較方便就是了……
            -- documentation = {
            --     cmd = '/usr/bin/pandoc',
            -- },
        })
    end
}
