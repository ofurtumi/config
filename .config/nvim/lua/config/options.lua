-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
local cmp = require("cmp")
return {
  {
    "zbirenbaum/copilot-cmp",
    dependencies = "copilot.lua",
    config = function(_, opts)
      local copilot_cmp = require("copilot_cmp")
      copilot_cmp.setup({
        mapping = {
          ["<CR>"] = cmp.mapping.confirm({
            -- this is the important line
            behavior = cmp.ConfirmBehavior.Replace,
            select = false,
          }),
        },
      })
      -- attach cmp source whenever copilot attaches
      -- fixes lazy-loading issues with the copilot cmp source
      require("lazyvim.util").on_attach(function(client)
        if client.name == "copilot" then
          copilot_cmp._on_insert_enter()
        end
      end)
    end,
  },
}
