-- General Keymaps
vim.g.mapleader = " " --Master key
local map = vim.api.nvim_set_keymap
local opts = {noremap = true, silent = true }

-- Navigation
map('n', '<leader>ff', '<cmd>Telescope find_files<cr>', opts) -- Searchs for files with Telecope
map('n', '<leader>fg', '<cmd>Telescope live_grep<cr>', opts) -- Searchs for text in files with Telescope
map('n', '<leader>fb', '<cmd>Telescope buffers<cr>', opts) -- List open buffers 
map('n', '<leader>fh', '<cmd>Telescope help_tag<cr>', opts) -- Help Neovim
map('n', '<C-n>', ':NvimTreeToggle<CR>', opts) -- File explorer
-- Windows Movement
map('n', '<C-h>', '<C-w>h', opts) --
map('n', '<C-j>', '<C-w>j', opts) --
map('n', '<C-k>', '<C-w>k', opts) --
map('n', '<C-l>', '<C-w>l', opts) --

-- Save and Close
map('n', '<leader>w', ':w<cr>', opts) -- Save file
map('n', '<leader>q', ':q<cr>', opts) -- Close window
