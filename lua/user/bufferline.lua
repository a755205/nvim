local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
  return
end

bufferline.setup {
  options = {
    mode = "buffers", -- set to "tabs" to only show tabpages instead
    --[[ diagnostics = "nvim_lsp", -- false | "nvim_lsp" | "coc" ]]
    diagnostics = false, -- false | "nvim_lsp" | "coc"
    separator_style = "slant",  --  "slant" | "thick" | "thin" | { 'any', 'any' },
    indicator = {
      icon = '▎', -- this should be omitted if indicator style is not 'icon'
      style =  'none' ,
    },
    offsets = {
    {
        filetype = "NvimTree",
        text = "File Explorer",
        highlight = "Directory",
        separator = true -- use a "true" to enable the default, or set your own character
    }
    },
    hover = {
      enabled = true,
      delay = 200,
      reveal = {'close'}
    }
  }
}
