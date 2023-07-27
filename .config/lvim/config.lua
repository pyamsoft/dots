lvim.log.level = "warn"
lvim.format_on_save = false
lvim.transparent_window = false -- For transparent windows

-- Theme
lvim.colorscheme = "catppuccin-macchiato"
-- to disable icons and use a minimalist setup, uncomment the following
-- lvim.use_icons = false

-- Core Plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerSync
-- dap overrides the Leader<d> binding for a debugger - which we don't need right now.
lvim.builtin.dap.active = false

-- Alpha is a dashboard which is nice but we don't need
lvim.builtin.alpha.active = false

-- LSP
-- can be "all"
-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = { "bash", "python" }
-- disable automatic installation of servers
-- lvim.lsp.installer.setup.automatic_installation = false

-- set a formatter, this will override the language server formatting capabilities (if it exists)
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { command = "black", filetypes = { "python" } },
  { command = "prettier" },
}

-- set additional linters
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  { command = "flake8", filetypes = { "python" } },
  { command = "shellcheck" },
}

-- Additional Plugins
lvim.plugins = {
  {
    -- Rainbow Parentheses
    "p00f/nvim-ts-rainbow",
  },
  {
    -- Catppuccin Theme
    "catppuccin/nvim",
  },
  {
    -- lsp diagnostics highlight groups for non lsp colorschemes
    "folke/lsp-colors.nvim",
    event = "BufRead",
  },
  {
    -- Vim Surround
    "tpope/vim-surround",
  },
}

-- Treesitter
lvim.builtin.treesitter.highlight.enable = true
lvim.builtin.treesitter.rainbow.enable = true

-- Mouse
vim.opt.mouse = "" -- Disable mouse support

-- Editor
vim.opt.wrap = true

-- Key Mapping [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"

-- key mappings
-- navigation
lvim.keys.normal_mode["j"] = "gj"
lvim.keys.normal_mode["k"] = "gk"
lvim.keys.normal_mode["0"] = "g0"
lvim.keys.normal_mode["$"] = "g$"
lvim.keys.normal_mode["<Up>"] = "10gk"
lvim.keys.normal_mode["<Down>"] = "10gj"

-- buffers
lvim.keys.normal_mode["<Left>"] = "<cmd>bprevious<CR>"
lvim.keys.normal_mode["<Right>"] = "<cmd>bnext<CR>"

-- exit insert mode
lvim.keys.insert_mode["jj"] = "<Esc>"
lvim.keys.insert_mode["jk"] = "<Esc>"

-- Use which-key to add extra bindings with the leader-key prefix
lvim.builtin.which_key.mappings["w"] = { "<cmd>w<CR>", "Save" }
lvim.builtin.which_key.mappings["q"] = { "<cmd>q<CR>", "Quit" }
lvim.builtin.which_key.mappings["Q"] = { "<cmd>q!<CR>", "Quit without Saving" }
lvim.builtin.which_key.mappings["d"] = { "<cmd>bdelete<CR>", "Delete Buffer" }
lvim.builtin.which_key.mappings["D"] = { "<cmd>bdelete!<CR>", "Delete Buffer without Saving" }

-- Telescope on Leader+; (we don't use alpha)
lvim.builtin.which_key.mappings[";"] = { "<cmd>Telescope<CR>", "Telescope" }

