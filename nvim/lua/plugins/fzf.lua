vim.g.fzf_layout = { window = { width = 0.9, height = 0.6 } }
vim.g.fzf_history_dir = '~/.local/share/fzf-history'

require("fzf-lua").setup()

if vim.fn.executable("fzf") ~= 1 then
  vim.notify("fzf not found. brew install fzf", vim.log.levels.WARN)
end

