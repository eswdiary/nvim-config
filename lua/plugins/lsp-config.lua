return {
    -- mason.nvim
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end
    },

    -- mason-lspconfig 為 mason 建議安裝的第三方 lsp package，除了用 GUI 之外的管理選項與功能
    -- 如 ensure_installed
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup(
                {
                    -- 確保安裝
                    ensure_installed = { "lua_ls"},
                })
        end
    },

    -- nvim-lspconfig，讓 nvim 與 language server 溝通
    {
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require('lspconfig')
            -- cmp-nvim-lsp 的設定項
            local capabilities = require('cmp_nvim_lsp').default_capabilities()

            lspconfig.lua_ls.setup({
                -- cmp-nvim-lsp 的設定項
                capabilities = capabilities,
            })

            -- 這個 binding 目前已經是 plugin 的預設置了
            -- vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
            vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})
        end
    },

    vim.keymap.set('n', '<leader>ff', vim.lsp.buf.format, {})
}
