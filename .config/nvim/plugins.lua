local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', 
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  { "folke/lazy.nvim", tag = "stable" },
  { "williamboman/mason.nvim", config = function() require("mason").setup() end },
  { "williamboman/mason-lspconfig.nvim", config = function() require("mason-lspconfig").setup() end },
  { "neovim/nvim-lspconfig", dependencies = { 'nvim-lua/plenary.nvim', 'j-hui/fidget.nvim', 'folke/neodev.nvim' }},
  { "tamago324/nlsp-settings.nvim" },
  { "rebelot/kanagawa.nvim" },
  { 'kosayoda/nvim-lightbulb' },
  { "nvimtools/none-ls.nvim" },
  { "folke/neodev.nvim" },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
      'hrsh7th/cmp-nvim-lsp',
      'rafamadriz/friendly-snippets',
    },
    config = function()
      local cmp = require'cmp'
      cmp.setup({
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-n>'] = cmp.mapping.select_next_item(),
          ['<C-p>'] = cmp.mapping.select_prev_item(),
          ['<C-d>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
        }),
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
        }, {
          { name = 'buffer' },
        })
      })
    end,
  },
  { "hrsh7th/cmp-nvim-lsp" },
  { "saadparwaiz1/cmp_luasnip" },
  { "nvim-tree/nvim-tree.lua", dependencies = "nvim-tree/nvim-web-devicons", config = function() require("nvim-tree").setup() end },
  { "rafamadriz/friendly-snippets" },
  {
    "L3MON4D3/LuaSnip",
    config = function()
      require('luasnip.loaders.from_vscode').lazy_load()
    end,
  },
  { 'folke/which-key.nvim', config = function() require('which-key').setup {} end },
  { 'lewis6991/gitsigns.nvim', config = function() require('gitsigns').setup {} end },
  {
    'akinsho/bufferline.nvim',
    tag = "v2.*",
    requires = 'kyazdani42/nvim-web-devicons',
    config = function()
      require('bufferline').setup{
        options = {
          numbers = "ordinal",
          close_command = "bdelete! %d",
          right_mouse_command = "bdelete! %d",
          left_trunc_marker = '',
          right_trunc_marker = '',
          max_name_length = 18,
          max_prefix_length = 15,
          tab_size = 18,
          diagnostics = "nvim_lsp",
          diagnostics_update_in_insert = false,
          offsets = {{filetype = "NvimTree", text = "File Explorer"}},
          show_buffer_icons = true,
          show_buffer_close_icons = false,
          show_close_icon = false,
          show_tab_indicators = true,
          persist_buffer_sort = true,
          separator_style = "thin",
          enforce_regular_tabs = false,
          always_show_bufferline = true,
          sort_by = 'insert_after_current',
        }
      }
    end
  },
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
      },
    },
    config = function()
      require('telescope').setup{}
    end
  },
  {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function()
      require('nvim-treesitter.configs').setup {
        ensure_installed = "all",
        sync_install = false,
        auto_install = true,
        ignore_install = {},
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "gnn",
            node_incremental = "grn",
            scope_incremental = "grc",
            node_decremental = "grm",
          },
        },
        indent = {
          enable = true
        },
      }
    end
  },
  { 'tpope/vim-dadbod' },
  { 'kristijanhusak/vim-dadbod-ui' },
  { 'MaxMEllon/vim-jsx-pretty' },
  { 'tpope/vim-fugitive' },
	{
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup {
            padding = true,
            sticky = true,
            toggler = {
                line = 'gcc',
                block = 'gbc',
            },
            opleader = {
                line = 'gc',
                block = 'gb',
            },
            extra = {
                above = 'gcO',
                below = 'gco',
                eol = 'gcA',
            },
            mappings = {
                basic = true,
                extra = true,
                extended = false,
            },
            pre_hook = nil,
            post_hook = nil,
        }
    end,
},
  {'mfussenegger/nvim-dap'},
  { 'hrsh7th/vim-vsnip' },
  { 'windwp/nvim-autopairs', config = function() require('nvim-autopairs').setup{} end },
  { 'jose-elias-alvarez/nvim-lsp-ts-utils', config = function()
      require('lspconfig').tsserver.setup {
        on_attach = function(client, bufnr)
          local ts_utils = require("nvim-lsp-ts-utils")
          ts_utils.setup {}
          ts_utils.setup_client(client)
        end,
      }
    end
  },
  { 'lighttiger2505/sqls', config = function() require('lspconfig').sqlls.setup{} end },
})

require('kanagawa').setup({ theme="dragon", transparent="true" })
vim.cmd("colorscheme kanagawa-dragon")
require('nvim-autopairs').setup{}

