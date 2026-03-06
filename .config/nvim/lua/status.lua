--Statusline

vim.cmd "highlight StatusType guibg=#b16286 guifg=#1d2021"
vim.cmd "highlight StatusFile guibg=#fabd2f guifg=#1d2021"
vim.cmd "highlight StatusModified guibg=#1d2021 guifg=#d3869b"
vim.cmd "highlight StatusBuffer guibg=#98971a guifg=#1d2021"
vim.cmd "highlight StatusLocation guibg=#458588 guifg=#1d2021"
vim.cmd "highlight StatusPercent guibg=#1d2021 guifg=#ebdbb2"
vim.cmd "highlight StatusNorm guibg=none guifg=white"

vim.o.statusline = "  %l "
				.. "%#StatusType#" .. "<< %Y   >>"
				.. "%#StatusFile#" .. "<< %F >>"
				.. "%#StatusModified#" .. " %m "
				.. "%#StatusNorm#" .. "%="
				.. "%#StatusBuffer#" .. "<<  %n >>"
				.. "%#StatusLocation#" .. "<< 󰋁 %l,%c >>"
				.. "%#StatusPercent#" .. "<< %p%%   >> "
