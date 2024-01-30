local overrides = require "custom.configs.overrides"

local plugins = {
  -- {
  --   "tpope/vim-commentary",
  --   lazy = false,
  -- },
  -- {
  --   "mxw/vim-jsx",
  --
  --   lazy = false,
  -- },
  -- {
  --   "suy/vim-context-commentstring",
  --   lazy = false,
  -- },
  {
    "HiPhish/nvim-ts-rainbow2",
    lazy = false,
  },
  {
    "mattn/emmet-vim",
    lazy = false,
  },
  {
    "olrtg/emmet-language-server",
    lazy = false,
  },
  {
    "kevinhwang91/promise-async",
    lazy = false,
  },
  {
    "kevinhwang91/nvim-ufo",
    lazy = false,
    -- require "promise-async",
  },
  {
    "neoclide/coc.nvim",
    lazy = false,
  },
  {
    "aca/emmet-ls",
    lazy = false,
  },
  {
    "neoclide/coc-emmet",
    lazy = false,
  },
  {
    'willothy/moveline.nvim',
    lazy = false,
  },
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
        require("nvim-surround").setup({
            -- Configuration here, or leave empty to use defaults
        })
    end
  },
  {
    "windwp/nvim-ts-autotag",
    lazy = false,
  },
  {
    "mfussenegger/nvim-lint",
    event = "VeryLazy",
    config = function()
      require "custom.configs.lint"
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "mhartington/formatter.nvim",
    event = "VeryLazy",
    opts = function()
      return require "custom.configs.formatter"
    end,
  },
  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "eslint-lsp",
        "js-debug-adapter",
        "prettier",
        "typescript-language-server",
      },
    },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },
  {
   "jackMort/ChatGPT.nvim",
    event = "VeryLazy",
    config = function()
     require("chatgpt").setup {}
    end,
    dependencies = {
       "MunifTanjim/nui.nvim",
       "nvim-lua/plenary.nvim",
       "nvim-telescope/telescope.nvim",
    },
  },
  {
    "nvim-neotest/neotest",
    event = "VeryLazy",
    config = function()
      require("neotest").setup {
        adapters = {
          require "neotest-jest" {
            jestCommand = "npm test",
            -- jestConfigFile = "custom.jest.config.ts",
            env = { CI = true },
            cwd = function(path)
              return vim.fn.getcwd()
            end,
          },
        },
      }
    end,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
      "haydenmeade/neotest-jest",
    },
  },
  {
    "mfussenegger/nvim-dap",
    config = function()
      local ok, dap = pcall(require, "dap")
      if not ok then
        return
      end
      for _, language in ipairs { "typescript", "javascript" } do
        dap.configurations[language] = {
          {
            type = "pwa-node",
            name = "Launch",
            request = "launch",
            program = "${file}",
            cwd = vim.fn.getcwd(),
            sourceMaps = true,
            protocol = "inspector",
          },
        }
      end

        dap.adapters["pwa-node"] = {
        type = "executable",
        command = "node",

-- args = {"/Users/iregent/.local/share/nvim/lazy/vscode-js-debug/out/src/vsDebugServer.js"}

      }

    end,
    dependencies = {
      "microsoft/vscode-js-debug",
      build = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out",
    },
    -- {
    --   "mxsdev/nvim-dap-vscode-js",
    --   config = function()
    --     require("dap-vscode-js").setup {
    --       node_path = "node", -- Path of node executable. Defaults to $NODE_PATH, and then $VIMRUNTIME/lua/vim/lsp.lua
    --       debugger_path = vim.fn.resolve(vim.fn.stdpath("data") .. "/lazy/vscode-js-debug"),
    --       debugger_cmd = { "js-debug-adapter" },
    --       adapters = { "pwa-node", "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost" },
    --       dap_configurations = {
    --         {
    --           type = "pwa-node",
    --         }
    --       }
    --   }
    --   end,
    -- }
  },
  {
    "rcarriga/nvim-dap-ui",
    config = function()
      require("dapui").setup()

      local dap, dapui = require "dap", require "dapui"

      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open {}
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close {}
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close {}
      end
    end,
    dependencies = {
      "mfussenegger/nvim-dap",
    },
  },
  {
    "folke/neodev.nvim",
    config = function()
      require("neodev").setup {
        library = { plugins = { "nvim-dap-ui" }, types = true },
      }
    end,
  },
  { "tpope/vim-fugitive" },
  { "rbong/vim-flog", dependencies = {
    "tpope/vim-fugitive",
  }, lazy = false },
  { "sindrets/diffview.nvim", lazy = false },
  {
    "ggandor/leap.nvim",
    lazy = false,
    config = function()
      require("leap").add_default_mappings(true)
    end,
  },
  {
    "kevinhwang91/nvim-bqf",
    lazy = false,
  },
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    lazy = false,
    config = function()
      require("todo-comments").setup()
    end,
  }, -- To make a plugin not be loaded
  {
    "Exafunction/codeium.vim",
    lazy = false,
  },
  {
    "NvChad/nvim-colorizer.lua",
     enabled = true,
  },
  --
  -- -- All NvChad plugins are lazy-loaded by default
  -- -- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
  -- -- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
  -- -- {
  -- --   "mg979/vim-visual-multi",
  -- --   lazy = false,
  -- -- }
}

return plugins
