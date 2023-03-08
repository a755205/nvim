local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

--[[ https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTIN_CONFIG.md ]]
--中文回應 neovim lua null-ls  setup builtins fotmatting 配置prettier, 並在專案中使用.prettierrc
--neovim 如何使用 lua null-ls  setup builtins fotmatting 配置prettier, 並在專案中使用.prettierrc

null_ls.setup({
	--[[ debug = false, ]]
	debug = true,
	sources = {
		--[[ *** formatting *** ]]
		--[[ *** formatting *** ]]
		--[[ *** formatting *** ]]
		--
		--[[ formatting.prettier.with({ extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" } }), ]]
		--[[ formatting.prettier, ]]
		null_ls.builtins.formatting.prettier.with({
			filetypes = { "javascript", "typescript", "json", "php" },
			args = { "--config", vim.fn.expand("%:p:h") .. "/.prettierrc" },
			-- 指定 prettier 的配置文件路徑
			--[[ extra_args = function(params) ]]
			--[[ 	local config_path = vim.fn.getcwd() .. "/.prettierrc" ]]
			--[[ 	return { "--config=" .. config_path } ]]
			--[[ end, ]]
		}),

		--[[ formatting.prettier.setup({ ]]
		--[[ 	filetypes = { ]]
		--[[ 		"javascript", ]]
		--[[ 		"typescript", ]]
		--[[ 		"javascriptreact", ]]
		--[[ 		"typescriptreact", ]]
		--[[ 		"json", ]]
		--[[ 		"css", ]]
		--[[ 		"scss", ]]
		--[[ 		"html", ]]
		--[[ 		"vue", ]]
		--[[ 		"php", ]]
		--[[ 	}, ]]
		--[[ }), ]]

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

		formatting.blade_formatter,

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

--
require("lspconfig").tsserver.setup({
	on_attach = function(client, bufnr)
		-- 啟用 null-ls
		require("lspconfig")["null-ls"].setup({})
		-- 選擇 null-ls 作為格式化器
		client.resolved_capabilities.document_formatting = true
		client.resolved_capabilities.document_range_formatting = true
	end,
})
--[[ null_ls.config({ ]]
--[[   sources = { ]]
--[[]]
--[[   } ]]
--[[ }) ]]
