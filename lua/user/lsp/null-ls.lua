local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
	debug = false,
	sources = {
		--[[ *** formatting *** ]]
		--[[ *** formatting *** ]]
		--[[ *** formatting *** ]]
		--
		--[[ formatting.prettier.with({ extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" } }), ]]
		formatting.prettier,
		formatting.black.with({ extra_args = { "--fast" } }),
		formatting.stylua,
		formatting.beautysh,
		--[[ formatting.eslint, ]]
		--[[ formatting.fixjson, ]]
		formatting.gofmt,
		--[[ formatting.lua_format, ]]
		--[[ formatting.mdformat, ]]
		formatting.nginx_beautifier,
		--[[ formatting.perttier, ]]
		--[[ formatting.perttier_eslint, ]]
		formatting.sqlformat,
		formatting.stylelint,
		formatting.yamlfmt,

		--[[ *** diagnostics *** ]]
		--[[ *** diagnostics *** ]]
		--[[ *** diagnostics *** ]]

		--[[ diagnostics.golangci, ]]
		diagnostics.golangci_lint,
		--[[ diagnostics.jshint.with({}), ]]
		diagnostics.jshint,
		diagnostics.jsonlint,
		diagnostics.php,
		diagnostics.stylelint,
		-- diagnostics.flake8
	},
})
