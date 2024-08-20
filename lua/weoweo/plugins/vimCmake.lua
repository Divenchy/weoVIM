return {
    'cdelledonne/vim-cmake',
    config = function()
        vim.g.cmake_link_compile_commands = 1

        vim.keymap.set("n", "<leader>cg", ":CMakeGenerate<cr>")
        vim.keymap.set("n", "<leader>cb", ":CMakeBuild<cr>")
        vim.keymap.set("n", "<leader>gt", ":GTestRunUnderCursor<cr>")
    end
}
