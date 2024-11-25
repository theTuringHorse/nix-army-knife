-- init.lua

vim.g.mapleader = " "					-- sets leader key
vim.g.netrw_banner = 0					-- gets rid of the annoying banner for netrw
vim.g.netrw_browse_split=4				-- open in prior window
vim.g.netrw_altv = 1					-- change from left splitting to right splitting
vim.g.netrw_liststyle=3					-- tree style view in netrw
--vim.cmd("let g:netrw_list_hide=netrw_gitignore#Hide()")


local o = vim.opt

o.title = true					-- show title
vim.cmd('set path+=**')			-- search current directory recursively
o.syntax = "ON"
o.backup = false
o.compatible = false			-- turn off vi compatibility mode
o.number = true					-- turn on line numbers
o.relativenumber = true			-- turn on relative line numbers
o.cursorline	 = true
o.mouse = 'a'					-- enable the mouse in all modes
o.ignorecase = true				-- enable case insensitive searching
o.smartcase = true				-- all searches are case insensitive unless there's a capital letter
-- o.hlsearch = true				-- disable all highlighted search results
o.incsearch = true				-- enable incremental searching
o.wrap = true					-- enable text wrapping
o.tabstop = 4					-- tabs=4spaces
o.shiftwidth = 4
o.pumheight = 10				-- number of items in popup menu
o.showtabline = 2				-- always show the tab line
o.laststatus = 2				-- always show statusline
o.signcolumn = "auto"
o.expandtab = false				-- expand tab 
o.smartindent = true
o.showcmd = false
o.showmode = true
o.scrolloff = 8					-- scroll page when cursor is 8 lines from top/bottom
o.sidescrolloff = 8				-- scroll page when cursor is 8 spaces from left/right
o.guifont = "monospace:h17"		
o.clipboard = unnamedplus
o.completeopt= { "menuone", "noselect" }
o.splitbelow = true				-- split go below
o.splitright = true				-- vertical split to the right
o.termguicolors = true			-- terminal gui colors
vim.cmd('filetype plugin on')	-- set filetype 
-- vim.cmd('set wildmenu')			-- enable wildmenu

--statusline
vim.cmd "highlight StatusType guibg=#b16286 guifg=#1d2021"
vim.cmd "highlight StatusFile guibg=#fabd2f guifg=#1d2021"
vim.cmd "highlight StatusModified guibg=#1d2021 guifg=#d3869b"
vim.cmd "highlight StatusBuffer guibg=#98971a guifg=#1d2021"
vim.cmd "highlight StatusLocation guibg=#458588 guifg=#1d2021"
vim.cmd "highlight StatusPercent guibg=#1d2021 guifg=#ebdbb2"
vim.cmd "highlight StatusNorm guibg=none guifg=white"
vim.o.statusline = " "
				.. ""
				.. " "
				.. "%l"
				.. " "
				.. " %#StatusType#"
				.. "<< "
				.. "%Y" 
				.. "  "
				.. " >>"
				.. "%#StatusFile#"
				.. "<< "
				.. "%F"
				.. " >>"
				.. "%#StatusModified#"
				.. " "
				.. "%m"
				.. " "
				.. "%#StatusNorm#"
				.. "%="
				.. "%#StatusBuffer#"
				.. "<< "
				.. " "
				.. "%n"
				.. " >>"
				.. "%#StatusLocation#"
				.. "<< "
				.. "󰋁 "
				.. "%l,%c"
				.. " >>"
				.. "%#StatusPercent#"
				.. "<< "
				.. "%p%%  "
				.. " >> "

-- Functional wrapper for mapping custom keybindings
function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- reload config
map("n", "<leader>r", ":source ~/.config/nvim/init.lua<CR>")	-- reload neovim config
map("n", "FF", ":q<CR>")

-- Tab bindings 
map("n", "<leader>b", ":tabnew<CR>")			-- space+t creates new tab
map("n", "<leader>x", ":tabclose<CR>")			-- space+x closes current tab
map("n", "<leader>j", ":tabprevious<CR>")		-- space+j moves to previous tab
map("n", "<leader>k", ":tabnext<CR>")			-- space+k moves to next tab

-- comment in normal and visual
vim.keymap.set({"n"}, "<leader>/", "gcc", {remap = true})
vim.keymap.set({"v"}, "<leader>/", "gc", {remap = true})

-- easy split generation
map("n", "<leader>v", ":vsplit term://bash<CR>i")				-- space+v creates a veritcal split
map("n", "<leader>s", ":split term://bash<CR>i")				-- space+s creates a horizontal split

-- easy split navigation
map("n", "<C-h>", "<C-w>h")						-- control+h switches to left split
map("n", "<C-l>", "<C-w>l")						-- control+l switches to right split
map("n", "<C-j>", "<C-w>j")						-- control+j switches to bottom split
map("n", "<C-k>", "<C-w>k")						-- control+k switches to top split

-- buffer navigation
map("n", "<Tab>", ":tabnext <CR>")				-- Tab goes to next buffer
map("n", "<S-Tab>", ":tabprevious <CR>")			-- Shift+Tab goes to previous buffer
map("n", "<leader>d", ":bd! <CR>")				-- Space+d delets current buffer

map("n", "<leader><Tab>", ":. !bash<CR>")
map("v", "<leader><Tab>", ": !bash<CR>")
map("v", "<leader><CR>", ": w !bash<CR>")
map("n", "<leader><CR>", ":.w !bash<CR>")

-- adjust split sizes easier
map("n", "<C-Left>", ":vertical resize +3<CR>")		-- Control+Left resizes vertical split +
map("n", "<C-Right>", ":vertical resize -3<CR>")	-- Control+Right resizes vertical split -

-- Open netrw in 25% split in tree view
map("n", "<leader>e", ":25Lex<CR>")			-- space+e toggles netrw tree view 

-- navigation in insert mode
map("i", "<C-h>", "<left>")
map("i", "<C-l>", "<right>")
map("i", "<C-j>", "<down>")
map("i", "<C-k>", "<up>")
map("i", "<C-s>", "<ESC>:w<CR>")
map("n", "<C-s>", ":w<CR>")

-- Visual Maps
map("v", "<leader>r", "\"hy:%s/<C-r>h//g<left><left>")		    -- Replace all instances of highlighted words 
map("v", "<C-s>", ":sort<CR>")									-- Sort highlighted text in visual mode with Control+S
map("v", "J", ":m '>+1<CR>gv=gv")								-- Move current line down
map("v", "K", ":m '>-2<CR>gv=gv")								-- Move current line up 

-- Automatically create if, case, and function templates in insert mode
-- map("i", ",i", "if [ @ ]; then <CR><CR> else <CR><CR> fi ")
-- map("i", ",c", "case \"$@\" in <CR><CR> @)    ;; <CR><CR> esac")
-- map("i", ",f", "@() {<CR><CR> } ")
