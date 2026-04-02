--Statusline

vim.cmd "highlight StatusType     guibg=#b16286 guifg=#1d2021"
vim.cmd "highlight StatusFile     guibg=#fabd2f guifg=#1d2021"
vim.cmd "highlight StatusModified guibg=#1d2021 guifg=#d3869b"
vim.cmd "highlight StatusBuffer   guibg=#98971a guifg=#1d2021"
vim.cmd "highlight StatusLocation guibg=#458588 guifg=#1d2021"
vim.cmd "highlight StatusPercent  guibg=#1d2021 guifg=#ebdbb2"
vim.cmd "highlight StatusNorm     guibg=#1d2021 guifg=white"

-- Powerline separator highlights (fg = departing segment bg, bg = arriving segment bg)
vim.cmd "highlight SepTypeFile  guibg=#fabd2f guifg=#b16286"
vim.cmd "highlight SepFileNorm  guibg=#1d2021 guifg=#fabd2f"
vim.cmd "highlight SepNormBuf   guibg=#1d2021 guifg=#98971a"
vim.cmd "highlight SepBufLoc    guibg=#98971a guifg=#458588"
vim.cmd "highlight SepLocPct    guibg=#458588 guifg=#1d2021"

local r = vim.fn.nr2char(0xE0B0) -- solid right arrow
local l = vim.fn.nr2char(0xE0B2) -- solid left arrow

vim.o.statusline = "%#StatusType#"     .. "  %l "
                .. "%#SepTypeFile#"    .. r
                .. "%#StatusFile#"     .. " %Y  %F "
                .. "%#SepFileNorm#"    .. r
                .. "%#StatusModified#" .. " %m "
                .. "%#StatusNorm#"     .. "%="
                .. "%#SepNormBuf#"     .. l
                .. "%#StatusBuffer#"   .. "  %n "
                .. "%#SepBufLoc#"      .. l
                .. "%#StatusLocation#" .. " \u{F0841} %l,%c "
                .. "%#SepLocPct#"      .. l
                .. "%#StatusPercent#"  .. " %p%%  "
