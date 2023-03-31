local astro_utils = require("astronvim.utils")
local buffer = require("astronvim.utils.buffer")
-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
  -- first key is the mode
  n = {
    -- second key is the lefthand side of the map
    -- mappings seen under group name "Buffer"
    ["<leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(function(bufnr)
          require("astronvim.utils.buffer").close(bufnr)
        end)
      end,
      desc = "Pick to close",
    },
    -- tables with the `name` key will be registered with which-key if it's installed
    -- this is useful for naming menus
    ["<leader>b"] = { name = "Buffers" },
    -- Coding
    ["<leader>c"] = { name = "Coding" },
    ["<leader>ca"] = { "<cmd>GoAddTag<cr>", desc = "Add tags to struct" },
    ["<leader>cc"] = { "<cmd>GoCoverage<cr>", desc = "Test coverage" },
    ["<leader>ce"] = { "<cmd>GoIfErr<cr>", desc = "Add if err" },
    ["<leader>cg"] = { "<cmd>lua require('go.comment').gen()<cr>", desc = "Generate comment" },
    ["<leader>cl"] = { "<cmd>GoLint<cr>", desc = "Run linter" },
    ["<leader>cr"] = { "<cmd>GoRun<cr>", desc = "Run" },
    ["<leader>cs"] = { "<cmd>GoFillStruct<cr>", desc = "Autofill struct" },
    ["<leader>ct"] = { "<cmd>GoTest<cr>", desc = "Run tests" },
    ["<leader>cv"] = { "<cmd>GoVet<cr>", desc = "Go vet" },
    -- navigation
    -- ["<Tab>"] = { function() vim.cmd.tabnext() end, desc = "Next Buffer" },
    -- ["<Tab>"] = {
    --   function()
    --     if #vim.t.bufs > 1 then
    --       require("telescope.builtin").buffers { sort_mru = true, ignore_current_buffer = true }
    --     else
    --       astro_utils.notify "No other buffers open"
    --     end
    --   end,
    --   desc = "Switch Buffers",
    -- },
    -- ["<S-Tab>"] = {
    --   function()
    --     vim.cmd.tabprevious()
    --   end,
    --   desc = "Previous Buffer",
    -- },
    ["<Tab>"] = {
      function()
        buffer.nav(vim.v.count > 0 and vim.v.count or 1)
      end,
      desc = "Next buffer",
    },
    ["<S-Tab>"] = {
      function()
        buffer.nav(-(vim.v.count > 0 and vim.v.count or 1))
      end,
      desc = "Previous buffer",
    },
    ["<leader>1"] = { "<cmd>BufferLineGoToBuffer 1<cr>", desc = "Jump to Buffer 1" },
    ["<leader>2"] = { "<cmd>BufferLineGoToBuffer 2<cr>", desc = "Jump to Buffer 2" },
    ["<leader>3"] = { "<cmd>BufferLineGoToBuffer 3<cr>", desc = "Jump to Buffer 3" },
    ["<leader>4"] = { "<cmd>BufferLineGoToBuffer 4<cr>", desc = "Jump to Buffer 4" },
    ["<leader>5"] = { "<cmd>BufferLineGoToBuffer 5<cr>", desc = "Jump to Buffer 5" },
    ["<leader>6"] = { "<cmd>BufferLineGoToBuffer 6<cr>", desc = "Jump to Buffer 6" },
    ["<leader>7"] = { "<cmd>BufferLineGoToBuffer 7<cr>", desc = "Jump to Buffer 7" },
    ["<leader>8"] = { "<cmd>BufferLineGoToBuffer 8<cr>", desc = "Jump to Buffer 8" },
    ["<leader>9"] = { "<cmd>BufferLineGoToBuffer 9<cr>", desc = "Jump to Buffer 9" },
    ["<leader><leader>"] = { "<c-^>" }, -- options = { noremap = true } },
    -- Split
    ["<leader>x"] = { "<cmd>split<cr>" },
    ["<leader>v"] = { "<cmd>vsplit<cr>" },
    -- Cancel search highlighting with ESC
    ["<Esc>"] = { ":nohlsearch<Bar>:echo<cr>" },
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
  v = {
    ["<"] = { "<gv" },
    [">"] = { ">gv" },
  },
}
