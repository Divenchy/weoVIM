return {
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        lazy = true,
        init = function()
            -- Disable automatic setup, we are doing it manually
            vim.g.lsp_zero_extend_cmp = 0
            vim.g.lsp_zero_extend_lspconfig = 0
        end,
    },
    {
        'williamboman/mason.nvim',
        lazy = false,
        config = true,
    },

    -- Autocompletion
    {
        'hrsh7th/nvim-cmp',
        event = 'InsertEnter',
        dependencies = {
            'L3MON4D3/LuaSnip',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-nvim-lua',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'saadparwaiz1/cmp_luasnip',
            'rafamadriz/friendly-snippets',
        },
        config = function()
            -- Here is where you configure the autocompletion settings.
            local luasnip = require("luasnip")
            local lsp_zero = require('lsp-zero')
            lsp_zero.extend_cmp()

            -- And you can configure cmp even more, if you want to.
            local cmp = require('cmp')
            local cmp_select = {behavior = cmp.SelectBehavior.Select}

            cmp.setup({
                completion = {
                    completeopt = "menu,menuone,preview,noselect",
                },
                snippet = { -- configure how nvim-cmp interacts with snippet engine
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end,
                },
                sources = {
                    {name = 'path'},
                    {name = 'nvim_lsp'},
                    {name = 'nvim_lua'},
                    {name = 'luasnip', keyword_length = 2},
                    {name = 'buffer', keyword_length = 3},
                },
                formatting = lsp_zero.cmp_format(),
                mapping = cmp.mapping.preset.insert({
                    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
                    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
                    ['<CR>'] = cmp.mapping.confirm({ select = false}),
                    ['<C-Space>'] = cmp.mapping.complete(),
                }),
            })

        end
    },

    -- LSP
    {
        'neovim/nvim-lspconfig',
        cmd = {'LspInfo', 'LspInstall', 'LspStart'},
        event = {'BufReadPre', 'BufNewFile'},
        dependencies = {
            {'hrsh7th/cmp-nvim-lsp'},
            {'williamboman/mason-lspconfig.nvim'},
        },
        config = function()
            -- This is where all the LSP shenanigans will live
            local lsp_zero = require('lsp-zero')
            lsp_zero.extend_lspconfig()

            lsp_zero.on_attach(function(client, bufnr)
                -- see :help lsp-zero-keybindings
                -- to learn the available actions
                lsp_zero.default_keymaps({buffer = bufnr})

                vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, { buffer = bufnr, remap = false, desc = 'Go to definition'})
                vim.keymap.set("n", "<leader>pd", function() vim.diagnostic.goto_prev() end, {buffer = bufnr, remap = false, desc = 'Go to [P]rev diagnostic'})
                vim.keymap.set("n", "<leader>nd", function() vim.diagnostic.goto_next() end, {buffer = bufnr, remap = false, desc = 'Go to [N]ext diagnostic'})
                vim.keymap.set("n", "<leader>e", function() vim.diagnostic.open_float() end, {buffer = bufnr, remap = false, desc = 'Show diagnostic [E]rror messages'})
                vim.keymap.set("n", "<leader>el", function() vim.diagnostic.setloclist() end, {buffer = bufnr, remap = false, desc = 'Open diagnostic [Q]uickfix [l]ist'})
                vim.keymap.set("n", "<leader>k", function() vim.lsp.buf.hover() end, {buffer = bufnr, remap = false, desc = '[K] for hover'})
                vim.keymap.set("n", "<leader>lws", function() vim.lsp.buf.workspace_symbol() end, {buffer = bufnr, remap = false})
                vim.keymap.set("n", "<leader>lca", function() vim.lsp.buf.code_action() end, {buffer = bufnr, remap = false, desc = 'Code_action (LSP)'})
                vim.keymap.set("n", "<leader>lrr", function() vim.lsp.buf.references() end, {buffer = bufnr, remap = false, desc = 'references (LSP)'})
                vim.keymap.set("n", "<leader>lrn", function() vim.lsp.buf.rename() end, {buffer = bufnr, remap = false, desc = 'rename (LSP)'})
                vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, {buffer = bufnr, remap = false, desc = 'signature_help (LSP)'})
            end)

            require('mason-lspconfig').setup({
                ensure_installed = { 'rust_analyzer', 'clangd', 'cssls', 'html', 'tailwindcss', 'jdtls', 'zls', 'ltex'},
                handlers = {
                    lsp_zero.default_setup,
                    lua_ls = function()
                        -- (Optional) Configure lua language server for neovim
                        local lua_opts = lsp_zero.nvim_lua_ls()
                        require('lspconfig').lua_ls.setup(lua_opts)
                    end,
                }
            })
        end
    }
}
