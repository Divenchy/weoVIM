return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        local treesitter = require('nvim-treesitter.configs')

        treesitter.setup({
            -- A list of parser names, or "all" (the five listed parsers should always be installed)
            ensure_installed = { "typescript", "javascript", "python", "sql", "zig", "haskell", "fish", "perl", "java", "html", "css", "cpp", "rust", "c", "lua", "vim", "vimdoc", "query" },

            -- Install parsers synchronously (only applied to `ensure_installed`)
            sync_install = false,

            -- Automatically install missing parsers when entering buffer
            -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
            auto_install = true,

            highlight = {
                enable = true,

                -- Instead of true it can also be a list of languages
                additional_vim_regex_highlighting = false,
            },

            indent = {enable = true},

            autotag = {
                enable = true,
            }
        })
    end
}
