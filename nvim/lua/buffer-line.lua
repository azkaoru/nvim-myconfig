vim.opt.termguicolors = true
vim.keymap.set('n', '<leader>fb', ':lua require"telescope.builtin".buffers()<CR>', {})
require("bufferline").setup{}
