if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- Customize Treesitter
-- --------------------
-- Treesitter customizations are handled with AstroCore
-- as nvim-treesitter simply provides a download utility for parsers

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    treesitter = {
      highlight = true, -- enable/disable treesitter based highlighting
      indent = true, -- enable/disable treesitter based indentation
      auto_install = true, -- enable/disable automatic installation of detected languages
      ensure_installed = {
        "astro",
        "bash",
        "cmake",
        "css",
        "dockerfile",
        "editorconfig",
        "git_config",
        "gitattributes",
        "gitignore",
        "go",
        "gomod",
        "gotmpl",
        "gowork",
        "graphql",
        "hcl",
        "helm",
        "html",
        "java",
        "javascript",
        "jq",
        "json",
        "json5",
        "kcl",
        "lua",
        "make",
        "markdown",
        "promql",
        "proto",
        "python",
        "regex",
        "sql",
        "ssh_config",
        "terraform",
        "toml",
        "typescript",
        "vim",
        "xml",
        "yaml",
        -- add more arguments for adding more treesitter parsers
      },
    },
  },
}
