local bufnr = vim.api.nvim_get_current_buf()
vim.keymap.set("n", "<leader>a", function()
  vim.cmd.RustLsp "codeAction" -- supports rust-analyzer's grouping
  -- or vim.lsp.buf.codeAction() if you don't want grouping.
end, { silent = true, buffer = bufnr })
vim.keymap.set(
  "n",
  "K", -- Override Neovim's built-in hover keymap with rustaceanvim's hover actions
  function()
    vim.cmd.RustLsp { "hover", "actions" }
  end,
  { silent = true, buffer = bufnr }
)

vim.keymap.set(
  "v",
  "<Leader>dbg",
  "S)idbg!<Esc>",
  { 
    remap = true,
    desc = "Wrap selection in `dbg!`"
  }
)
vim.keymap.set(
  "n",
  "<Leader>dbg",
  "?dbg!<Enter>d4llds)",
  {
    remap = true,
    desc = "remove surrounding `dbg!`"
  }
)

vim.keymap.set(
  "n",
  "<Leader>rf",
  "m`Bi&<Esc>``l",
  { desc = "Add `&` before expression" }
)

vim.keymap.set(
  "n",
  "<Leader>dr",
  "m`Bi*<Esc>``l",
  { desc = "Add `&` before expression" }
)
