vim.g.mapleader = " "
vim.g.maplocalleader = " "



-- Disable arrow keys in normal mode
vim.keymap.set('n', '<left>', '<cmd>echo "Use m to move!!"<CR>')
vim.keymap.set('n', '<right>', '<cmd>echo "Use n to move!!"<CR>')
vim.keymap.set('n', '<up>', '<cmd>echo "Use e to move!!"<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "Use i to move!!"<CR>')

--------------------------------------------------------------------
-- Colemak Bindings
--------------------------------------


--- Movement
vim.keymap.set('n', 'm', 'h')
vim.keymap.set('n', 'n', 'j')
vim.keymap.set('n', 'e', 'k')
vim.keymap.set('n', 'i', 'l')
vim.keymap.set('v', 'm', 'h')
vim.keymap.set('v', 'n', 'j')
vim.keymap.set('v', 'e', 'k')
vim.keymap.set('v', 'i', 'l')
vim.keymap.set('v', 'h', 'i')
vim.keymap.set('v', 'H', 'I')

vim.keymap.set('n', 'h', 'i')
vim.keymap.set('n', 'H', 'I')

---- Tab movement
vim.keymap.set('n', '<leader><Tab>', 'gt')

-- Need to fix insert and n (search next)
-- vim.keymap.set("n", "n", "nzzzv", { desc = "Next in search"})
-- vim.keymap.set("n", "N", "Nzzzv", { desc = "prev in search"})
vim.keymap.set("n", "<A-n>", "nzzzv", { desc = "Next in search"})
vim.keymap.set("n", "<A-N>", "Nzzzv", { desc = "prev in search"})

-- Fixing e (end of word)

-- vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move whole line down"})
-- vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move whole line up"})
vim.keymap.set("v", "N", ":m '>+1<CR>gv=gv", { desc = "Move whole line down"})
vim.keymap.set("v", "E", ":m '<-2<CR>gv=gv", { desc = "Move whole line up"})

vim.keymap.set("n", "<leader>ex", vim.cmd.Ex, { desc = "Go back to NetRW"})

--Ez movement between neovim panes
vim.keymap.set("n", "<S-m>", "<C-w><C-h>", {desc = 'Move focus to the left window'})
vim.keymap.set("n", "<S-i>", "<C-w><C-l>", {desc = 'Move focus to the right window'})
vim.keymap.set("n", "<S-n>", "<C-w><C-j>", {desc = 'Move focus to the lower window'})
vim.keymap.set("n", "<S-e>", "<C-w><C-k>", {desc = 'Move focus to the upper window'})

-- Half page movement
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Half page down"})
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Half page up"})

-- Going up and down drop dowm menus and stuffz
vim.keymap.set("n", "<C-p>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>p", "<cmd>lprev<CR>zz")
vim.keymap.set("n", "<C-n>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<leader>n", "<cmd>lnext<CR>zz")

-- Alternative Esc
vim.keymap.set("i", "<C-c>", "<Esc>")

---- Text Editing Bindings ----

vim.keymap.set("n", "J", "mzJ`z", { desc = "Join lines"})

-- greatest remap ever
-- Paste over
vim.keymap.set("x", "<leader>p", [["_dP]], { desc = "Greatest remap ever"})

-- Yanking
-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Greatest remap ever pt. 2"})
vim.keymap.set("n", "<leader>Y", [["+Y]], { desc = "Greatest remap ever pt. 2 (caps ver.)"})

-- Deleting
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]], { desc = "TO THE VOID"})

-- Have highlighting on search, but remove highlighting after escaping
vim.keymap.set('n', '<C-c>', '<cmd>nohlsearch<CR>')


-- Buffers & Misc
vim.keymap.set("n", "Q", "<nop>")
--vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, {desc = "Lsp Buf Format"})


-- Easy search n replace & chmodding the mod
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Replace every instance of the selected word in the file"})
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true, desc = "chmodding" })


-- Ez write n save
vim.keymap.set("n", "<leader>w", ":w!<CR>", { desc = "Chronic saver huh?"})
vim.keymap.set("n", "<leader>q", ":q<CR>", { desc = "I'M FREEEE!!!!"})

-- Old man forgo' yer bindin's
vim.keymap.set("n", "<leader>kb", ":sp ~/.config/nvim/lua/weoweo/remap.lua<CR>", { desc = "View list of keybindings"})

-- View website
vim.keymap.set("n", "<leader><F1>", ':tabnew | term browser-sync start --server --files "*.js, *.html, *.css"<CR>')


-- Autocommands
-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

