-- Options config

local o = vim.opt

o.title = true					-- show title
o.number = true					-- turn on line numbers
o.relativenumber = true			-- turn on relative line numbers
o.cursorline	 = true
o.mouse = 'a'					-- enable the mouse in all modes
o.ignorecase = true				-- enable case insensitive searching
o.smartcase = true				-- all searches are case insensitive unless there's a capital letter
-- o.hlsearch = true				-- disable all highlighted search results
o.incsearch = true				-- enable incremental searching
o.tabstop = 4					-- tabs=4spaces
o.shiftwidth = 4
o.pumheight = 10				-- number of items in popup menu
o.showtabline = 2				-- always show the tab line
o.laststatus = 2				-- always show statusline
o.signcolumn = "auto"
o.smartindent = true
o.showcmd = true
o.scrolloff = 8					-- scroll page when cursor is 8 lines from top/bottom
o.sidescrolloff = 8				-- scroll page when cursor is 8 spaces from left/right
o.guifont = "monospace:h17"		
o.clipboard = "unnamedplus"
o.completeopt= { "menuone", "noselect" }
o.splitbelow = true				-- split go below
o.splitright = true				-- vertical split to the right
o.termguicolors = true			-- terminal gui colors (keep for clarity)
o.foldmethod = "indent"
o.foldlevel  = 99
