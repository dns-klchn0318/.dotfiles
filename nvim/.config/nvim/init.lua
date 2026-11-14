-- Keep the leader available before lazy.nvim loads any plugins.
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- nvim-tree replaces netrw as the file browser.
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local opt = vim.opt
opt.termguicolors = true
opt.background = "dark"
opt.number = true
opt.relativenumber = true
opt.signcolumn = "yes"
opt.cursorline = true
opt.mouse = "a"
opt.clipboard = "unnamedplus"
opt.wrap = true
opt.linebreak = true
opt.breakindent = true
opt.expandtab = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.smartindent = true
opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true
opt.hlsearch = false
opt.completeopt = { "menu", "menuone", "noselect" }
opt.updatetime = 250
opt.timeoutlen = 400
opt.scrolloff = 5
opt.sidescrolloff = 5
opt.laststatus = 3
opt.showmode = false
opt.undofile = true
opt.splitright = true
opt.splitbelow = true
opt.fileencoding = "utf-8"

vim.cmd.colorscheme("cleardark")

-- Russian is primary; English is also accepted for mixed-language notes.
-- Neovim's built-in spellfile plugin offers to fetch a missing dictionary.
opt.spelllang = "ru,en"

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "markdown", "text", "gitcommit", "mdx" },
  callback = function(event)
    local bufopt = vim.bo[event.buf]
    bufopt.wrap = true
    bufopt.linebreak = true
    bufopt.spell = true
  end,
})

vim.keymap.set("n", "<leader>w", "<cmd>write<CR>", { desc = "Save file" })
vim.keymap.set("n", "<leader>q", "<cmd>quit<CR>", { desc = "Close window" })
vim.keymap.set("n", "<leader>bd", "<cmd>bdelete<CR>", { desc = "Close buffer" })
vim.keymap.set("n", "<S-l>", "<cmd>bnext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<S-h>", "<cmd>bprevious<CR>", { desc = "Previous buffer" })
vim.keymap.set("n", "<leader>ts", function()
  vim.wo.spell = not vim.wo.spell
end, { desc = "Toggle spell checking" })

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.mkdir(vim.fn.fnamemodify(lazypath, ":h"), "p")
  local result = vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--branch=stable",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Could not bootstrap lazy.nvim. Check that git and network access are available.\n", "ErrorMsg" },
      { result, "WarningMsg" },
    }, true, {})
    return
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  {
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
  },
  {
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
  },
  {
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
  },
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
    },
    config = function()
      local cmp = require("cmp")
      cmp.setup({
        completion = { autocomplete = { cmp.TriggerEvent.TextChanged } },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = false }),
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            else
              fallback()
            end
          end, { "i", "s" }),
        }),
        sources = cmp.config.sources({
          { name = "buffer", keyword_length = 2 },
          { name = "path" },
        }),
      })
    end,
  },
})

