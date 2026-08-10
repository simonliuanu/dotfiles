local options = {
	number = true,
	relativenumber = true,
	hlsearch = true,
	shiftwidth = 4,
	tabstop = 4,
	ignorecase = true,
	smartcase = true,
	smartindent = true,
	scrolloff = 4,
	sidescrolloff = 4,
	splitbelow = true,
	splitright = true,
	completeopt = { "menuone", "noselect" },
	updatetime = 300,
	fileencoding = "utf-8",
	-- showtabline = 2,
	-- termguicolors = true,
	completeopt = { "menu", "menuone", "noselect" },
	guifont = "FantasqueSansMono Nerd Font:h20",
}

for k, v in pairs(options) do
	vim.opt[k] = v
end

vim.cmd "set whichwrap+=<,>,[,],h,l"
