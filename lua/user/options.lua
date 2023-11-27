-- vim options
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.relativenumber = true
vim.opt.mouse = ""
--vim.opt.ttymouse = ""
--
vim.opt.shell = "/bin/sh"

-- general
lvim.log.level = "info"
lvim.format_on_save = {
    enabled = true,
    pattern = "*.lua",
    timeout = 1000,
}
-- to disable icons and use a minimalist setup, uncomment the following
-- lvim.use_icons = false

-- keymappings <https://www.lunarvim.org/docs/configuration/keybindings>
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.normal_mode["<S-Right>"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<S-Left>"] = ":BufferLineCyclePrev<CR>"
lvim.keys.normal_mode["<Right>"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<Left>"] = ":BufferLineCyclePrev<CR>"

-- -- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["W"] = { "<cmd>noautocmd w<cr>", "Save without formatting" }
lvim.builtin.which_key.mappings["a"] = { ":Alpha<cr>", " Dashboard" }

lvim.builtin.which_key.mappings["E"] = {
    name = "Environment",
    p = { "<cmd>lua require('swenv.api').pick_venv()<cr>", "Choose Python Env" },
}

-- iREPL Mappings
lvim.builtin.which_key.mappings["i"] = {
    name = "IronRepl",
    p = { ":IronRepl<CR>", "iREPL" },
    r = { ":IronRestart<CR>", "iREPL Restart" },
    f = { ":IronFocus<CR>", "iREPL Focus" },
    h = { ":IronHide<CR>", "iREPL Hide" },
    -- exit
    q = { "<cmd>lua require('iron.core').close_repl()<cr>", "iREPL quit" },
    -- clear
    c = { "<cmd>lua require('iron.core').send(nil, string.char(12))<cr>", "iREPL clear" },
    -- interrupt
    ["<space>"] = {
        "<cmd>lua require('iron.core').send(nil, string.char(03))<cr>", "iREPL interrupt"
    }
}
lvim.builtin.which_key.mappings["i"]["s"] = {
    name = "Send to iREPL",
    f = { "<cmd>lua require('iron.core').send_file()<cr>", "File" },
    l = { "<cmd>lua require('iron.core').send_line()<cr>", "Line" },
    u = { "<cmd>lua require('iron.core').send_until_cursor()<cr>", "Until cursor" },
    r = { "<cmd>lua require('iron.core').send_mark()<cr>", "Mark" },
    -- send_motion
    c = { "<cmd>lua require('iron.core').run_motion('send_motion')<cr>", "Motion" },
}
lvim.builtin.which_key.mappings["i"]["m"] = {
    name = "Marks <-> iREPL",
    -- mark_motion
    c = { "<cmd>lua require('iron.core').run_motion('mark_motion')<cr>", "Motion" },
    -- remove_mark = "<leader>imd",
    d = { "<cmd>lua require('iron.marks').drop_last()<cr>", "Remove" },
}
lvim.builtin.which_key.vmappings["i"] = {
    name = "IronRepl",
    s = { "<cmd>lua require('iron.core').visual_send()<cr>", "Send Selection" },
    m = { "<cmd>lua require('iron.core').mark_visual()<cr>", "Mark Selection" },
}
-- Harpoon which keys
lvim.builtin.which_key.mappings["m"] = {
    name = "Harpoon",
    m = { ":lua require('harpoon.mark').add_file()<cr>", "Mark file" },
    t = { ":lua require('harpoon.ui').toggle_quick_menu()<cr>", "Toggle UI" },
    a = { ":lua require('harpoon.ui').nav_file(1)<cr>", "Goto mark 1" },
    s = { ":lua require('harpoon.ui').nav_file(2)<cr>", "Goto mark 2" },
    d = { ":lua require('harpoon.ui').nav_file(3)<cr>", "Goto mark 3" },
    f = { ":lua require('harpoon.ui').nav_file(4)<cr>", "Goto mark 4" },
    g = { ":lua require('harpoon.ui').nav_file(5)<cr>", "Goto mark 5" },
    q = { ":lua require('harpoon.ui').nav_file(6)<cr>", "Goto mark 6" },
    w = { ":lua require('harpoon.ui').nav_file(7)<cr>", "Goto mark 7" },
    e = { ":lua require('harpoon.ui').nav_file(8)<cr>", "Goto mark 8" },
    r = { ":lua require('harpoon.ui').nav_file(9)<cr>", "Goto mark 9" },
    n = { ":lua require('harpoon.ui').nav_next()<cr>", "Next file" },
    p = { ":lua require('harpoon.ui').nav_prev()<cr>", "Prev file" },
}
-- Persistence sessions
lvim.builtin.which_key.mappings["S"] = {
    name = " persistence.nvim",
    s = { "<cmd>lua require('persistence').load()<cr>", " Reload last session for dir" },
    l = { "<cmd>lua require('persistence').load({ last = true })<cr>", " Restore last session" },
    Q = { "<cmd>lua require('persistence').stop()<cr>", " Quit without saving session" },
}
-- Telescope
lvim.builtin.which_key.mappings["t"] = {
    name = "Telescope",
    p = { "<cmd>Telescope projects<CR>", "Projects" },
    r = { ':Telescope resume<cr>', 'Resume' },
    f = { ':Telescope frecency<cr>', 'Frecency' },
}
-- -- Change theme settings
-- lvim.colorscheme = "lunar"

lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
-- Treesitter configuration
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false

-- Automatically install missing parsers when entering buffer
lvim.builtin.treesitter.auto_install = true
lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.ensure_installed = {
    "python",
    "latex",
    "c",
    "cpp",
    "python",
}

-- Project Settings
lvim.builtin.project.detection_methods = { "lsp", "pattern" }
lvim.builtin.project.patterns = {
    ".git",
    "package-lock.json",
    "yarn.lock",
    "package.json",
    "requirements.txt",
    "CMakeLists.txt",
}

-- generic LSP settings <https://www.lunarvim.org/docs/languages#lsp-support>

-- --- disable automatic installation of servers
-- lvim.lsp.installer.setup.automatic_installation = false

-- ---configure a server manually. IMPORTANT: Requires `:LvimCacheReset` to take effect
-- ---see the full default list `:lua =lvim.lsp.automatic_configuration.skipped_servers`
vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "clangd" })

-- Setting options for LSP Servers
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pyright", opts)
--
-- For clangd
-- https://github.com/LunarVim/LunarVim/issues/2597#issuecomment-1254764973
local capabilities = require("lvim.lsp").common_capabilities()
capabilities.offsetEncoding = { "utf-16" }
local opts = { capabilities = capabilities }
require("lvim.lsp.manager").setup("clangd", opts)


-- ---remove a server from the skipped list, e.g. eslint, or emmet_ls. IMPORTANT: Requires `:LvimCacheReset` to take effect
-- ---`:LvimInfo` lists which server(s) are skipped for the current filetype
-- lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
--   return server ~= "emmet_ls"
-- end, lvim.lsp.automatic_configuration.skipped_servers)

-- -- you can set a custom on_attach function that will be used for all the language servers
-- -- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end
--

-- -- linters and formatters <https://www.lunarvim.org/docs/languages#lintingformatting>
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
    { name = "black" },
    { name = "clang_format" },
    --   { command = "stylua" },
    --   {
    --     command = "prettier",
    --     extra_args = { "--print-width", "100" },
    --     filetypes = { "typescript", "typescriptreact" },
    --   },
}
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
    { command = "flake8",     args = { "--ignore=E203" },         filetypes = { "python" } },
    { command = "shellcheck", args = { "--severity", "warning" }, },
    {
        command = "cpplint",
        args = { "--filter=-legal/copyright" },
    },
}

-- -- Additional Plugins <https://www.lunarvim.org/docs/plugins#user-plugins>
lvim.plugins = {
    -- Python virtual environment
    {
        "AckslD/swenv.nvim",
        config = function()
            -- Pick the virual environment
            require('swenv').setup({
                post_set_venv = function()
                    vim.cmd("LspRestart")
                end,
            })
        end
    },
    "stevearc/dressing.nvim",
    -- Vim tmux : TODO: update
    {
        "christoomey/vim-tmux-navigator",
        lazy = false,
    },
    -- Surround with braces
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
    -- REPL using iron.nvim
    {
        "Vigemus/iron.nvim",
        lazy = false,
        config = function()
            require("iron.core").setup({
                config = {
                    -- Whether a repl should be discarded or not
                    scratch_repl = true,
                    -- Your repl definitions come here
                    repl_definition = {
                        sh = {
                            -- Can be a table or a function that
                            -- returns a table (see below)
                            command = { "bash" }
                        }
                    },
                    -- How the repl window will be displayed
                    -- See below for more information
                    repl_open_cmd = require('iron.view').split.vertical.botright(0.4),
                },
                -- If the highlight is on, you can change how it looks
                -- For the available options, check nvim_set_hl
                highlight = {
                    italic = true
                },
                ignore_blank_lines = true, -- ignore blank lines when sending visual select lines
            })
        end
    },
    -- Vimtex
    -- https://github.com/lervag/vimtex/issues/2698#issuecomment-1531011148
    -- https://github.com/LunarVim/LunarVim/issues/3723#issuecomment-1533041636
    {
        "lervag/vimtex",
        ft = 'tex',
        lazy = false,
        config = function()
            vim.g.tex_flavor = 'latex'
            vim.g.conceallevel = 1
            vim.g.vimtex_quickfix_mode = 0
            vim.g.tex_conceal = 'abdmg'
        end
    },
    -- latex snippets for math and other
    {
        "iurimateus/luasnip-latex-snippets.nvim",
        dependencies = {
            "L3MON4D3/LuaSnip",
            "lervag/vimtex"
        },
        config = function()
            -- require 'luasnip-latex-snippets'.setup()
            require('luasnip-latex-snippets').setup({
                use_treesitter = true
            })
            require("luasnip").config.setup({
                enable_autosnippets = true
            })
        end,
    },
    -- "sirver/ultisnips",
    --    {
    --       "nvim-tree/nvim-tree.lua",
    --    },
    -- {
    --     "folke/trouble.nvim",
    --     dependencies = { "nvim-tree/nvim-web-devicons" },
    --     cmd = "TroubleToggle",
    -- },
    -- Persistent Sessions
    {
        "folke/persistence.nvim",
        event = "BufReadPre",
        config = function()
            require("persistence").setup({
                dir = vim.fn.expand(vim.fn.stdpath "state" .. "/sessions/"),
                options = { "buffers", "curdir", "tabpages", "winsize" }
            })
        end
    },
    -- Harpoon for going back and forth
    { "ThePrimeagen/harpoon" },
    -- Telescope frequency
    {
        'nvim-telescope/telescope-frecency.nvim',
        dependencies = { 'nvim-telescope/telescope.nvim',
            'kkharji/sqlite.lua' },
        config = function()
            require("telescope").load_extension "frecency"
        end,
    },
}

-- -- Autocommands (`:help autocmd`) <https://neovim.io/doc/user/autocmd.html>
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "zsh",
--   callback = function()
--     -- let treesitter use bash highlight for zsh files as well
--     require("nvim-treesitter.highlight").attach(0, "bash")
--   end,
-- })
--
--

vim.opt.wrap = true

if vim.g.neovide then
    vim.o.guifont = "Iosevka Nerd Font:h13"
end
