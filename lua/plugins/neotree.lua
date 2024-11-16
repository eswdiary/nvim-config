return {

    -- Neotree
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
        -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    },

    -- 設定 Neo-tree
    config = function()
        local neoTree = require('neo-tree')

        neoTree.setup {
            popup_border_style = "rounded",

            default_component_configs = {
                name = {
                    -- Git 狀態顏色標記
                    use_git_status_colors = true,
                },

                -- Git 狀態顏色標記設定
                git_status = {
                    symbols = {
                        -- Change type
                        added     = "󰬈", -- or "✚", but this is redundant info if you use git_status_colors on the name
                        modified  = "󰬔", -- or "", but this is redundant info if you use git_status_colors on the name
                        deleted   = "", -- this can only be used in the git_status source
                        renamed   = "", -- this can only be used in the git_status source
                        -- Status type
                        untracked = "󰬜",
                        ignored   = "",
                        unstaged  = "󰄱",
                        staged    = "",
                        conflict  = "",
                    }
                },
            },

            window = {
                mappings = {
                    ["<space>"] = "toggle_node",
                    ["L"] = "focus_preview",
                    ["l"] = "open",
                    ["P"] = { "toggle_preview", config = { use_float = true, use_image_nvim = false } }, -- 圖片預覽需使用其他支援之 terminal
                    ["h"] = "navigate_up",
                },
            },
            filesystem = {
                filtered_items = {
                    visible = true,
                    hide_dotfiles = true,
                    hide_gitignored = true,
                },
            },

        }

        -- 設定 shortcut
        vim.keymap.set('n', '<M-e>', ':Neotree source=filesystem reveal=true position=float toggle=true<CR>')
        -- postition = left, right, top, bottom, float, current
    end
}
