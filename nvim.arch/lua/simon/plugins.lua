vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Have packer use a popup window
require('packer').init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

return require('packer').startup(function()

	-- Have packer manager itself
	use 'wbthomason/packer.nvim'

	-- Colorschemes of course
	use 'Mofiqul/dracula.nvim'

	-- Useful modules
	use 'kyazdani42/nvim-web-devicons'
	use 'kyazdani42/nvim-tree.lua'
	use 'goolord/alpha-nvim'
	use 'glepnir/dashboard-nvim'
	use 'windwp/nvim-autopairs'
	use 'nvim-lua/plenary.nvim'
	use 'nvim-lua/popup.nvim'
	use 'tpope/vim-surround'
	use 'norcalli/nvim-colorizer.lua'
	use 'karb94/neoscroll.nvim'

	-- Comment
	use 'numToStr/Comment.nvim'

	-- Treesitter
	use 'nvim-treesitter/nvim-treesitter'

	-- Lualine
	use 'nvim-lualine/lualine.nvim'

	-- Telescope
	use 'nvim-telescope/telescope.nvim'

	-- Transparent
	use 'xiyaowong/nvim-transparent'

	-- Bufferline
	use 'akinsho/bufferline.nvim'

end)
