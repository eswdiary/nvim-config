-- indent-blankline
return {
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        ---@module "ibl"
        ---@diagnostic disable-next-line: undefined-doc-name
        ---@type ibl.config
        opts = {},

        config = function()
            require("ibl").setup()
        end,
    },

    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = function()
            require("nvim-autopairs").setup({
                disable_filetype = { "TelescopePrompt", "vim" },
                map_cr = true,
                map_bs = true, -- map the <BS> key
                map_c_h = false, -- Map the <C-h> key to delete a pair
                map_c_w = false, -- map <c-w> to delete a pair if possible
            })
        end,
        -- use opts = {} for passing setup options
        -- this is equivalent to setup({}) function
    },
}

