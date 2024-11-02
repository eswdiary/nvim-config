return {
    -- Meterial Gruvbox 配色方案
    {
        'sainnhe/gruvbox-material',
        lazy = false,
        priority = 1000,
        config = function()
---@diagnostic disable-next-line: undefined-global
            vim.g.gruvbox_meterial_background = hard -- hard, medium, soft
---@diagnostic disable-next-line: undefined-global
            vim.g.gruvbox_meterial_foreground = mix -- material, mix, original
            vim.g.gruvbox_material_transparent_background = 2
            vim.g.gruvbox_material_enable_italic = true -- 啟用斜體
            -- 啟用 Colorscheme 需寫在最後
            vim.cmd.colorscheme('gruvbox-material')
        end
    },

    -- Kanagawa 配色方案
    {
        'rebelot/kanagawa.nvim',
        config = function()
            -- kanagawa-wave, kanagawa-dragon, kanagawa-lotus(bright)
            -- vim.cmd.colorscheme('kanagawa-dragon')
        end
    },

    -- Rosepine 配色方案
    {
        "rose-pine/neovim",
        name = "rose-pine",
        -- config = function()
        --     require("rose-pine").setup({
        --     styles = { transparency = true, }
        -- })
        --     vim.cmd.colorscheme('rose-pine-main')
        -- end
    },
}
