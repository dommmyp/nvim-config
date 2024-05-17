local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  return
end

configs.setup({
  ensure_installed = "all",
  highlight = {
    enable = true, -- false will disable the whole extension
  },
  autopairs = {
    enable = true,
  },
  indent = { enable = true, disable = { "latex", "python", "css" } },
})

