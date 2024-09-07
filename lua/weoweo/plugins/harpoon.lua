return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim", 'nvim-telescope/telescope.nvim' },
    config = function ()
        local harpoon = require('harpoon')
        harpoon:setup({
            settings = {
                save_on_toggle = true
            }
        })

        -- Remaps
        vim.keymap.set("n", "<C-l>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
        vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
        vim.keymap.set("n", "<leader>1", function() harpoon:list():select(1) end)
        vim.keymap.set("n", "<leader>2", function() harpoon:list():select(2) end)
        vim.keymap.set("n", "<leader>3", function() harpoon:list():select(3) end)
        vim.keymap.set("n", "<leader>4", function() harpoon:list():select(4) end)

        -- Toggle previous & next buffers stored within Harpoon list
        -- Remaps
        vim.keymap.set("n", "<C-A-P>", function() harpoon:list():prev() end)
        vim.keymap.set("n", "<C-A-N>", function() harpoon:list():next() end)
        -- basic telescope configuration
    end
}
