require("mason").setup()
require("mason-lspconfig").setup()

--- auto complete
require("lsp/auto-complete")

require("lspconfig").clangd.setup{}
require("lspconfig").lua_ls.setup{}
require("lspconfig").rust_analyzer.setup{}
require("lspconfig").tsserver.setup{}
require("lspconfig").prismals.setup{}
require("lspconfig").omnisharp.setup{}
require("lspconfig").jedi_language_server.setup{}
require("lspconfig").html.setup{}
require("lspconfig").jdtls.setup{}
require("lspconfig").pyright.setup{}
require("lspconfig").texlab.setup{}
