return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  -- test new blink
  -- { import = "nvchad.blink.lazyspec" },

  -- {
  -- 	"nvim-treesitter/nvim-treesitter",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"vim", "lua", "vimdoc",
  --      "html", "css"
  -- 		},
  -- 	},
  -- },
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
    init = function()
      -- Prevent vim-tmux-navigator from setting its own keybindings (must be before plugin loads)
      vim.g.tmux_navigator_no_mappings = 1
    end,
    config = function()
      -- Set custom mappings that check if we're in Claude Code
      vim.keymap.set("n", "<c-h>", function()
        local bufname = vim.fn.bufname("%")
        if not bufname:match(":claude") then
          vim.cmd("TmuxNavigateLeft")
        end
      end, { noremap = true, silent = true })

      vim.keymap.set("n", "<c-j>", function()
        local bufname = vim.fn.bufname("%")
        if not bufname:match(":claude") then
          vim.cmd("TmuxNavigateDown")
        end
      end, { noremap = true, silent = true })

      vim.keymap.set("n", "<c-k>", function()
        local bufname = vim.fn.bufname("%")
        if not bufname:match(":claude") then
          vim.cmd("TmuxNavigateUp")
        end
      end, { noremap = true, silent = true })

      vim.keymap.set("n", "<c-l>", function()
        local bufname = vim.fn.bufname("%")
        if not bufname:match(":claude") then
          vim.cmd("TmuxNavigateRight")
        end
      end, { noremap = true, silent = true })

      vim.keymap.set("n", "<c-\\>", function()
        local bufname = vim.fn.bufname("%")
        if not bufname:match(":claude") then
          vim.cmd("TmuxNavigatePrevious")
        end
      end, { noremap = true, silent = true })
    end,
  },
  {
    "coder/claudecode.nvim",
    dependencies = { "folke/snacks.nvim" },
    opts = {
      focus_after_send = true,
      -- Diff Integration
      diff_opts = {
        layout = "vertical",
        open_in_new_tab = true,
        keep_terminal_focus = true, -- If true, moves focus back to terminal after diff opens
      },
    },
    config = true,
    keys = {
      { "<leader>cc", "<cmd>ClaudeCode<cr>", desc = "Toggle Claude" },
      { "<leader>cf", "<cmd>ClaudeCodeFocus<cr>", desc = "Focus Claude" },
      { "<leader>cs", "<cmd>ClaudeCodeAdd %<cr>", mode = "n", desc = "Add current buffer" },
      { "<leader>cs", "<cmd>ClaudeCodeSend<cr>", mode = "v", desc = "Send to Claude" },
      {
        "<leader>cs",
        "<cmd>ClaudeCodeTreeAdd<cr>",
        desc = "Add file",
        ft = { "NvimTree", "neo-tree", "oil", "minifiles" },
      },
    },
  },
}
