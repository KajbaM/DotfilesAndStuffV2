-- require("colorbuddy").colorscheme("snazzybuddy")

local colorscheme = "gruvbox"

-- Uncomment below line, when using gruvbox to specify which gruvbox theme you
-- want
vim.o.background = "light"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
	vim.notify("Colorscheme " .. colorscheme .. " not found!")
	return
end
