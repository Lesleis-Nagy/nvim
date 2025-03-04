-- Set up vim plug
local Plug = vim.fn['plug#']

vim.call('plug#begin')

    -- Dracula theme
    Plug('dracula/vim')

    -- Gruvbox theme
    Plug('ellisonleao/gruvbox.nvim')

    -- Tokyo themes
    Plug('folke/tokyonight.nvim')

    -- Aura
    Plug('daltonmenezes/aura-theme')

    -- Night fox
    Plug('EdenEast/nightfox.nvim')

    -- Moonfly
    Plug('bluz71/vim-moonfly-colors', { ['as'] = 'moonfly' })

    -- Devicon support for nerdtree
    Plug('ryanoasis/vim-devicons')

    -- Directory navigator
    Plug('scrooloose/nerdtree')

    -- Easy way to comment outlines
    Plug('preservim/nerdcommenter')

    -- Handy start page with lots of customizations
    Plug('mhinz/vim-startify')

    -- Prerequisite for some useful packages
    Plug('nvim-lua/plenary.nvim')

    -- Interface for the parser generator tool 'tree-sitter'
    Plug('nvim-treesitter/nvim-treesitter', { ['do'] = vim.fn[':TSUpdate'] })

    -- An extendable fuzzy finder
    Plug('nvim-telescope/telescope.nvim', { ['tag'] = '0.1.8' })

    -- Lualine (airline implementation in lua)
    Plug('nvim-lualine/lualine.nvim')

    -- Lualine icons
    Plug('nvim-tree/nvim-web-devicons')

    -- Toggleterm allows terminals in editor
    Plug('akinsho/toggleterm.nvim', { ['tag']  = '*' })

    -- Conform formatter
    Plug('stevearc/conform.nvim')

    -- Mason
    Plug('williamboman/mason.nvim')

    -- Mason LSP config
    Plug('williamboman/mason-lspconfig.nvim')

    -- LSP config
    Plug('neovim/nvim-lspconfig')

vim.call('plug#end')

--- --------------------------------------------------------------------- ---
--- General                                                               ---
--- --------------------------------------------------------------------- ---

-- Enable mouse support
vim.opt.mouse = 'a'

-- Copy/paste to system keyboard
vim.opt.clipboard = 'unnamedplus'

-- Don't use swapfile
vim.opt.swapfile = false

--- --------------------------------------------------------------------- ---
--- User interface                                                        ---
--- --------------------------------------------------------------------- ---

-- Show line numbers
vim.opt.number = true

-- Highlight matching parenthesis
vim.opt.showmatch = true

-- Line length marker
vim.opt.colorcolumn = '100'

-- Text width
vim.o.textwidth = 100

-- Ignore case letters in search
vim.opt.ignorecase = true

-- Ignore lower case for whole pattern
vim.opt.smartcase = true

-- Wrap on word boundary
vim.opt.linebreak = true

-- set the cursor line
vim.opt.cursorline = true

-- color scheme
vim.opt.background = "dark"

vim.cmd([[colorscheme gruvbox]])

--- --------------------------------------------------------------------- ---
--- Tabs and indentation                                                  ---
--- --------------------------------------------------------------------- ---

-- Use spaces instead of tabs
vim.opt.expandtab = true

-- Shift 4 spaces when tabbing
vim.opt.shiftwidth = 2

-- Use 4 spaces for a tab
vim.opt.tabstop = 2

-- Autoindent new lines
vim.opt.smartindent = true

--- --------------------------------------------------------------------- ---
--- Fonts                                                                 ---
--- --------------------------------------------------------------------- ---

vim.o.guifont = "MesloLGMDZ Nerd Font Mono:h16"

--- --------------------------------------------------------------------- ---
--- Treesitter (syntax)                                                   ---
--- --------------------------------------------------------------------- ---

require('nvim-treesitter.configs').setup {
  -- A list of parser names, or "all" (the listed parsers MUST always be 
  -- installed)
  ensure_installed = { 
      "c", 
      "cpp", 
      "fortran", 
      "lua", 
      "vim", 
      "vimdoc", 
      "query", 
      "markdown", 
      "markdown_inline" 
  },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer Recommendation:
  -- set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  highlight = {
    enable = true,
    -- Setting this to true will run `:h syntax` and tree-sitter at the same
    -- time. Set this to `true` if you depend on 'syntax' being enabled (like
    -- for indentation). Using this option may slow down your editor, and you
    -- may see some duplicate highlights. Instead of true it can also be a list
    -- of languages
    additional_vim_regex_highlighting = false,
  },

}

--- --------------------------------------------------------------------- ---
--- Lualine                                                               ---
--- --------------------------------------------------------------------- ---

require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'dracula',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    always_show_tabline = true,
    globalstatus = false,
    refresh = {
      statusline = 100,
      tabline = 100,
      winbar = 100,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}

--- --------------------------------------------------------------------- ---
--- Toggleterm                                                            ---
--- --------------------------------------------------------------------- ---

require("toggleterm").setup {
    -- Size can be a number/function which is passed to current terminal
    size = 20,
    open_mapping = [[<c-\>]]
}

--- --------------------------------------------------------------------- ---
--- Telescope                                                             ---
--- --------------------------------------------------------------------- ---


--- NOTE: Make sure you have 'ripgrep' installed on the command line
---       see: https://github.com/BurntSushi/ripgrep

require('telescope').setup{
  defaults = {
    -- you can customize default settings here
  }
}

-- Optional: Create keybindings for common pickers
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

--- --------------------------------------------------------------------- ---
--- mason                                                                 ---
--- --------------------------------------------------------------------- ---

-- require("mason").setup()

--- --------------------------------------------------------------------- ---
--- mason                                                                 ---
--- --------------------------------------------------------------------- ---

-- require("mason-lspconfig").setup {
--   ensure_installed = {
--     "clangd",
--   },
-- }
-- 
-- require("lspconfig").clangd.setup {
--     cmd = { 
--       "clangd",
--       "--compile-commands-dir=build",
--       "--query-driver=" .. os.getenv("EMSDK") .. "/upstream/bin/clang",
--     },
--     on_attach = function(client, bufnr)
--         print("clangd attached to buffer", bufnr)
--     end
-- }
-- 
-- vim.api.nvim_set_keymap(
--   "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", { noremap = true, silent = true })

