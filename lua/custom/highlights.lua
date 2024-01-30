-- To find any highlight groups: "<cmd> Telescope highlights"
-- Each highlight group can take a table with variables fg, bg, bold, italic, etc
-- base30 variable names can also be used as colors

local M = {}

---@type Base46HLGroupsList
M.override = {
  Comment = {
    fg = "#313131",
    italic = true,
  },
  DiffChange = {
    bg = "#464414",
    fg = "none",
  },
  DiffAdd = {
    bg = "#103507",
    fg = "none",
  },
  DiffRemoved = {
    bg = "#461414",
    fg = "none",
  },
  DiagnosticError = {
  fg = "#888894",
  },
  DiagnosticWarn = {
    fg = "#888894",
  },
  DiagnosticInfo = {
    fg = "#545560",
  },
  DiagnosticHint = {
    fg = "#767783",
  },

}

---@type HLTable
M.add = {
  NvimTreeOpenedFolderName = { fg = "green", bold = true },
}

return M