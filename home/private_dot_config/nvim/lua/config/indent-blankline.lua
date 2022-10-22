vim.cmd [[highlight IndentBlanklineIndent1 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent2 guibg=#32302f gui=nocombine]]

require("indent_blankline").setup {
    indentLine_enabled = 1,
    char = "",
    filetype_exclude = {
        "startify", "dashboard", "dotooagenda", "log", "fugitive", "gitcommit",
        "packer", "vimwiki", "markdown", "json", "txt", "vista", "help",
        "todoist", "NvimTree", "peekaboo", "git", "TelescopePrompt", "undotree",
        "flutterToolsOutline", "" -- for all buffers without a file type
    },
    buftype_exclude = {"terminal", "nofile"},
    char_highlight_list = {
        "IndentBlanklineIndent1",
        "IndentBlanklineIndent2",
        -- "Cursorline",
    },
    space_char_highlight_list = {
        "IndentBlanklineIndent1",
        "IndentBlanklineIndent2",
        -- "Cursorline",
    },
    indent_blankline_max_indent_increase = 1,
    indent_blankline_use_treesitter = true,
    show_trailing_blankline_indent = false,
    show_first_indent_level = true,
    space_char_blankline = " ",
    show_current_context = true,
    show_current_context_start = true,
    -- char_list = {"|", "¦", "┆", "┊"},
    space_char = " ",
    context_patterns = {
        "class", "function", "method", "block", "list_literal", "selector",
        "^if", "^table", "if_statement", "while", "for"
    }
}
