---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- vim options can be configured here
    options = {
      opt = { -- vim.opt.<key>
        relativenumber = false, -- sets vim.opt.relativenumber
        number = true, -- sets vim.opt.number
        spell = false, -- sets vim.opt.spell
        signcolumn = "yes", -- sets vim.opt.signcolumn to yes
        wrap = true, -- sets vim.opt.wrap
      },
    },
    -- Mappings can be configured through AstroCore as well.
    -- NOTE: keycodes follow the casing in the vimdocs. For example, `<Leader>` must be capitalized
    mappings = {
      -- first key is the mode
      n = {
        -- second key is the lefthand side of the map

        -- Navigate through wraps
        ["j"] = { "gj" },
        ["k"] = { "gk" },
        ["0"] = { "g0" },
        ["$"] = { "g$" },

        -- Fast navigate through wraps
        ["<Up>"] = { "10gk" },
        ["<Down>"] = { "10gj" },

        -- navigate buffer tabs
        ["<Right>"] = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
        ["<Left>"] = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },

        -- setting a mapping to false will disable it
        -- ["<C-S>"] = false,
      },
    },
  },
}
