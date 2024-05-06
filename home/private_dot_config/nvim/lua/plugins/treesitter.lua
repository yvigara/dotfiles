-- Customize Treesitter

---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  opts = function(_, opts)
    -- add more things to the ensure_installed table protecting against community packs modifying it
    opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, {
      "bash",
      "cmake",
      "css",
      "dockerfile",
      "gitattributes",
      "gitignore",
      "go",
      "gomod",
      "gowork",
      "graphql",
      "hcl",
      "html",
      "java",
      "javascript",
      "jq",
      "json",
      "json5",
      "lua",
      "make",
      "markdown",
      "proto",
      "python",
      "regex",
      "sql",
      "terraform",
      "toml",
      "typescript",
      "vim",
      "yaml",
    })
  end,
}
