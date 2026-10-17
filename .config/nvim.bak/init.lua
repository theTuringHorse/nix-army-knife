-- $XDG_CONFIG_HOME/nvim/init.lua

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
----
require("keymaps")
require("options")
require("status")

-- Plugin setup (should probably be moved to plugin configs)
--require("mason").setup()

-- Netrw file explorer settings
vim.g.netrw_banner = 0        -- Remove annoying banner
vim.g.netrw_browse_split = 4  -- Open in prior window
vim.g.netrw_altv = 1          -- Split to the right instead of left
vim.g.netrw_liststyle = 3     -- Tree style view

-- Search settings
vim.opt.path:append("**")     -- Search current directory recursively
