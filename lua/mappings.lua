require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

vim.api.nvim_set_keymap("", "<c-c>", "y", { noremap = true, silent = true })
vim.api.nvim_set_keymap("x", "<c-c>", "y", { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "<bs>", "hx", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<bs>", '"_d', { noremap = true, silent = true })

vim.api.nvim_set_keymap("", "<m-a>", "ggVG", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<m-a>", "<esc>ggVG", { noremap = true, silent = true })
vim.api.nvim_set_keymap("!", "<m-a>", "<esc>ggVG", { noremap = true, silent = true })
vim.api.nvim_set_keymap("t", "<m-a>", "<esc>ggVG", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<m-a>", "<esc>ggVG", { noremap = true, silent = true })

vim.api.nvim_set_keymap("", "<m-s>", ":w<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("!", "<m-s>", "<esc>:w<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("t", "<m-s>", "<esc>:w<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<m-s>", "<esc>:w<cr>", { noremap = true, silent = true })

vim.api.nvim_set_keymap("x", "<tab>", ">gv", { noremap = true, silent = true })
vim.api.nvim_set_keymap("x", "<s-tab>", "<gv", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<s-tab>", "<c-d>", { noremap = true, silent = true })

for i = 1, 9, 1 do
  vim.keymap.set("n", string.format("<A-%s>", i), function()
    vim.api.nvim_set_current_buf(vim.t.bufs[i])
  end)
end
