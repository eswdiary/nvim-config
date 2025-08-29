return {
    'davidgranstrom/scnvim',

    config = function()
        local scnvim = require 'scnvim'
        local map = scnvim.map
        local map_expr = scnvim.map_expr

        scnvim.setup({
            keymaps = {
                ['<C-e>'] = map('editor.send_line', { 'i', 'n' }),
                ['<leader>se'] = {
                    map('editor.send_block', { 'i', 'n' }),
                    map('editor.send_selection', 'x'),
                },
                ['<CR>'] = map('postwin.toggle'),
                ['<Cs-P>'] = map('postwin.clear', { 'n', 'i' }),
                ['<C-.>'] = map('sclang.hard_stop', { 'n', 'x', 'i' }),
                ['<leader>ss'] = map('sclang.start', { 'n' }),
                ['<leader>sr'] = map('sclang.recompile', { 'n' }),
                ['<leader>sb'] = map_expr('s.boot', { 'n' }),
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

            snippet = {
                engine = { 
                    name = 'luasnip',
                    options = { descriptions = true }
                },
            }
        })
    end
}

