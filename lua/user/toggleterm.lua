local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
  return
end

toggleterm.setup({
  size = 20,
  open_mapping = [[<c-p>]],
  --[[ direction = 'vertical' | 'horizontal' | 'tab' | 'float', ]]

  direction = "float",
  float_opts = {
    -- The border key is *almost* the same as 'nvim_open_win'
    -- see :h nvim_open_win for details on borders however
    -- the 'curved' border is a custom border type
    -- not natively supported but implemented in this plugin.
    --[[ border = 'single' | 'double' | 'shadow' | 'curved' | ... other options supported by win open ]]
    border = 'curved',
    -- like `size`, width and height can be a number or function which is passed the current terminal
    --[[ width = 100, ]]
    --[[ height = 30, ]]
    winblend = 3,
  },
})

local Terminal = require("toggleterm.terminal").Terminal

local node = Terminal:new({ cmd = "node", hidden = true})

function _NODE_TOGGLE()
  node:toggle()
end



--[[ vim.api.nvim_set_keymap("n", "<leader>g", "<cmd>lua _lazygit_toggle()<CR>", {noremap = true, silent = true}) ]]
--[[ vim.api.nvim_set_keymap("n", "<leader>g", "<cmd>lua _lazygit_toggle()<CR>", {noremap = true, silent = true}) ]]

