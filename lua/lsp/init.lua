require("mason").setup()
require("mason-lspconfig").setup()

--- auto complete
require("lsp/auto-complete")

local lspconfig = require("lspconfig")

lspconfig.clangd.setup{}
lspconfig.lua_ls.setup{}
lspconfig.rust_analyzer.setup{}
lspconfig.tsserver.setup{}
lspconfig.prismals.setup{}
lspconfig.omnisharp.setup{}
lspconfig.jedi_language_server.setup{}
lspconfig.html.setup{}
lspconfig.jdtls.setup{}
lspconfig.pyright.setup{}
lspconfig.texlab.setup{}
lspconfig.gopls.setup{}
lspconfig.dockerls.setup{}
lspconfig.docker_compose_language_service.setup{}
