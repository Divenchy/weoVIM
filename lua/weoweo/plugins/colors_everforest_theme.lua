return {

    'neanias/everforest-nvim',
    version = false,
    lazy = false,
    priority = 1000,
    config = function()
        local forest = require('everforest')
        forest.setup({
            backround = "hard",
            transparent_background_level = 2,
            colours_override = function (palette)
                -- This is the color of a comment
                palette.grey1 = "#9DA9A0"
                palette.bg4 = "#8abfb2"
                palette.bg5 = "#e3d4ac"
            end
        })

        forest.load()
    end,
}
