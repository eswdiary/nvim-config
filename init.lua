-- Lazy.nvim 的初始設定
-- 「if 系統尚未安裝 lazy 則從 github clone」
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out,                            "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

-- 設定 leader key（Lazy 需求）
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

require("lazy").setup({
    spec = {
        { import = "plugins" }, -- 整合進 ~/.config/nvim/lua/plugins 目錄
    },
    -- 其他設置
    install = { colorscheme = { "habamax" } },
    checker = { enabled = true },
})
-- ~/.config/nvim/lua/plugins 底下 return 的整合

-- 設定 vim 相關
require("vim-options") -- ./lua/vim-options.lua
