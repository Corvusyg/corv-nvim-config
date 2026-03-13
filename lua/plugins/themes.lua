return {
  { 'folke/tokyonight.nvim', lazy = true },
  { 'catppuccin/nvim', lazy = true },
  { 'rebelot/kanagawa.nvim', lazy = true },
  { 'ellisonleao/gruvbox.nvim', lazy = true },

  {
    'zaldih/themery.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      require('themery').setup({
        themes = {
          { name = 'Tokyonight Night', colorscheme = 'tokyonight-night' },
          { name = 'Tokyonight Moon',  colorscheme = 'tokyonight-moon' },
          { name = 'Catppuccin Mocha', colorscheme = 'catppuccin-mocha' },
          { name = 'Kanagawa',         colorscheme = 'kanagawa' },
          { name = 'Gruvbox',          colorscheme = 'gruvbox' },
        },
        livePreview = true,
      })
    end,
  }
}
