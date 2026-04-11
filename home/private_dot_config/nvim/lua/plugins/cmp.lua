return { -- override blink.cmp plugin
  "saghen/blink.cmp",
  opts = {
    keymap = {
      ["<Tab>"] = { "snippet_forward", "fallback" },
    },
  },
}
