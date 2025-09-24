-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreConfig
  opts = {
    -- Configure core features of AstroNvim
    features = {
      large_buf = { size = 1024 * 256, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
      autopairs = true, -- enable autopairs at start
      cmp = true, -- enable completion at start
      diagnostics = { virtual_text = true, virtual_lines = true }, -- enable or disable diagnostics features on start
      highlighturl = true, -- highlight URLs at start
      notifications = true, -- enable notifications at start
    },
    -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
    diagnostics = {
      virtual_text = true,
      virtual_lines = true,
      underline = true,
    },
    -- vim options can be configured here
    options = {
      opt = { -- vim.opt.<key>
        relativenumber = false, -- sets vim.opt.relativenumber
        number = true, -- sets vim.opt.number
        spell = false, -- sets vim.opt.spell
        signcolumn = "auto", -- sets vim.opt.signcolumn to auto
        wrap = false, -- sets vim.opt.wrap
        clipboard = "",
        mouse = "",
        shiftwidth = 2,
        tabstop = 2,
        softtabstop = 2,
        expandtab = false,
        scrolloff = 10,
      },
      g = { -- vim.g.<key>
        -- configure global vim variables (vim.g)
        -- NOTE: `mapleader` and `maplocalleader` must be set in the AstroNvim opts or before `lazy.setup`
        -- This can be found in the `lua/lazy_setup.lua` file
      },
    },
    -- Mappings can be configured through AstroCore as well.
    -- NOTE: keycodes follow the casing in the vimdocs. For example, `<Leader>` must be capitalized
    mappings = {
      -- first key is the mode
      n = {
        -- second key is the lefthand side of the map

        -- navigate buffer tabs with `H` and `L`
        L = {
          function() require("astrocore.buffer").nav(vim.v.count1) end,
          desc = "Next buffer",
        },
        H = {
          function() require("astrocore.buffer").nav(-vim.v.count1) end,
          desc = "Previous buffer",
        },

        ["<C-/>"] = {
          "<gcc>",
          desc = "Comment",
        },
        ["<Tab>"] = {
          function() require("astrocore.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end,
          desc = "Next buffer",
        },
        ["<S-Tab>"] = {
          function() require("astrocore.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
          desc = "Previous buffer",
        },
        ["<leader>1"] = {
          function() require("astrocore.buffer").nav_to(1) end,
          desc = "Jump to Buffer 1",
        },
        ["<leader>2"] = {
          function() require("astrocore.buffer").nav_to(2) end,
          desc = "Jump to Buffer 2",
        },
        ["<leader>3"] = {
          function() require("astrocore.buffer").nav_to(3) end,
          desc = "Jump to Buffer 3",
        },
        ["<leader>4"] = {
          function() require("astrocore.buffer").nav_to(4) end,
          desc = "Jump to Buffer 4",
        },
        ["<leader>5"] = {
          function() require("astrocore.buffer").nav_to(5) end,
          desc = "Jump to Buffer 5",
        },
        ["<leader>6"] = {
          function() require("astrocore.buffer").nav_to(6) end,
          desc = "Jump to Buffer 6",
        },
        ["<leader>7"] = {
          function() require("astrocore.buffer").nav_to(7) end,
          desc = "Jump to Buffer 7",
        },
        ["<leader>8"] = {
          function() require("astrocore.buffer").nav_to(8) end,
          desc = "Jump to Buffer 8",
        },
        ["<leader>9"] = {
          function() require("astrocore.buffer").nav_to(9) end,
          desc = "Jump to Buffer 9",
        },
        -- Cancel search highlighting with ESC
        ["<Esc>"] = { ":nohlsearch<Bar>:echo<cr>" },
        ["<leader><leader>"] = { "<c-^>" }, -- options = { noremap = true } },

        -- mappings seen under group name "Buffer"
        ["<Leader>bD"] = {
          function()
            require("astroui.status.heirline").buffer_picker(
              function(bufnr) require("astrocore.buffer").close(bufnr) end
            )
          end,
          desc = "Pick to close",
        },
        -- tables with just a `desc` key will be registered with which-key if it's installed
        -- this is useful for naming menus
        ["<Leader>b"] = { desc = "Buffers" },
        -- quick save
        -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
      },
      t = {
        -- setting a mapping to false will disable it
        -- ["<esc>"] = false,
      },
    },
  },
}
