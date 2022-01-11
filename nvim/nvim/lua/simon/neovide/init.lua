vim.cmd("let g:neovide_remember_window_size = v:true")
vim.cmd("let g:remember_window_position = v:true")
if vim.fn.has('neovide') then
	vim.opt.lines = 120
	vim.opt.columns = 10
end
