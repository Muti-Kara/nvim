local opts = { noremap = true, silent = true }
local command_opts = { noremap = true }
local map = vim.api.nvim_set_keymap


-- Macros
map("n", "q", "<Nop>", opts)
map("n", "<C-q>", "qq", opts)
map("n", "<C-e>", "q", opts)
map("n", "<S-q>", "@q", opts)

-- replace & replace all
map("n", "<F5>", "<ESC>yiw:%s/<C-r>\"//g<Left><Left>", command_opts)
map("n", "<F6>", "<ESC>yiw:%s/<C-r>\"//gc<Left><Left><Left>", command_opts)

-- multiple window navigation and resizing
map("n", "<C-Left>", "<C-w>h", opts)
map("n", "<C-Down>", "<C-w>j", opts)
map("n", "<C-Up>", "<C-w>k", opts)
map("n", "<C-Right>", "<C-w>l", opts)

map("n", "<S-Up>", ":resize +1<CR>", opts)
map("n", "<S-Down>", ":resize -1<CR>", opts)
map("n", "<S-Left>", ":vertical resize -1<CR>", opts)
map("n", "<S-Right>", ":vertical resize +1<CR>", opts)

map("n", "<Tab><Right>", ":bnext<CR>", opts)
map("n", "<Tab><Left>", ":bprevious<CR>", opts)

-- disabling auto trim
map("n", "o", "o<Space><BS>", opts)
map("n", "O", "O<Space><BS>", opts)
map("i", "<CR>", "<CR><Space><BS>", opts)

-- visual mode line moving and indentation
map("v", "<C-Right>", ">gv", opts)
map("v", "<C-Left>", "<gv", opts)
map("v", "<C-Up>", ":m '<-2<CR><ESC>gv", opts)
map("v", "<C-Down>", ":m '>+1<CR><ESC>gv", opts)

-- paste without copying
map("v", "p", '"_dP', opts)

-- Telescope
map("n", "<leader>g", "<cmd>Telescope live_grep<cr>", opts)
map("n", "<leader>f", "<cmd>Telescope find_files<cr>", opts)
