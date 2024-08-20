return {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
        lsp = {
            hover = {
                enabled = false,
            },
            signature = {
                enabled = false,
            },
            override = {
                ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                ["vim.lsp.util.stylize_markdown"] = true,
                ["cmp.entry.get_documentation"] = true,
            },
        },
        routes = {
            {
                filter = {
                    event = "msg_show",
                    any = {
                        { find = "%d+L, %d+B" },
                        { find = "; after #%d+" },
                        { find = "; before #%d+" },
                    },
                },
                view = "mini",
            },
        },
        presets = {
            bottom_search = true,
            command_palette = true,
            long_message_to_split = true,
            inc_rename = true,
        },
    },
    -- stylua: ignore
    vim.keymap.set("n", "<S-Enter>",    function() require("noice").redirect(vim.fn.getcmdline()) end, {desc = "Redirect Cmdline" }),
    vim.keymap.set("n", "<leader>snl",  function() require("noice").cmd("last") end, { desc = "Noice Last Message" }),
    vim.keymap.set("n", "<leader>snh",  function() require("noice").cmd("history") end, {desc = "Noice History" }),
    vim.keymap.set("n", "<leader>sna",  function() require("noice").cmd("all") end, {desc = "Noice All" }),
    vim.keymap.set("n", "<leader>snd",  function() require("noice").cmd("dismiss") end, {desc = "Dismiss All" }),
    vim.keymap.set("n", "<leader>snt",  function() require("noice").cmd("telescope") end, {desc = "Noice Telescope" }),
    vim.keymap.set("n", "<c-f>",        function() if not require("noice.lsp").scroll(4) then return "<c-f>" end end, {silent = true, expr = true, desc = "Scroll Forward" }),
    vim.keymap.set("n", "<c-b>",        function() if not require("noice.lsp").scroll(-4) then return "<c-b>" end end, {silent = true, expr = true, desc = "Scroll Backward" }),
}
