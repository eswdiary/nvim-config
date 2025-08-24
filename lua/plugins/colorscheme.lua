return {
    -- Meterial Gruvbox 配色方案
    {
        'sainnhe/gruvbox-material',
        lazy = false,
        priority = 1000,
        config = function()
            vim.g.gruvbox_meterial_background = hard -- hard, medium, soft
            vim.g.gruvbox_meterial_foreground = mix -- material, mix, original
            vim.g.gruvbox_material_transparent_background = 2
            vim.g.gruvbox_material_enable_italic = true -- 啟用斜體
            -- 啟用 Colorscheme 需寫在最後
            vim.cmd.colorscheme('gruvbox-material')
        end
    },
}
