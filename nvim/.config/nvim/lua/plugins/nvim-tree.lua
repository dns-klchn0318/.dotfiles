return {
  "nvim-tree/nvim-tree.lua",
  cmd = { "NvimTreeToggle", "NvimTreeFocus", "NvimTreeFindFile" },
  keys = {
    { "<leader>e", "<cmd>NvimTreeToggle<CR>", desc = "Toggle file tree" },
    { "<leader>E", "<cmd>NvimTreeFocus<CR>", desc = "Focus file tree" },
  },
  opts = {
    sync_root_with_cwd = true,
    respect_buf_cwd = true,
    update_focused_file = { enable = true, update_root = false },
    view = { width = 32, side = "left" },
    renderer = {
      highlight_git = false,
      icons = {
        show = { file = false, folder = false, folder_arrow = false, git = false },
      },
    },
    filters = { dotfiles = false },
    actions = { open_file = { quit_on_open = false } },
  },
}
