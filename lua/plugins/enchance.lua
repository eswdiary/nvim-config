return {
    {
        "goolord/alpha-nvim",
        config = function()
            local alpha = require("alpha")
            local dashboard = require("alpha.themes.dashboard")

            local function footer()
              local version = vim.version()
              local print_version = "v" .. version.major .. '.' .. version.minor .. '.' .. version.patch
              local datetime = os.date('%y%m%d')

              return print_version .. ' - ' .. datetime
            end

            -- Set header
            dashboard.section.header.val = {
                "                               /$$",
                "                              | $$",
                "  /$$$$$$  /$$  /$$  /$$  /$$$$$$$",
                " /$$__  $$| $$ | $$ | $$ /$$__  $$",
                "| $$$$$$$$| $$ | $$ | $$| $$  | $$",
                "| $$_____/| $$ | $$ | $$| $$  | $$",
                "|  $$$$$$$|  $$$$$/$$$$/|  $$$$$$$",
                " \\_______/ \\_____/\\___/  \\_______/",
            }

            -- Set menu
            dashboard.section.buttons.val = {
                dashboard.button("e", "  > New file", ":ene <BAR> startinsert<CR>"),
                dashboard.button("o", "  > Open file", ":Telescope find_files<CR>"),
                dashboard.button("r", "  > Recent", ":Telescope oldfiles<CR>"),
                dashboard.button("s", "  > Settings", ":e $MYVIMRC<CR>"),
                dashboard.button("q", "  > Quit", ":qa<CR>"),
            }

            dashboard.section.footer.val = footer()     -- 顯示 Footer

            alpha.setup(dashboard.config)

        end
    },

    {
        -- Cursor 動畫
        "sphamba/smear-cursor.nvim", opts = { 
            -- Smear cursor when switching buffers or windows.
            smear_between_buffers = false,
            
            -- Smooth cursor without smear
            stiffness = 0.5,
            trailing_stiffness = 0.5,
            matrix_pixel_threshold = 0.5,

            time_interval = 7, -- milliseconds

            -- Faster smear                       -- Default  Range
            -- stiffness = 0.5,                      -- 0.6      [0, 1]
            -- trailing_stiffness = 0.6,             -- 0.45     [0, 1]
            -- stiffness_insert_mode = 0.7,          -- 0.5      [0, 1]
            -- trailing_stiffness_insert_mode = 0.7, -- 0.5      [0, 1]
            -- damping = 0.95,                       -- 0.85     [0, 1]
            -- damping_insert_mode = 0.95,           -- 0.9      [0, 1]
            -- distance_stop_animating = 0.5,        -- 0.1      > 0
        },
    }
}
