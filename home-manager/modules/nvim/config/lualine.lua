local function copilot_status()
	if not vim.g.copilot_init then
		return [[Copilot Uninit]]
	elseif vim.g.copilot_status then
		return [[Copilot On]]
	else
		return [[Copilot Off]]
	end
end

require("lualine").setup({
	options = {
		theme = "catppuccin",
	},
	sections = {
		lualine_x = { copilot_status, "encoding", "fileformat", "filetype" },
	},
})
