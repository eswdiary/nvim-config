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
        end
    },
}
