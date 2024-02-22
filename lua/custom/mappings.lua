---@type MappingsTable
local M = {}
-- local moveline = require('moveline')

M.general = {
  n = {

    ["<C-h>"] = { "<cmd> TmuxNavigateLeft<CR>", "window left" },
    ["<C-l>"] = { "<cmd> TmuxNavigateRight<CR>", "window right" },
    ["<C-j>"] = { "<cmd> TmuxNavigateDown<CR>", "window down" },
    ["<C-k>"] = { "<cmd> TmuxNavigateUp<CR>", "window up" },

    ["<C-b>"] = {
      function()
        require("base46").toggle_transparency()
      end,
      "Toggle transparency",},

    ["<leader>w"] = { "<cmd>w<CR>", "Save" },
    ["<leader>ll"] = { "<cmd>TroubleToggle<CR>", "Open Trouble" },
    ["<leader>lq"] = { "<cmd>TroubleToggle quickfix<CR>", "Open Trouble" },
    ["<leader>ft"] = { "<cmd>TodoTelescope<CR>", "Find Todo" },
    ["\\"] = { "<cmd>:vsplit <CR>", "Vertical split" },
    ["<Esc>"] = { "<Esc>:w!<CR>", "Save and exit insert mode" },
    ["<C-]>"] = {
      function()
        require("nvterm.terminal").toggle "vertical"
      end,
    },
    ["<C-\\>"] = {
      function()
        require("nvterm.terminal").toggle "horizontal"
      end,
    },
    ["m"] = {
      ":m -2<CR>",
    },
    ["n"] = {
      ":m +1<CR>",
    },

    ["<leader>tt"] = {
      function()
        require("neotest").run.run()
      end,
      "Run nearest test",
    },
    ["<leader>tf"] = {
      function()
        require("neotest").run.run(vim.fn.expand "%")
      end,
      "Run file test",
    },
    ["<leader>to"] = {
      ":Neotest output<CR>",
      "Test output",
    },
    ["<leader>ts"] = {
      ":Neotest summary<CR>",
      "Test summary",
    },
    ["<leader>du"] = {
      function()
        require("dapui").toggle()
      end,
      "Dedug UI",
    },
    ["<leader>db"] = {
      function()
        require("dap").toggle_breakpoint()
      end,
      "Breakpoint",
    },
    ["<leader>ds"] = {
      function()
        require("dap").continue()
      end,
      "Start",
    },
    ["<leader>dn"] = {
      function()
        require("dap").step_over()
      end,
      "Step over",
    },
    ["<leader>cg"] = {
      ":ChatGPTCompleteCode<CR>",
      "Step over",
    },
    ["<leader>ce"] = {
      ":CodeiumEnable<CR>",
      "Step over",
    },
    ["<leader>cd"] = {
      ":CodeiumDisable<CR>",
      "Step over",
    },
    ["<leader>xd"] = {
      ":Copilot disable<CR>",
      "Step over",
    },
    ["<leader>xe"] = {
      ":Copilot enable<CR>",
      "Step over",
    },
    ["<leader>cc"] = {
      ":ChatGPT<CR>",
    },
    ["<leader>gl"] = {
      ":Flog<CR>",
      "Git Log",
    },
    ["<leader>gf"] = {
      ":DiffviewFileHistory<CR>",
      "Git File History",
    },
    ["<leader>gc"] = {
      ":DiffviewOpen HEAD~2<CR>",
      "Git Last Commit",
    },
    ["<leader>gt"] = {
      ":DiffviewToggleFile<CR>",
      "Git Last Commit",
    },


  },
  t = {
    ["<C-]>"] = {
      function()
        require("nvterm.terminal").toggle "vertical"
      end,
    },
    ["<C-\\>"] = {
      function()
        require("nvterm.terminal").toggle "horizontal"
      end,
    },
  },
}



local map = vim.keymap.set
map("i", "<C-r>", "copilot#Accept('<CR>')", {noremap = true, silent = true, expr=true, replace_keycodes = false })
map("n", "<C-;>", "<cmd>Lspsaga hover_doc<CR>", { silent = true, noremap = true, desc = 'LSP Hover' })
-- map("n", "n", "<cmd>Lspsaga code_action<CR>", { silent = true, noremap = true, desc = 'LSP Code Action' })

vim.g.copilot_no_tab_map = true
vim.g.copilot_assume_mapped = true
vim.g.copilot_tab_fallback = ""
vim.b.copilot_enabled = true

vim.keymap.set("i", "<C-g>", function()
  return vim.fn["codeium#Accept"]()
end, { expr = true })

vim.keymap.set("i", "<C-x>", function()
  return vim.fn["codeium#Clear"]()
end, { expr = true })


-- vim.keymap.set("i", "<C-x>", function()
--   return vim.fn["codeium#Clear"]()
-- end, { expr = true })

-- vim.keymap.set("i", "<C-b>", function()
--   return vim.fn["codeium#Change"]()
-- end, { expr = true })
--
-- next suggestion	codeium#CycleCompletions(1)	<M-]>
vim.keymap.set("i", "<C-]>", function()
  return vim.fn["codeium#CycleCompletions"](1)
end, { expr = true })

--
-- prev suggestion	codeium#CycleCompletions(-1)	<M-[>
-- vim.keymap.set("i", "<C-[>", function()
--   return vim.fn["codeium#CycleCompletions"](-1)
-- end, { expr = true })

--
-- prev suggestion	codeium#CycleCompletions(-1)	<M-[>
-- vim.keymap.set("i", "<M-[>", function()
--   return vim.fn["codeium#CycleCompletions"](-1)
-- end, { expr = true })

vim.cmd("command! -nargs=+ E Emmet <args>")
-- Для нормального режима
-- vim.keymap.set('n', '<M-k>', moveline.up, { silent = true })
-- vim.keymap.set('n', '<M-j>', moveline.down, { silent = true })
--
-- -- Для визуального режима
-- vim.keymap.set('v', '<M-k>', moveline.block_up, { silent = true })
-- vim.keymap.set('v', '<M-j>', moveline.block_down, { silent = true })
-- vim.g.user_emmet_mode = "a"
-- vim.g.user_emmet_leader_key = ","

-- more keybinds!

-- Перемещение строки вверх и вниз в нормальном режиме
vim.keymap.set('n', 'K', ':m .-2<CR>==', { noremap = true, silent = true })
vim.keymap.set('n', 'J', ':m .+1<CR>==', { noremap = true, silent = true })

-- Перемещение строки вверх и вниз в визуальном режиме
vim.keymap.set('x', 'K', ":m '<-2<CR>gv=gv", { noremap = true, silent = true })
vim.keymap.set('x', 'J', ":m '>+1<CR>gv=gv", { noremap = true, silent = true })

vim.keymap.set('n', 'U', ':redo<cr>', { noremap = true, silent = true })

return M
