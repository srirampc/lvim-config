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
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
lvim.builtin.which_key.mappings["C"] = {
    name = "Python",
    c = { "<cmd>lua require('swenv.api').pick_venv()<cr>", "Choose Env" },
}


-- -- Change theme settings
-- lvim.colorscheme = "lunar"

lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false

-- Automatically install missing parsers when entering buffer
lvim.builtin.treesitter.auto_install = true

-- lvim.builtin.treesitter.ignore_install = { "haskell" }

lvim.builtin.treesitter.ensure_installed = {
    "python",
    "latex",
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
    {
        "christoomey/vim-tmux-navigator",
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
    {
        "folke/trouble.nvim",
        cmd = "TroubleToggle",
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
