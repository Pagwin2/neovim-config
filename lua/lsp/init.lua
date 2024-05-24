require("mason").setup()
require("mason-lspconfig").setup()

--- auto complete
require("lsp/auto-complete")
-- hints
require("lsp/hints")

local lspconfig = require("lspconfig")

lspconfig.clangd.setup{}
lspconfig.dockerls.setup{}
lspconfig.docker_compose_language_service.setup{}
lspconfig.elixirls.setup{}
lspconfig.elp.setup{}
lspconfig.gopls.setup{}
lspconfig.hls.setup{}
lspconfig.html.setup{}
lspconfig.htmx.setup{}
lspconfig.jdtls.setup{}
lspconfig.jedi_language_server.setup{}
lspconfig.julials.setup{}
lspconfig.kotlin_language_server.setup{}
lspconfig.lua_ls.setup{}
lspconfig.ocamllsp.setup{}
lspconfig.omnisharp.setup{}
lspconfig.phpactor.setup{}
lspconfig.pyright.setup{}
lspconfig.r_language_server.setup{}
lspconfig.rust_analyzer.setup{}
lspconfig.texlab.setup{}
lspconfig.tsserver.setup{}
lspconfig.zls.setup{}
