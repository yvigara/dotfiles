-- Customize Mason

---@type LazySpec
return {
  -- use mason-tool-installer for automatically installing Mason packages
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    -- overrides `require("mason-tool-installer").setup(...)`
    opts = {
      -- Make sure to use the names found in `:Mason`
      ensure_installed = {
        "ansible-language-server",
        "astro-language-server",
        "basedpyright",
        "bash-language-server",
        "buf",
        "commitlint",
        "copilot-language-server",
        "css-lsp",
        "css-variables-language-server",
        "delve",
        "docker-compose-language-service",
        "dockerfile-language-server",
        "docker-language-server",
        "eslint-lsp",
        "eslint_d",
        "gh-actions-language-server",
        "gopls",
        "grammarly-languageserver",
        "helm-ls",
        "html-lsp",
        "jq-lsp",
        "json-lsp",
        -- "protols",
        "sqls",
        "tailwindcss-language-server",
        "terraform-ls",
        "typescript-language-server",
        "vim-language-server",
        "yaml-language-server",
        -- install language servers
        "lua-language-server",

        -- install formatters
        "biome",
        "prettier",
        "stylua",
        "yamlfmt",

        -- install linters
        "actionlint",
        "ansible-lint",
        "cmakelint",
        "dotenv-linter",
        "golangci-lint-langserver",
        "golangci-lint",
        "jsonlint",
        "kube-linter",
        "markdownlint",
        "oxlint",
        "protolint",
        "tflint",
        "yamllint",

        -- install debuggers
        "go-debug-adapter",
        "js-debug-adapter",
        "debugpy",

        -- install any other package
        "tree-sitter-cli",
      },
    },
  },
}
