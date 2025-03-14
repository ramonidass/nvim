-- return {
--   {
--     'stevearc/oil.nvim',
--     config = function()
--       local oil = require 'oil'
--       oil.setup {
--         default_file_explorer = true,
--         columns = { 'icon' },
--
--         buf_options = {
--           buflisted = false,
--           bufhidden = 'hide',
--         },
--
--         win_options = {
--           wrap = false,
--           signcolumn = 'no',
--           cursorcolumn = false,
--           foldcolumn = '0',
--           spell = false,
--           list = false,
--           conceallevel = 3,
--           concealcursor = 'nvic',
--         },
--
--         delete_to_trash = false,
--         skip_confirm_for_simple_edits = false,
--         prompt_save_on_select_new_entry = true,
--         cleanup_delay_ms = 2000,
--
--         lsp_file_methods = {
--           enabled = true,
--           timeout_ms = 1000,
--           autosave_changes = false,
--         },
--
--         constrain_cursor = 'editable',
--         watch_for_changes = false,
--
--         keymaps = {
--           ['g?'] = { 'actions.show_help', mode = 'n' },
--           ['<CR>'] = 'actions.select',
--           ['<C-s>'] = { 'actions.select', opts = { vertical = true } },
--           ['<C-h>'] = { 'actions.select', opts = { horizontal = true } },
--           ['<C-t>'] = { 'actions.select', opts = { tab = true } },
--           ['<C-p>'] = 'actions.preview',
--           ['<C-c>'] = { 'actions.close', mode = 'n' },
--           ['<C-l>'] = 'actions.refresh',
--           ['-'] = { 'actions.parent', mode = 'n' },
--           ['_'] = { 'actions.open_cwd', mode = 'n' },
--           ['`'] = { 'actions.cd', mode = 'n' },
--           ['~'] = { 'actions.cd', opts = { scope = 'tab' }, mode = 'n' },
--           ['gs'] = { 'actions.change_sort', mode = 'n' },
--           ['gx'] = 'actions.open_external',
--           ['g.'] = { 'actions.toggle_hidden', mode = 'n' },
--           ['g\\'] = { 'actions.toggle_trash', mode = 'n' },
--         },
--
--         use_default_keymaps = true,
--
--         view_options = {
--           show_hidden = false,
--           is_hidden_file = function(name, bufnr)
--             return name:match '^%.' ~= nil
--           end,
--           is_always_hidden = function(name, bufnr)
--             return false
--           end,
--           natural_order = 'fast',
--           case_insensitive = false,
--           sort = {
--             { 'type', 'asc' },
--             { 'name', 'asc' },
--           },
--         },
--
--         float = {
--           padding = 2,
--           max_width = 0.7,
--           max_height = 0.7,
--           border = 'rounded',
--           win_options = {
--             winblend = 0,
--           },
--           preview_split = 'auto',
--           override = function(conf)
--             return conf
--           end,
--         },
--
--         preview_win = {
--           update_on_cursor_moved = true,
--           preview_method = 'fast_scratch',
--           disable_preview = function(filename)
--             return false
--           end,
--           win_options = {},
--         },
--       }
--
--       -- Keymap: Press ESC twice to close Oil
--       vim.keymap.set('n', '<Esc><Esc>', function()
--         local oil_is_open = vim.bo.filetype == 'oil'
--         if oil_is_open then
--           vim.cmd 'q'
--         end
--       end, { desc = 'Close Oil with ESC ESC' })
--     end,
--
--     dependencies = { 'nvim-tree/nvim-web-devicons' },
--     lazy = false,
--   },
-- }
-- return {
--   {
--     'stevearc/oil.nvim',
--     dependencies = { 'nvim-tree/nvim-web-devicons' },
--     config = function()
--       CustomOilBar = function()
--         local path = vim.fn.expand '%'
--         path = path:gsub('oil://', '')
--
--         return '  ' .. vim.fn.fnamemodify(path, ':.')
--       end
--
--       require('oil').setup {
--         columns = { 'icon' },
--         keymaps = {
--           ['<C-h>'] = false,
--           ['<C-l>'] = false,
--           ['<C-k>'] = false,
--           ['<C-j>'] = false,
--           ['<C-h>'] = 'actions.select_split',
--         },
--         win_options = {
--           winbar = '%{v:lua.CustomOilBar()}',
--         },
--         view_options = {
--           show_hidden = true,
--           is_always_hidden = function(name, _)
--             local folder_skip = { 'dev-tools.locks', 'dune.lock', '_build' }
--             return vim.tbl_contains(folder_skip, name)
--           end,
--         },
--       }
--
--       -- Open parent directory in current window
--       vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent directory' })
--
--       -- Open parent directory in floating window
--       vim.keymap.set('n', '<space>-', require('oil').toggle_float)
--     end,
--   },
-- }
return {
  {
    'stevearc/oil.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      local oil = require 'oil'
      oil.setup {
        default_file_explorer = true, -- Oil replaces netrw
        columns = { 'icon' },

        -- Buffer options
        buf_options = {
          buflisted = false,
          bufhidden = 'hide',
        },

        -- Window options
        win_options = {
          wrap = false,
          signcolumn = 'no',
          cursorcolumn = false,
          foldcolumn = '0',
          spell = false,
          list = false,
          conceallevel = 3,
          concealcursor = 'nvic',
        },

        -- File operations settings
        delete_to_trash = false,
        skip_confirm_for_simple_edits = false,
        prompt_save_on_select_new_entry = true,
        cleanup_delay_ms = 2000,

        -- LSP integration for file operations
        lsp_file_methods = {
          enabled = true,
          timeout_ms = 1000,
          autosave_changes = false,
        },

        constrain_cursor = 'editable',
        watch_for_changes = false,

        -- Key mappings for Oil buffer
        keymaps = {
          ['g?'] = { 'actions.show_help', mode = 'n' },
          ['<CR>'] = 'actions.select',
          ['<C-h>'] = { 'actions.select', opts = { vertical = true } }, -- Open in vertical split
          ['<C->>'] = { 'actions.select', opts = { horizontal = true } }, -- Open in horizontal split
          ['<C-t>'] = { 'actions.select', opts = { tab = true } }, -- Open in new tab
          ['<C-p>'] = 'actions.preview',
          ['<C-c>'] = { 'actions.close', mode = 'n' },
          ['<C-l>'] = 'actions.refresh',
          ['-'] = { 'actions.parent', mode = 'n' },
          ['_'] = { 'actions.open_cwd', mode = 'n' },
          ['`'] = { 'actions.cd', mode = 'n' },
          ['~'] = { 'actions.cd', opts = { scope = 'tab' }, mode = 'n' },
          ['gs'] = { 'actions.change_sort', mode = 'n' },
          ['gx'] = 'actions.open_external',
          ['g.'] = { 'actions.toggle_hidden', mode = 'n' },
          ['g\\'] = { 'actions.toggle_trash', mode = 'n' },
        },

        -- Sorting and hidden files
        view_options = {
          show_hidden = true,
          is_hidden_file = function(name, _)
            return name:match '^%.' ~= nil
          end,
          is_always_hidden = function(name, _)
            local hidden_folders = { 'dev-tools.locks', 'dune.lock', '_build' }
            return vim.tbl_contains(hidden_folders, name)
          end,
          natural_order = 'fast',
          case_insensitive = false,
          sort = {
            { 'type', 'asc' },
            { 'name', 'asc' },
          },
        },

        -- Floating window config
        float = {
          padding = 2,
          max_width = 0.7,
          max_height = 0.7,
          border = 'rounded',
          win_options = {
            winblend = 0,
          },
          preview_split = 'auto',
          override = function(conf)
            return conf
          end,
        },

        -- Preview window settings
        preview_win = {
          update_on_cursor_moved = true,
          preview_method = 'fast_scratch',
          disable_preview = function(filename)
            return false
          end,
          win_options = {},
        },
      }

      -- Keymap: Press ESC twice to close Oil
      vim.keymap.set('n', '<Esc><Esc>', function()
        if vim.bo.filetype == 'oil' then
          vim.cmd 'q'
        end
      end, { desc = 'Close Oil with ESC ESC' })

      -- Open Oil.nvim
      -- vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent directory' })

      -- Open Oil.nvim in floating window
      vim.keymap.set('n', '<space>-', require('oil').toggle_float)
    end,
  },
}
