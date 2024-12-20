vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Oil nvim
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- Disable arrow keys in normal mode
vim.keymap.set('n', '<left>', '<cmd>echo "Use m to move!!"<CR>')
vim.keymap.set('n', '<right>', '<cmd>echo "Use n to move!!"<CR>')
vim.keymap.set('n', '<up>', '<cmd>echo "Use e to move!!"<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "Use i to move!!"<CR>')

--- I HATE CHRONIC C-o
--- Second greatest remap
vim.keymap.set('i', '<C-n>', '<C-o>A', { desc = "Move to end"})

---- Tab movement
vim.keymap.set('n', '<leader><Tab>', 'gt', { desc = "Move to next tab"})

---- Search word
vim.keymap.set("n", "<A-n>", "nzzzv", { desc = "Next in search"})
vim.keymap.set("n", "<A-N>", "Nzzzv", { desc = "prev in search"})

---- Move lines
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move whole line down"})
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move whole line up"})

-- Ez movement between neovim panes
vim.keymap.set("n", "<S-h>", "<C-w><C-h>", {desc = 'Move focus to the left window'})
vim.keymap.set("n", "<S-l>", "<C-w><C-l>", {desc = 'Move focus to the right window'})
vim.keymap.set("n", "<S-j>", "<C-w><C-j>", {desc = 'Move focus to the lower window'})
vim.keymap.set("n", "<S-k>", "<C-w><C-k>", {desc = 'Move focus to the upper window'})

-- Half page movement
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Half page down"})
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Half page up"})

-- Going up and down drop dowm menus and stuffz
vim.keymap.set("n", "<C-p>", "<cmd>cprev<CR>zz", { desc = "Menu navigation"})
vim.keymap.set("n", "<C-n>", "<cmd>cnext<CR>zz", { desc = "Menu navigation"})
vim.keymap.set("n", "<A-p>", "<cmd>lprev<CR>zz", { desc = "Menu navigation"})
vim.keymap.set("n", "<A-n>", "<cmd>lnext<CR>zz", { desc = "Menu navigation"})

-- Alternative Esc
vim.keymap.set("i", "<C-c>", "<Esc>")

---- Text Editing Bindings ----

-- Make new file
vim.keymap.set('n', '<leader>N', ':edit ', { desc = "New file" })

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
vim.keymap.set('n', '<CR>', '<cmd>nohlsearch<CR>', { desc = "Stop highlighting"})


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
