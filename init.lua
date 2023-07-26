---- lazy.nvim bootstrap
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

---- base vim variable preferences
vim.opt.nu = true
vim.opt.rnu = true
vim.opt.wrap = true
vim.opt.shiftwidth = 4
vim.opt.mouse = ""

---- plugins
local plugins = {
    --theme 
    "morhetz/gruvbox",
    --snippets stuff
    "SirVer/ultisnips",
    "git@github.com:Pagwin-Fedora/vim-snippets.git",
    --for sudowrite
    "tpope/vim-eunuch",
    --lsp management
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
    -- auto complete
    "quangnguyen30192/cmp-nvim-ultisnips",
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/nvim-cmp',
    -- prisma syntax highlighting
    "prisma/vim-prisma"
}
-- list of potential plugins to use in the future
-- 'codota/tabnine-vim'
-- 'nvim-treesitter/nvim-treesitter'
require("lazy").setup(plugins)

---- Hotkeys
--vim.api.nvim_set_keymap(mode, keys, mapping, options)
vim.api.nvim_set_keymap("n","Y","y$",{})

---- set colorscheme
vim.cmd("colorscheme gruvbox")

---- LSP stuff setup
require("mason").setup()
require("mason-lspconfig").setup()

--- convenience hotkeys for diagnostics
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)

--- auto complete
local cmp = require("cmp")
  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },
    window = {
       completion = cmp.config.window.bordered(),
       documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      --['<C-b>'] = cmp.mapping.scroll_docs(-4),
      --['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<Tab>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
       { name = 'ultisnips' }, -- For ultisnips users.
    }, {
      { name = 'buffer' },
    })
  })

  -- Set configuration for specific filetype.
  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'git' }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
    }, {
      { name = 'buffer' },
    })
  })

  --- below is some stuff that will do auto complete for the cmd prompt vim has if you want it which I don't atm
  --
  -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
  --cmp.setup.cmdline({ '/', '?' }, {
  --  mapping = cmp.mapping.preset.cmdline(),
  --  sources = {
  --    { name = 'buffer' }
  --  }
  --})

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  --cmp.setup.cmdline(':', {
  --  mapping = cmp.mapping.preset.cmdline(),
  --  sources = cmp.config.sources({
  --    { name = 'path' }
  --  }, {
  --    { name = 'cmdline' }
  --  })
  --})

  -- Set up lspconfig.
  local capabilities = require('cmp_nvim_lsp').default_capabilities()


require("lspconfig").clangd.setup{}
require("lspconfig").lua_ls.setup{}
require("lspconfig").rust_analyzer.setup{}
require("lspconfig").tsserver.setup{}
require("lspconfig").prismals.setup{}
