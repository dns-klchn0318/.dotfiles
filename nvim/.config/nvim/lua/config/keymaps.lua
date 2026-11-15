local function toggle_focus_mode()
  local state = vim.w.prose_focus_state
  if state then
    vim.wo.number = state.number
    vim.wo.relativenumber = state.relativenumber
    vim.wo.signcolumn = state.signcolumn
    vim.wo.cursorline = state.cursorline
    vim.w.prose_focus_state = nil
    return
  end

  vim.w.prose_focus_state = {
    number = vim.wo.number,
    relativenumber = vim.wo.relativenumber,
    signcolumn = vim.wo.signcolumn,
    cursorline = vim.wo.cursorline,
  }
  vim.wo.number = false
  vim.wo.relativenumber = false
  vim.wo.signcolumn = "no"
  vim.wo.cursorline = false
end

local function toggle_markdown_checkbox()
  local line = vim.api.nvim_get_current_line()
  local start, finish = line:find("%[ %]")
  local replacement = "[x]"
  if not start then
    start, finish = line:find("%[[xX]%]")
    replacement = "[ ]"
  end
  if start then
    vim.api.nvim_set_current_line(line:sub(1, start - 1) .. replacement .. line:sub(finish + 1))
  end
end

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "markdown", "mdx" },
  callback = function(event)
    local opts = { buffer = event.buf, silent = true }
    vim.keymap.set("n", "<leader>mf", toggle_focus_mode, vim.tbl_extend("force", opts, { desc = "Toggle writing focus mode" }))
    vim.keymap.set("n", "<leader>mw", function()
      local words = vim.fn.wordcount().words
      vim.notify(string.format("%d words", words), vim.log.levels.INFO, { title = "Word count" })
    end, vim.tbl_extend("force", opts, { desc = "Show word count" }))
    vim.keymap.set("n", "<leader>mt", toggle_markdown_checkbox, vim.tbl_extend("force", opts, { desc = "Toggle Markdown checkbox" }))
    vim.keymap.set("n", "]h", function() vim.fn.search("^#\\+ ", "W") end, vim.tbl_extend("force", opts, { desc = "Next Markdown heading" }))
    vim.keymap.set("n", "[h", function() vim.fn.search("^#\\+ ", "bW") end, vim.tbl_extend("force", opts, { desc = "Previous Markdown heading" }))
  end,
})

vim.keymap.set("n", "<leader>w", "<cmd>write<CR>", { desc = "Save file" })
vim.keymap.set("n", "<leader>q", "<cmd>quit<CR>", { desc = "Close window" })
vim.keymap.set("n", "<leader>bd", "<cmd>bdelete<CR>", { desc = "Close buffer" })
vim.keymap.set("n", "<S-l>", "<cmd>bnext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<S-h>", "<cmd>bprevious<CR>", { desc = "Previous buffer" })
vim.keymap.set("n", "<leader>tn", "<cmd>tabnew<CR>", { desc = "New tab" })
vim.keymap.set("n", "<leader>tc", "<cmd>tabclose<CR>", { desc = "Close tab" })
vim.keymap.set("n", "<leader>th", "<cmd>tabprevious<CR>", { desc = "Previous tab" })
vim.keymap.set("n", "<leader>tl", "<cmd>tabnext<CR>", { desc = "Next tab" })
vim.keymap.set({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, desc = "Down by display line" })
vim.keymap.set({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, desc = "Up by display line" })
vim.keymap.set("n", "<leader>ts", function()
  vim.wo.spell = not vim.wo.spell
end, { desc = "Toggle spell checking" })
