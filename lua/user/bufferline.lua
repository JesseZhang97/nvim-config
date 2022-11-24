local status_ok, bufferline = pcall(require, 'bufferline')
if not status_ok then
  return
end

bufferline.setup({
  options = {
    numbers = 'none', -- | "ordinal" | "buffer_id" | "both" | function({ ordinal, id, lower, raise }): string,
    indicator = {
      icon = '▎', -- this should be omitted if indicator style is
      style = 'icon',
    },
    close_command = 'bdelete',
    buffer_close_icon = '',
    modified_icon = '●',
    close_icon = '',
    left_trunc_marker = '',
    right_trunc_marker = '',
    max_name_length = 30,
    max_prefix_length = 30, -- prefix used when a buffer is de-duplicated
    tab_size = 21,
    diagnostics = 'nvim_lsp', -- | "nvim_lsp" | "coc" | false
    diagnostics_update_in_insert = true,
    -- only show error count TODO
    diagnostics_indicator = function(count, level, diagnostics_dict, context)
      local icon = ' '
      if level:match('error') then
        return ' ' .. icon
      end
      return ''
    end,
    -- diagnostics_indicator = function(count, level, diagnostics_dict, context)
    -- 	return "(" .. count .. ")"
    -- end,
    -- NOTE: this will be called a lot so don't do any heavy processing here
    -- custom_filter = functionhttps://jdhao.github.io/2021/12/31/using_nvim_after_three_years/(buf_number)
    --   -- filter out filetypes you don't want to see
    --   if vim.bo[buf_number].filetype ~= "<i-dont-want-to-see-this>" then
    --     return true
    --   end
    --   -- filter out by buffer name
    --   if vim.fn.bufname(buf_number) ~= "<buffer-name-I-dont-want>" then
    --     return true
    --   end
    --   -- filter out based on arbitrary rules
    --   -- e.g. filter out vim wiki buffer from tabline in your work repo
    --   if vim.fn.getcwd() == "<work-repo>" and vim.bo[buf_number].filetype ~= "wiki" then
    --     return true
    --   end
    -- end,
    show_buffer_icons = true,
    show_buffer_close_icons = false,
    show_close_icon = false,
    show_tab_indicators = true,
    persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
    separator_style = 'thin', -- | "thick" | "thin" | { 'any', 'any' },
    enforce_regular_tabs = true,
    always_show_bufferline = true,
  },
})

vim.api.nvim_set_keymap('n', '<TAB>', '<CMD>BufferLineCycleNext<CR>', {})
vim.api.nvim_set_keymap('n', '<S-TAB>', '<CMD>BufferLineCyclePrev<CR>', {})
vim.api.nvim_set_keymap('n', ';c', '<CMD>Bdelete<CR>', {})
