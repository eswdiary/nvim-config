return {
    {
        'echasnovski/mini.nvim', version = false,
        
        config = function()
            -- 自動括號補全
            require('mini.pairs').setup()
            
            -- 縮排
            require('mini.indentscope').setup {
                draw = {
                    animation = require('mini.indentscope').gen_animation.none()
                }
            }

            -- 自動包覆
            require('mini.surround').setup({
                mappings = {
                    add = 'sa', -- Add surrounding in Normal and Visual modes
                    delete = 'sd', -- Delete surrounding
                    find = 'sf', -- Find surrounding (to the right)
                    find_left = 'sF', -- Find surrounding (to the left)
                    highlight = 'sh', -- Highlight surrounding
                    replace = 'sr', -- Replace surrounding
                    update_n_lines = 'sn', -- Update `n_lines`

                    suffix_last = 'l', -- Suffix to search with "prev" method
                    suffix_next = 'n', -- Suffix to search with "next" method
              },
            })
        end
    },
}
