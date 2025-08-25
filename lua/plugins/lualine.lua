return {
    'nvim-lualine/lualine.nvim',
    config = function()
        -- SCNvim 在 lualin 中顯示
        local function scstatus()
            if vim.bo.filetype == "supercollider" then
                local stat = vim.fn["scnvim#statusline#server_status"]() or ""
                stat = stat:gsub("%%", "♪")
                return stat
            else
                return ""
            end
        end

        require("lualine").setup {
            options = {
                theme = "gruvbox-material", -- 見 Github lualine.nvim/THEMES
            },
            sections = {
                lualine_a = { 'mode' },
                lualine_b = { 'branch', 'diff', 'diagnostics' },
                lualine_c = { 'filename', scstatus },
                lualine_x = { 'encoding', 'fileformat', 'filetype' },
                lualine_y = { 'progress' },
                lualine_z = { 'location' }
            },
        }
    end
}
