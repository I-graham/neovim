require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map({"n", "v", "i"}, "<C-[>", "<Esc>")
map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

vim.keymap.del("n", "<tab>")
vim.keymap.set("n", "<S-tab>",
  function()
    require("nvchad.tabufline").next()
  end
)
vim.keymap.set("n", ",", ";")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "<M-J>", "<Cmd>m+1<CR>")
vim.keymap.set("n", "<M-K>", "<Cmd>m-2<CR>")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set(
  'c', '<CR>',
  function() return vim.fn.getcmdtype() == '/' and '<CR>zzzv' or '<CR>' end,
  { expr = true }
)

vim.keymap.set({"n", "v"}, "j", "gj")
vim.keymap.set({"n", "v"}, "gj", "j")
vim.keymap.set("i", "<C-j>", "<C-o>gj")
vim.keymap.set("n", "<C-o>", "<C-o>zz")

vim.keymap.set({"n", "v"}, "k", "gk")
vim.keymap.set({"n", "v"}, "gk", "k")
vim.keymap.set("i", "<C-k>", "<C-o>gk")
vim.keymap.set("n", "<C-i>", "<C-i>zz")

vim.keymap.set({"n", "v"}, "<M-j>", "<cmd>cnext<CR>zz")
vim.keymap.set({"n", "v"}, "<M-k>", "<cmd>cprev<CR>zz")
vim.keymap.set({"n", "v"}, "<M-d>", "<cmd>lua vim.diagnostic.setqflist()<CR>", { desc = "Open diagnostics in Quickfix"})
vim.keymap.set({"n", "v"}, "<M-r>", "<cmd>RustLsp relatedDiagnostics<CR>", { desc = "Open related diagnostics in Quickfix"})

vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<Cr>")

vim.opt.clipboard = ""
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set({ "n", "v" }, "<leader>Y", [["+Y]])
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])
vim.keymap.set({ "n", "v" }, "<leader>dd", [["_dd]])

vim.keymap.set({"n", "v", "i"}, "<C-s>", "<cmd>w<CR>")

-- Paste without copying
vim.keymap.set("x", "<leader>P", [["_dP]])
vim.keymap.set({ "n", "x" }, "<leader>p", [["+p]])

vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- Nvim DAP

-- rustaceanvim
map("n", "<Leader>dt", "<cmd>lua vim.cmd('RustLsp testables')<CR>", { desc = "Debugger testables" })

map("n", "<Leader>tkm", "<cmd>lua vim.cmd('Telescope keymaps')<CR>")

-- Telescope projects
map("n", "<Leader>fp", "<cmd>lua vim.cmd('Telescope project')<CR>")

-- Leap
map({"n", "x", "o"}, "f", "<Plug>(leap)")
map({"n", "x", "o"}, "gf", "f")
