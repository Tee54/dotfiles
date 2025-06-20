-- General Keymaps
vim.g.mapleader = " " --Master key

-- local map = vim.api.nvim_set_keymap
local map = vim.keymap.set
local opts = {noremap = true, silent = true }

-- Navigation
map('n', '<leader>ff', '<cmd>Telescope find_files<cr>', opts) -- Searchs for files with Telecope
map('n', '<leader>fg', '<cmd>Telescope live_grep<cr>', opts) -- Searchs for text in files with Telescope
map('n', '<leader>fb', '<cmd>Telescope buffers<cr>', opts) -- List open buffers 
map('n', '<leader>fh', '<cmd>Telescope help_tag<cr>', opts) -- Help Neovim
map('n', '<leader>fd', '<cmd>Telescope diagnostics<cr>', opts) -- LSP diagnostics

map('n', '<leader>pc', ':NvimTreeToggle<cr>', opts) -- File explorer
map('n', '<leader>pr', ':NvimTreeFocus<cr>', opts) -- File explorer

--Disable arrow keys
map('n', '<Up>', '<Nop>')
map('n', '<Left>', '<Nop>')
map('n', '<Right>', '<Nop>')
map('n', '<Down>', '<Nop>')

--Disable arrow keys INSERT mode
map('i', '<Up>', '<Nop>')
map('i', '<Left>', '<Nop>')
map('i', '<Right>', '<Nop>')
map('i', '<Down>', '<Nop>')

-- Save and Close
map('n', '<leader>w', ':w<cr>', opts) -- Save file
map('n', '<leader>q', ':q<cr>', opts) -- Close window
