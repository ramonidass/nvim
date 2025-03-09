return {
  'NeogitOrg/neogit',
  dependencies = {
    'nvim-lua/plenary.nvim', -- required
    'sindrets/diffview.nvim', -- optional - Diff integration

    -- Only one of these is needed.
    'nvim-telescope/telescope.nvim', -- optional
  },
  config = true,
  keys = {
    { '<leader>gn', '<cmd>Neogit<cr>', desc = 'NeoGit' },
    { '<leader>gd', '<cmd>DiffviewOpen<cr>', desc = 'Diff view' },
  },
}
