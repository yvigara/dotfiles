return {
  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function()
      require("lsp_signature").setup({
        bind = true,            -- This is mandatory, otherwise border config won't get registered.
        floating_window = true, -- show hint in a floating window, set to false for virtual text only mode
        doc_lines = 2,          -- Set to 0 for not showing doc
        hint_prefix = "🐼 ",
        -- use_lspsaga = false,  -- set to true if you want to use lspsaga popup
        handler_opts = {
          border = "shadow", -- double, single, shadow, none
        },
      })
    end,
  },
  {
    "onsails/lspkind.nvim",
    opts = function(_, opts)
      -- use codicons preset
      opts.preset = "codicons"
      -- set some missing symbol types
      opts.symbol_map = {
        Array = "",
        Boolean = "",
        Key = "",
        Namespace = "",
        Null = "",
        Number = "",
        Object = "",
        Package = "",
        String = "",
      }
      return opts
    end,
  },
}
