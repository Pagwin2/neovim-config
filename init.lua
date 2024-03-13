---- just lazy.nvim installation
require("bootstrap")

---- base vim config preferences
vim.opt.nu = true
vim.opt.rnu = true
vim.opt.wrap = true

vim.opt.shiftwidth = 4
vim.opt.smarttab = true
vim.tabstop = 8
vim.softtabstop = 0
vim.opt.expandtab = true;

vim.opt.mouse = ""
--- backup file prefs
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

---- plugin management
require("lazy").setup(require("plugins"))

---- Hotkeys
require("hotkeys")

---- set colorscheme
vim.cmd("colorscheme gruvbox")

---- LSP stuff setup
require("lsp")

---- Treesitter setup
require("plugins/treesitter")
