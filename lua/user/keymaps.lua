local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

-- Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

--  Normal  --
-- 分割視窗移動  Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- 開啟導覽 --
keymap("n", "<leader>e", ":Lex 30<cr>", opts)

-- Resize with arrows
-- 調整分割視窗大小
--keymap("n", "<SC-Up>", ":resize +2<CR>", opts)
--keymap("n", "<SC-Down>", ":resize -2<CR>", opts)
--keymap("n", "<SC-Left>", ":vertical resize +2<CR>", opts)
--keymap("n", "<SC-Right>", ":vertical resize -2<CR>", opts)

keymap("n", "<D-Up>", ":resize +2<CR>", opts)
keymap("n", "<D-Down>", ":resize -2<CR>", opts)
keymap("n", "<D-Left>", ":vertical resize +2<CR>", opts)
keymap("n", "<D-Right>", ":vertical resize -2<CR>", opts)
-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- telescops
-- keymap("n", "<leader>f", "<cmd>Telescope find_files<cr>", opts)
keymap("n", "<leader>f", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", opts)
keymap("n", "<c-t>", "<cmd>Telescope live_grep<cr>", opts)
