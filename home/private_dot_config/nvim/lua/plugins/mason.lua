-- Customize Mason plugins

---@type LazySpec
return {
  -- use mason-lspconfig to configure LSP installations
  {
    "williamboman/mason-lspconfig.nvim",
    -- overrides `require("mason-lspconfig").setup(...)`
    opts = function(_, opts)
      -- add more things to the ensure_installed table protecting against community packs modifying it
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, {
        "ansiblels",
        "bashls",
        "cssls",
        "dockerls",
        "eslint",
        "gopls",
        "graphql",
        "helm_ls",
        "html",
        "jqls",
        "jsonls",
        "lua_ls",
        "pylsp",
        "sqlls",
        "tailwindcss",
        "terraformls",
        "tflint",
        "yamlls",
      })
    end,
  },
  -- use mason-null-ls to configure Formatters/Linter installation for null-ls sources
  {
    "jay-babu/mason-null-ls.nvim",
    -- overrides `require("mason-null-ls").setup(...)`
    opts = function(_, opts)
      -- add more things to the ensure_installed table protecting against community packs modifying it
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, {
        "ansible-lint",
        "buf",
        "cmakelint",
        "commitlint",
        "eslint_d",
        "gitlint",
        "golangci-lint",
        "jsonlint",
        "markdownlint",
        "prettier",
        "protolint",
        "stylua",
        "yamllint",
      })
    end,
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    -- overrides `require("mason-nvim-dap").setup(...)`
    opts = function(_, opts)
      -- add more things to the ensure_installed table protecting against community packs modifying it
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, {
        "go-debug-adapter",
        "js-debug-adapter",
        "python",
        -- add more arguments for adding more debuggers
      })
    end,
  },
}
