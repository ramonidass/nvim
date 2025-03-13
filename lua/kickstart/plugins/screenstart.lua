return {
  {
    'goolord/alpha-nvim',
    dependencies = { 'echasnovski/mini.icons' },
    config = function()
      require('alpha').setup(require('alpha.themes.startify').config)
    end,
  },
}
--   {
--     'goolord/alpha-nvim',
--     config = function()
--       require('alpha').setup(require('alpha.themes.dashboard').config)
--     end,
--   },
-- }
