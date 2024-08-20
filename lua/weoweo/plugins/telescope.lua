return {
    'nvim-telescope/telescope.nvim',
    event = 'VimEnter',
    branch = '0.1.x',
    dependencies = { 'nvim-lua/plenary.nvim',
                   { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
                   { 'nvim-telescope/telescope-ui-select.nvim' },
                   { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
                   },
    config = function()
        local telescope = require("telescope")
        local actions = require("telescope.actions")
        telescope.setup({
            defaults = {
                mappings = {
                    i = {
                        ['<C-enter>'] = 'to_fuzzy_refine',
                        ["<C-e>"] = actions.move_selection_previous, --move to prev result
                        ["<C-n>"] = actions.move_selection_next, --move to next result
                        ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist, --quit
                    },
                },
                extensions = {
                    [ 'ui-select' ] = {
                        require('telescope.themes').get_dropdown(),
                    },
                },
            },
        })

        telescope.load_extension("fzf");
        telescope.load_extension("ui-select");


        -- Telescope keybindings
        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>pf', builtin.find_files, { desc = "[P]roject [F]iles search"})
        vim.keymap.set('n', '<leader>pg', builtin.git_files, { desc = "[P]roject [G]it Files search"})
        vim.keymap.set('n', '<leader>ps', function() builtin.grep_string({ search = vim.fn.input("Grep > ") })end, { desc = "[P]roject [S]earch word"})
        vim.keymap.set('n', '<leader>pl', builtin.live_grep, { desc = "[P]roject [l]ive grep"})
        vim.keymap.set('n', '<leader>pr', builtin.oldfiles, { desc = "[P]roject [R]ecent files"})
        vim.keymap.set('n', '<leader>vh', builtin.help_tags, { desc = "[V]iew [H]elp tags"})
        vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers'})
    end
}
