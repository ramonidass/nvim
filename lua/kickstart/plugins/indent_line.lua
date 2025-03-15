return {
  { -- Add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    -- Enable `lukas-reineke/indent-blankline.nvim`
    -- See `:help ibl`
    main = 'ibl',
    opts = {
      char = '▏', -- Character used for indentation lines
      char_highlight = 'IndentBlanklineChar', -- Highlight group for the character
    },
  },
}
