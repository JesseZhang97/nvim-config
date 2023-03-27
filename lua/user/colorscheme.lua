vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank({
      higroup = 'IncSearch',
      timeout = 300,
    })
  end,
})

vim.cmd([[
try
  let g:everforest_background = 'soft'
  let g:everforest_enable_italic = 1
  let g:everforest_transparent_background = 2
  let g:everforest_diagnostic_virtual_text = 'colored'
  let g:everforest_better_performance = 1
  colorscheme everforest
  highlight StatusLine   cterm=none ctermfg=white ctermbg=black guibg=#7fbbb3
  highlight StatusLineNC   cterm=none ctermfg=white ctermbg=black guibg=#d3c6aa
  highlight! link DiagnosticError Red
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]])
