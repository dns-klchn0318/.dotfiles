return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  opts = {
    options = {
      theme = {
        normal = {
          a = { fg = "#111111", bg = "#98c379", gui = "bold" },
          b = { fg = "#cccccc", bg = "NONE" },
          c = { fg = "#858585", bg = "NONE" },
        },
        insert = {
          a = { fg = "#111111", bg = "#61afef", gui = "bold" },
          b = { fg = "#cccccc", bg = "NONE" },
          c = { fg = "#858585", bg = "NONE" },
        },
        visual = {
          a = { fg = "#111111", bg = "#c678dd", gui = "bold" },
          b = { fg = "#cccccc", bg = "NONE" },
          c = { fg = "#858585", bg = "NONE" },
        },
        replace = {
          a = { fg = "#111111", bg = "#e06c75", gui = "bold" },
          b = { fg = "#cccccc", bg = "NONE" },
          c = { fg = "#858585", bg = "NONE" },
        },
        command = {
          a = { fg = "#111111", bg = "#e5c07b", gui = "bold" },
          b = { fg = "#cccccc", bg = "NONE" },
          c = { fg = "#858585", bg = "NONE" },
        },
        inactive = {
          a = { fg = "#858585", bg = "NONE" },
          b = { fg = "#858585", bg = "NONE" },
          c = { fg = "#858585", bg = "NONE" },
        },
      },
      globalstatus = true,
      icons_enabled = false,
      component_separators = { left = "│", right = "│" },
      section_separators = { left = "", right = "" },
    },
    sections = {
      lualine_a = { "mode" },
      lualine_b = { "branch", "diff", "diagnostics" },
      lualine_c = { { "filename", path = 1 } },
      lualine_x = { "encoding", "fileformat", "filetype" },
      lualine_y = { "progress" },
      lualine_z = { "location" },
    },
  },
}
