return {
  {
    'stevearc/oil.nvim',
    config = function()
      require('oil').setup {
        default_file_explorer = true, -- Replace NetRW
        view_options = { show_hidden = true },
        float = {
          -- Enables floating window for Oil.nvim
          max_width = 0.7,
          max_height = 0.7,
          border = 'rounded',
          win_options = {
            winblend = 0, -- Transparency level (0 = opaque, 100 = fully transparent)
          },
        },
      }
    end,
    dependencies = { 'nvim-tree/nvim-web-devicons' }, -- Optional for icons
    lazy = false,
  },
}
