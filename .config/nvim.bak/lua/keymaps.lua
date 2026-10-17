-- Keymaps configuration; Note: Leader key should be set before loading this file

local map = vim.keymap.set

-- Reload configuration
map("n", "<leader>r", ":source ~/.config/nvim/init.lua<CR>", { desc = "Reload Neovim config" })

map("n", "FF", ":q<CR>", { desc = "Quit with confirmation" })

-- Tab management
map("n", "<leader>b", ":tabnew<CR>", { desc = "New tab" })
map("n", "<leader>x", ":tabclose<CR>", { desc = "Close current tab" })
map("n", "<leader>j", ":tabprevious<CR>", { desc = "Previous tab" })
map("n", "<leader>k", ":tabnext<CR>", { desc = "Next tab" })
map("n", "<Tab>", ":tabnext<CR>", { desc = "Next tab" })
map("n", "<S-Tab>", ":tabprevious<CR>", { desc = "Previous tab" })

-- Buffer management  
map("n", "<leader>d", ":bd<CR>", { desc = "Delete current buffer" })

-- Commenting (requires comment plugin)
map("n", "<leader>/", "gcc", { remap = true, desc = "Toggle comment line" })
map("v", "<leader>/", "gc", { remap = true, desc = "Toggle comment selection" })

-- Split creation
map("n", "<leader>v", ":vsplit<CR>", { desc = "Vertical split" })
map("n", "<leader>s", ":split<CR>", { desc = "Horizontal split" })

-- Split navigation
map("n", "<C-h>", "<C-w>h", { desc = "Move to left split" })
map("n", "<C-l>", "<C-w>l", { desc = "Move to right split" })
map("n", "<C-j>", "<C-w>j", { desc = "Move to bottom split" })
map("n", "<C-k>", "<C-w>k", { desc = "Move to top split" })

-- Split resizing
map("n", "<C-Left>", ":vertical resize +3<CR>", { desc = "Increase vertical split" })
map("n", "<C-Right>", ":vertical resize -3<CR>", { desc = "Decrease vertical split" })

-- File explorer (netrw)
map("n", "<leader>e", ":25Lex<CR>", { desc = "Toggle file explorer" })

-- Save shortcuts
map("i", "<C-s>", "<ESC>:w<CR>", { desc = "Save file (insert mode)" })
map("n", "<C-s>", ":w<CR>", { desc = "Save file" })

-- Insert mode navigation
map("i", "<C-h>", "<Left>", { desc = "Move left in insert mode" })
map("i", "<C-l>", "<Right>", { desc = "Move right in insert mode" })
map("i", "<C-j>", "<Down>", { desc = "Move down in insert mode" })
map("i", "<C-k>", "<Up>", { desc = "Move up in insert mode" })

-- Visual mode enhancements
map("v", "<leader>r", "\"hy:%s/<C-r>h//g<left><left>", { desc = "Replace highlighted text" })
map("v", "<C-s>", ":sort<CR>", { desc = "Sort selection" })
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- Shell execution (be careful with these)
map("n", "<leader><Tab>", ":. !bash<CR>", { desc = "Execute current line in bash" })
map("v", "<leader><Tab>", ": !bash<CR>", { desc = "Execute selection in bash" })
map("v", "<leader><CR>", ": w !bash<CR>", { desc = "Pipe selection to bash" })
map("n", "<leader><CR>", ":.w !bash<CR>", { desc = "Pipe current line to bash" })

