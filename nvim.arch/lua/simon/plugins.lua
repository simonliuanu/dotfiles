vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

return require('packer').startup(function()

	-- Have packer manager itself
	use 'wbthomason/packer.nvim'

	-- Colorschemes of course
	use 'Mofiqul/dracula.nvim'

	-- Useful modules
	use 'kyazdani42/nvim-web-devicons'
	use 'goolord/alpha-nvim'
	use 'windwp/nvim-autopairs'

	-- Treesitter
	use 'nvim-treesitter/nvim-treesitter'

	-- Lualine
	use 'nvim-lualine/lualine.nvim'
end)
