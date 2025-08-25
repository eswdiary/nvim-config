return {
    {
        'MeanderingProgrammer/render-markdown.nvim',
        -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
        -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
        -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
        ---@module 'render-markdown'
        ---@type render.md.UserConfig
        opts = {},

        config = function()
            require("render-markdown").setup({
                completions = { 
                    lsp = { enabled = true }, 
                    blink = { enable = true } 
                },

                heading  = {
                    enabled = false
                },

                code = {
                    sign = false,
                },

                bullet = {
                    icons = { '', '', '◆', '◇' },
                }, 
            })

            vim.keymap.set('n', '<leader>e', ':RenderMarkdown toggle<CR>')    -- 切換 Buffer
        end
    }    
}
