local opts ={ silent = true }
local keymap = vim.api.nvim_set_keymap

-- normal/insert
-- <Plug>MarkdownPreview
-- <Plug>MarkdownPreviewStop
-- <Plug>MarkdownPreviewToggle

keymap("n", "<leader>mp", "<Plug>MarkdownPreview", opts)
keymap("n", "<leader>ms", "<Plug>MarkdownPrevieStop", opts)
keymap("n", "<leader>mt", "<Plug>MarkdownPreviewToggle", opts)
