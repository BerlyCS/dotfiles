require('nvim-treesitter.configs').setup {
  ensure_installed = { "html", "css","javascript", "cpp", "c", "bash", "json" },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  rainbow = {
    enable = true,
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
  },
  refactor = {
    highlight_definitions = {
      enable = true,
      clear_on_cursor_move = true
    },
    highlight_current_scope = { enable = true },
    smart_rename = {
      enable = true,
      keymaps = {
        smart_rename = "tr",
      },
    },
  },
  textsubjects = {
    enable = true,
    prev_selection = '<cr>', -- (Optional) keymap to select the previous selection
    keymaps = {
        [','] = 'textsubjects-smart',
        [';'] = 'textsubjects-container-outer',
        ['i;'] = 'textsubjects-container-inner',
    },
  },
}
