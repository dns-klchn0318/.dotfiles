return {
  "akinsho/bufferline.nvim",
  version = "*",
  event = "VeryLazy",
  opts = {
    options = {
      mode = "buffers",
      numbers = "ordinal",
      separator_style = "thin",
      indicator = { style = "underline" },
      show_buffer_icons = false,
      show_buffer_close_icons = false,
      show_close_icon = false,
      always_show_bufferline = true,
      color_icons = false,
    },
    highlights = {
      fill = { fg = "#858585", bg = "NONE" },
      background = { fg = "#858585", bg = "NONE" },
      buffer_visible = { fg = "#858585", bg = "NONE" },
      buffer_selected = { fg = "#cccccc", bg = "NONE", bold = true, underline = true },
      separator = { fg = "#585858", bg = "NONE" },
      separator_visible = { fg = "#585858", bg = "NONE" },
      separator_selected = { fg = "#585858", bg = "NONE" },
      indicator_selected = { fg = "#61afef", bg = "NONE" },
    },
  },
}
