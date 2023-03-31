return {
  "levouh/tint.nvim",
  event = "User AstroFile",
  opts = {
    highlight_ignore_patterns = { "WinSeparator", "neo%-tree", "neo-tree.*", "Status.*" },
    tint = -45,       -- Darken colors, use a positive value to brighten
    saturation = 0.6, -- Saturation to preserve
    window_ignore_function = function(winid)
      local bufid = vim.api.nvim_win_get_buf(winid)
      local buftype = vim.api.nvim_buf_get_option(bufid, "buftype")
      local floating = vim.api.nvim_win_get_config(winid).relative ~= ""

      -- Do not tint `terminal` or floating windows, tint everything else
      return buftype == "terminal" or floating
    end,
  },
}
