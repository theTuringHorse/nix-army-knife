local wezterm = require 'wezterm'

local colors = wezterm.color.extract_colors_from_image '/home/johaan/share/wallpapers/fire-skull.jpg'

  local ansi = {}
  local brights = {}

  for idx, color in ipairs(colors) do
    if idx <= 8 then
      ansi[idx] = color
    else
      brights[idx - 8] = color
    end
  end

  return {
    colors = {
      ansi = ansi,
      brights = brights,
    },
  }
