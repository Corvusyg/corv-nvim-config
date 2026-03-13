local opts = {
	noremap = true,
	silent = true,
}

vim.g.mapleader = " "

-- Telescope
vim.keymap.set('n', '<leader>ff', "<cmd>Telescope find_files<CR>")
vim.keymap.set('n', '<leader>fg', "<cmd>Telescope live_grep<CR>")
vim.keymap.set('n', '<leader>fb', "<cmd>Telescope buffers<CR>")
vim.keymap.set('n', '<leader>fh', "<cmd>Telescope help_tags<CR>")

--Nvim-tree
vim.keymap.set('n', '<C-n>', "<cmd>NvimTreeToggle<CR>")

-- Normal mode
vim.keymap.set('n', '<C-h>', '<C-w>h', opts)
vim.keymap.set('n', '<C-j>', '<C-w>j', opts)
vim.keymap.set('n', '<C-k>', '<C-w>k', opts)
vim.keymap.set('n', '<C-l>', '<C-w>l', opts)

vim.keymap.set('n', '<C-Up>', ':resize -2<CR>',opts)
vim.keymap.set('n', '<C-Down>', ':resize +2<CR>',opts)
vim.keymap.set('n', '<C-Left>', ':vertical resize -2<CR>',opts)
vim.keymap.set('n', '<C-Right>', ':vertical resize +2<CR>',opts)
