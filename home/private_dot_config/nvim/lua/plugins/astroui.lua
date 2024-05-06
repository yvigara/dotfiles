-- AstroUI provides the basis for configuring the AstroNvim User Interface
-- Configuration documentation can be found with `:h astroui`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
  "AstroNvim/astroui",
  ---@type AstroUIOpts
  opts = {
    -- change colorscheme
    colorscheme = "gruvbox",
    -- AstroUI allows you to easily modify highlight groups easily for any and all colorschemes
    highlights = {
      init = { -- this table overrides highlights in all themes
        -- Normal = { bg = "#000000" },
      },
      astrotheme = { -- a table of overrides/changes when applying the astrotheme theme
        -- Normal = { bg = "#000000" },
      },
      gruvbox = {
        StatusLine = { fg = "#ebdbb2", bg = "#504945" },
      },
    },
    -- Configuration options for the AstroNvim lines and bars built with the `status` API.
    status = {

      icon_highlights = {
        file_icon = {
          statusline = false,
        },
      },
      separators = {
        left = { "", " " }, -- separator for the left side of the statusline
        right = { " ", "" }, -- separator for the right side of the statusline
        -- tab = { "", "" },

        tab_left = { "", "" },
        tab = { "", "" },
        right_accent = { "", " " }, -- accent separator for the right side of the statusline
        space_right = { "", " " },
        space_left = { " ", "" },
      },
    },
    -- Icons can be configured throughout the interface
    icons = {
      VimIcon = "",
      ScrollText = "",
      GitBranch = "",
      GitAdd = "",
      GitChange = "",
      GitDelete = "",
      -- configure the loading of the lsp in the status line
      LSPLoading1 = "⠋",
      LSPLoading2 = "⠙",
      LSPLoading3 = "⠹",
      LSPLoading4 = "⠸",
      LSPLoading5 = "⠼",
      LSPLoading6 = "⠴",
      LSPLoading7 = "⠦",
      LSPLoading8 = "⠧",
      LSPLoading9 = "⠇",
      LSPLoading10 = "⠏",
    },
  },
}
