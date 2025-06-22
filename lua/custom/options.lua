-- Set up an 80-column ruler
vim.cmd [[set colorcolumn=80]]
-- vim.cmd [[highlight ColorColumn ctermbg=0 guibg=#333333]]

-- relative numbers
vim.cmd [[set relativenumber]]

-- Triger `autoread` when files changes on disk
-- https://unix.stackexchange.com/questions/149209/refresh-changed-content-of-file-opened-in-vim/383044#383044
-- https://vi.stackexchange.com/questions/13692/prevent-focusgained-autocmd-running-in-command-line-editing-mode
vim.cmd [[autocmd FocusGained,BufEnter,CursorHold,CursorHoldI *
          \ if mode() !~ '\v(c|r.?|!|t)' && getcmdwintype() == '' | checktime | endif]]

-- Notification after file change
-- https://vi.stackexchange.com/questions/13091/autocmd-event-for-autoread
vim.cmd [[autocmd FileChangedShellPost *
  \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None]]

-- Make the diagnostics easier to read
vim.cmd [[autocmd CursorHold * lua vim.diagnostic.open_float({scope="line", focusable = false})]]

require('winbar').setup {
  enabled = true,

  show_file_path = true,
  show_symbols = true,

  colors = {
    path = '', -- You can customize colors like #c946fd
    file_name = '',
    symbols = '',
  },

  icons = {
    file_icon_default = '',
    seperator = '/',
    editor_state = '●',
    lock_icon = '',
  },

  exclude_filetype = {
    'help',
    'startify',
    'dashboard',
    'packer',
    'neogitstatus',
    'NvimTree',
    'Trouble',
    'alpha',
    'lir',
    'Outline',
    'spectre_panel',
    'toggleterm',
    'qf',
  },
}

vim.cmd [[set tabstop=4]]
vim.cmd [[set shiftwidth=4]]
vim.cmd [[set expandtab]]
