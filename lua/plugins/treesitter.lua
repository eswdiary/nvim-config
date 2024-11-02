return {

    -- Treesitter.nvim
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",

    -- 設定 Treesitter.nvim
    config = function()
        local configs = require('nvim-treesitter.configs')

        configs.setup {
            -- 安裝的 parser
            -- ensure_install = {
            --     "lua", "vim", "vimdoc", "javascript", "css", "html", "markdown", "markdown_inline", "yaml", "toml",
            --     "bash",
            -- }, 
            sync_install = false,

            -- 自動安裝 parser，需要 tree-sitter cli
            auto_install = true,
            highlight = { enable = true },
            indent = { enable = true },
        }
    end
}
