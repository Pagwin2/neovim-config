require("bootstrap")

---- base vim variable preferences
vim.opt.nu = true
vim.opt.rnu = true
vim.opt.wrap = true
vim.opt.shiftwidth = 4
vim.opt.mouse = ""

---- plugin management
require("lazy").setup(require("plugins"))

---- Hotkeys
require("hotkeys")

---- set colorscheme
vim.cmd("colorscheme gruvbox")

---- LSP stuff setup
require("lsp")
