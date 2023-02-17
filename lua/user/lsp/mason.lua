local servers = {
--[[ https://github.com/williamboman/mason-lspconfig.nvim#available-lsp-servers ]]
	"lua_ls",           -- lua
	"pyright",          -- python
	"jsonls",           -- json
  "quick_lint_js",    -- javascript
  "eslint",           -- eslint
  "bashls",           -- bash
  "clangd",           -- c
  "cssls",            -- css
  "dockerls",         -- docker
  "glint",            -- go glint
  "gopls",            -- go
  "html",             -- html
  "intelephense",     -- php
  "phpactor",         -- php
  "psalm",            -- php
  "volar",            -- vue
  "vuels",            -- vue
  "yamlls",           -- yaml
  "remark_ls",        -- markdown
  --[[ "sqls",            -- sql ]]
}

local settings = {
	ui = {
		border = "none",
		icons = {
			package_installed = "◍",
			package_pending = "◍",
			package_uninstalled = "◍",
		},
	},
	log_level = vim.log.levels.INFO,
	max_concurrent_installers = 4,
}

require("mason").setup(settings)
require("mason-lspconfig").setup({
	ensure_installed = servers,
	automatic_installation = true,
})

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
	return
end

local opts = {}

for _, server in pairs(servers) do
	opts = {
		on_attach = require("user.lsp.handlers").on_attach,
		capabilities = require("user.lsp.handlers").capabilities,
	}

	server = vim.split(server, "@")[1]

	local require_ok, conf_opts = pcall(require, "user.lsp.settings." .. server)
	if require_ok then
		opts = vim.tbl_deep_extend("force", conf_opts, opts)
	end

	lspconfig[server].setup(opts)
end
