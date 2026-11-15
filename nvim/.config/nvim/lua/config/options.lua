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
opt.wrap = false
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
opt.spelllang = "ru,en"
opt.autoread = true

vim.cmd.colorscheme("cleardark")

-- Russian is primary; English is also accepted for mixed-language notes.
-- Neovim's built-in spellfile plugin offers to fetch a missing dictionary.
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "markdown", "text", "gitcommit", "mdx" },
  callback = function(event)
    vim.bo[event.buf].spelloptions = "camel"
    vim.bo[event.buf].textwidth = 0
  end,
})

-- Window-local options otherwise carry over when a different buffer is opened.
vim.api.nvim_create_autocmd({ "BufEnter", "FileType" }, {
  callback = function(event)
    local ft = vim.bo[event.buf].filetype
    local prose = ft == "markdown" or ft == "mdx" or ft == "text" or ft == "gitcommit"
    vim.wo.wrap = prose
    vim.wo.spell = prose
  end,
})

-- Pick up external changes when returning to the editor or pausing in Normal mode.
vim.api.nvim_create_autocmd({ "FocusGained", "CursorHold" }, {
  callback = function()
    if vim.fn.mode() == "n" and vim.fn.getcmdwintype() == "" then
      vim.cmd("checktime")
    end
  end,
})
