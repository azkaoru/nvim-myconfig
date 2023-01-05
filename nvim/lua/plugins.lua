return require('packer').startup(function(use)
 -- Configurations will go here
 use 'wbthomason/packer.nvim'
 use 'williamboman/mason.nvim'
 use 'williamboman/mason-lspconfig.nvim'
 use 'neovim/nvim-lspconfig'
 -- Hrsh7th Code Completion Suite
     use 'hrsh7th/nvim-cmp' 
     use 'hrsh7th/cmp-nvim-lsp'
     use 'hrsh7th/cmp-nvim-lua'
     use 'hrsh7th/cmp-nvim-lsp-signature-help'
     use 'hrsh7th/cmp-vsnip'                             
     use 'hrsh7th/cmp-path'                              
     use 'hrsh7th/cmp-buffer'                            
     use 'hrsh7th/vim-vsnip'
 -- File explorer tree
     use 'nvim-tree/nvim-web-devicons' -- optional, for file icons
 use 'nvim-tree/nvim-tree.lua'
 -- DAP for debugging
 use 'mfussenegger/nvim-dap'
 -- UI for DAP
 use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }

 -- Dracula theme for styling
 use 'Mofiqul/dracula.nvim'

  -- Treesitter
 use {
  -- recommended packer way of installing it is to run this function, copied from documentation
         'nvim-treesitter/nvim-treesitter',
      run = function()
              local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
              ts_update()
         end,

  }

-- Telescope used to fuzzy search files
 use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    requires = { {'nvim-lua/plenary.nvim'} }
 }
-- User interface
 use {
      "stevearc/dressing.nvim",
      event = "BufEnter",
      config = function()
        require("dressing").setup {
          select = {
            backend = { "telescope", "fzf", "builtin" },
          },
        }
      end,
 }
 use {
	'akinsho/bufferline.nvim', tag = "v3.*", 
         requires = {{ 'nvim-tree/nvim-web-devicons'} }
 }

 use {
	"thinca/vim-quickrun",
	requires = { { "lambdalisue/vim-quickrun-neovim-job" } },
	setup = function()
		vim.g.quickrun_config = {
			["_"] = {
				["runner"] = "neovim_job",
				["outputter/buffer/opener"] = "new",
				["outputter/buffer/close_on_empty"] = 1,
			},
			["docgen"] = {
				["command"] = "asciidoctor",
				["exec"] = "%c %s",
			},
			["docview"] = {
				["command"] = "xdg-open",
				["exec"] = "%c %S:t:r.html",
			},
			["rust"] = {
				["exec"] = "cargo run",
			},
		}

			vim.keymap.set("n", "<leader>r", "<Nop>")
			vim.keymap.set("n", "<leader>rr", ":QuickRun<CR>", { silent = true })
		end,
  }

  use {
  "lalitmee/browse.nvim",
  requires = {{ "nvim-telescope/telescope.nvim" }},
  setup = function()
		vim.keymap.set("n", "<leader>b", function()
  			require("browse").browse({ bookmarks = bookmarks })
		end)
          end,
  }

end)

