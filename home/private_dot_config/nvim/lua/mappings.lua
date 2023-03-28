local map = vim.api.nvim_set_keymap
local wkmap = require("utils").wkmap

local default_options = { noremap = true, silent = true }
local expr_options = { noremap = true, expr = true, silent = true }

-- map the leader key
map("n", "<Space>", "<NOP>", default_options)
vim.g.mapleader = " "

-- remap :
map("n", "<C-P>", "<cmd>FineCmdline<CR>", { noremap = true })
-- center search results
map("n", "n", "nzz", default_options)
map("n", "N", "Nzz", default_options)

-- Deal with visual line wraps
map("n", "k", "v:count == 0 ? 'gk' : 'k'", expr_options)
map("n", "j", "v:count == 0 ? 'gj' : 'j'", expr_options)

-- better indenting
map("v", "<", "<gv", default_options)
map("v", ">", ">gv", default_options)

-- paste over currently selected text without yanking it
map("v", "p", "\"_dP", default_options)

-- Tab switch buffer
wkmap("n", "<TAB>", ":bnext<CR>", "Next Buffer", default_options)
wkmap("n", "<S-TAB>", ":bprevious<CR>", "Previous Buffer", default_options)
wkmap('n', '<Leader>1', ":BufferLineGoToBuffer 1<CR>", 'Jump to Buffer 1', default_options)
wkmap('n', '<Leader>2', ":BufferLineGoToBuffer 2<CR>", 'Jump to Buffer 2', default_options)
wkmap('n', '<Leader>3', ":BufferLineGoToBuffer 3<CR>", 'Jump to Buffer 3', default_options)
wkmap('n', '<Leader>4', ":BufferLineGoToBuffer 4<CR>", 'Jump to Buffer 4', default_options)
wkmap('n', '<Leader>5', ":BufferLineGoToBuffer 5<CR>", 'Jump to Buffer 5', default_options)
wkmap('n', '<Leader>6', ":BufferLineGoToBuffer 6<CR>", 'Jump to Buffer 6', default_options)
wkmap('n', '<Leader>7', ":BufferLineGoToBuffer 7<CR>", 'Jump to Buffer 7', default_options)
wkmap('n', '<Leader>8', ":BufferLineGoToBuffer 8<CR>", 'Jump to Buffer 8', default_options)
wkmap('n', '<Leader>9', ":BufferLineGoToBuffer 9<CR>", 'Jump to Buffer 9', default_options)

-- Cancel search highlighting with ESC
map("n", "<ESC>", ":nohlsearch<Bar>:echo<CR>", default_options)

-- Autocorrect spelling from previous error
map("i", "<c-f>", "<c-g>u<Esc>[s1z=`]a<c-g>u", default_options)

-- Move selected line / block of text in visual mode
map("x", "K", ":move '<-2<CR>gv-gv", default_options)
map("x", "J", ":move '>+1<CR>gv-gv", default_options)

-- starlite mappings
map("n", "*", "<cmd>lua require'starlite'.star()<CR>", default_options)
map("n", "g*", "<cmd>lua require'starlite'.g_star()<CR>", default_options)
map("n", "#", "<cmd>lua require'starlite'.hash()<CR>", default_options)
map("n", "g#", "<cmd>lua require'starlite'.g_hash()<CR>", default_options)

map("n", "<leader><leader>", "<c-^>", { noremap = true })

-- Show/Hide hidden chars
map("n", "<leader>l", "<cmd>set list!<CR>", default_options)

-- Quicker window movement
map("n", "<C-j>", "<C-w>j", default_options)
map("n", "<C-k>", "<C-w>k", default_options)
map("n", "<C-h>", "<C-w>h", default_options)
map("n", "<C-l>", "<C-w>l", default_options)

-- Split
map("n", "<Leader>x", ":split<CR>", default_options)
map("n", "<Leader>v", ":vsplit<CR>", default_options)

map("n", "<C-_>", '<CMD>lua require("Comment.api").call("toggle_current_linewise_op")<CR>g@$', default_options)
map("x", "<C-_>", '<ESC><CMD>lua require("Comment.api").locked.toggle_linewise_op(vim.fn.visualmode())<CR>',
  default_options)

wkmap("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", "Toggle File Explorer", default_options)
wkmap("n", "<leader>r", "<cmd>NvimTreeRefresh<CR>", "Refresh File Explorer", default_options)
wkmap("n", "<leader>n", "<cmd>NvimTreeFindFile<CR>", "Find File in Explorer", default_options)

-- Telescope
map("n", "<leader>ff", "<Cmd>Telescope find_files<CR>", default_options)
map("n", "<leader>fb", "<Cmd>Telescope buffers<CR>", default_options)
map("n", "<leader>fg", "<Cmd>Telescope live_grep<CR>", default_options)

function EscapePair()
  local closers = { ")", "]", "}", ">", "'", "\"", "`", "," }
  local line = vim.api.nvim_get_current_line()
  local row, col = unpack(vim.api.nvim_win_get_cursor(0))
  local after = line:sub(col + 1, -1)
  local closer_col = #after + 1
  local closer_i = nil
  for i, closer in ipairs(closers) do
    local cur_index, _ = after:find(closer)
    if cur_index and (cur_index < closer_col) then
      closer_col = cur_index
      closer_i = i
    end
  end
  if closer_i then
    vim.api.nvim_win_set_cursor(0, { row, col + closer_col })
  else
    vim.api.nvim_win_set_cursor(0, { row, col + 1 })
  end
end

map("i", "<C-l>", "<cmd>lua EscapePair()<CR>", default_options)
