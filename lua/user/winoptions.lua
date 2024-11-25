--+++++++++++++++++++++++++-
--++++* vim options *+++++-
--+++++++++++++++++++++++++-
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.relativenumber = true
vim.opt.colorcolumn = "80"
-- Enable powershell as your default shell
vim.opt.shell = "pwsh.exe -NoLogo"
vim.opt.shellcmdflag =
"-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;"
vim.cmd [[
		let &shellredir = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
		let &shellpipe = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
		set shellquote= shellxquote=
  ]]
-- Set a compatible clipboard manager
vim.g.clipboard = {
    copy = {
        ["+"] = "win32yank.exe -i --crlf",
        ["*"] = "win32yank.exe -i --crlf",
    },
    paste = {
        ["+"] = "win32yank.exe -o --lf",
        ["*"] = "win32yank.exe -o --lf",
    },
}

--+++++++++++++++++++++++++-
--++++*    General   *+++++-
--+++++++++++++++++++++++++-
lvim.log.level = "info"
lvim.format_on_save = {
    enabled = true,
    pattern = "*.lua",
    timeout = 1000,
}
-- to disable icons and use a minimalist setup, uncomment the following
-- lvim.use_icons = false
-- Theme settings
-- lvim.colorscheme = "lunar"
lvim.colorscheme = "catppuccin-mocha"
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true


--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-
--++++*    keymappings and which-key bindings                      *+++++-
--++++* <https://www.lunarvim.org/docs/configuration/keybindings>  *+++++-
--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.normal_mode["<S-Right>"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<S-Left>"] = ":BufferLineCyclePrev<CR>"
lvim.keys.normal_mode["<Right>"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<Left>"] = ":BufferLineCyclePrev<CR>"

-- -- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["W"] = { "<cmd>noautocmd w<cr>", "Save without formatting" }
lvim.builtin.which_key.mappings["a"] = { ":Alpha<cr>", "Dashboard" }
lvim.builtin.which_key.mappings[";"] = {}
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
    name = "persistence.nvim",
    s = { "<cmd>lua require('persistence').load()<cr>", " Reload last session for dir" },
    l = { "<cmd>lua require('persistence').load({ last = true })<cr>", " Restore last session" },
    Q = { "<cmd>lua require('persistence').stop()<cr>", " Quit without saving session" },
}
-- Telescope
lvim.builtin.which_key.mappings["t"] = {
    name = "Telescope",
    p = { "<cmd>Telescope projects<CR>", "Projects" },
    r = { ':Telescope resume<cr>', 'Resume' },
}

--+++++++++++++++++++++++++++++++++-
--++++* Treesitter settings  *+++++-
--+++++++++++++++++++++++++++++++++-
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false
-- Automatically install missing parsers when entering buffer
lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.ensure_installed = {
    "python",
    "latex",
    "c",
    "cpp",
}

--++++++++++++++++++++++++++++++-
--++++* Project settings  *+++++-
--++++++++++++++++++++++++++++++-
lvim.builtin.project.detection_methods = { "lsp", "pattern" }
lvim.builtin.project.patterns = {
    ".git",
    "package-lock.json",
    "yarn.lock",
    "package.json",
    "requirements.txt",
    "CMakeLists.txt",
}


--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-
--+* LSP settings <https://www.lunarvim.org/docs/languages#lsp-support> *+-
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-

-- --- disable automatic installation of servers
-- lvim.lsp.installer.setup.automatic_installation = false

-- ---configure a server manually. IMPORTANT: Requires `:LvimCacheReset` to take effect
-- ---see the full default list `:lua =lvim.lsp.automatic_configuration.skipped_servers`
-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pyright", opts)

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

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-
--++++* linters and formatters                                      *+++++-
--++++* <https://www.lunarvim.org/docs/languages#lintingformatting> *+++++-
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-
-- local formatters = require "lvim.lsp.null-ls.formatters"
-- formatters.setup {
--   { command = "stylua" },
--   {
--     command = "prettier",
--     extra_args = { "--print-width", "100" },
--     filetypes = { "typescript", "typescriptreact" },
--   },
-- }
-- local linters = require "lvim.lsp.null-ls.linters"
-- linters.setup {
--   { command = "flake8", filetypes = { "python" } },
--   {
--     command = "shellcheck",
--     args = { "--severity", "warning" },
--   },
-- }

--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-
--++++* Additional Plugins                                   *+++++-
--++++* <https://www.lunarvim.org/docs/plugins#user-plugins> *+++++-
--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-
lvim.plugins = {
    -- dressing.nvim : User Interface replacement input and selection
    "stevearc/dressing.nvim",
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
    {
        'kaarmu/typst.vim',
        ft = 'typst',
        lazy = false,
    },
    -- "sirver/ultisnips",
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
    --++++++++++++++++++++++++--
    --+*****    Themes   ****+--
    --++++++++++++++++++++++++--
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000
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
    vim.o.guifont = "Iosevka Nerd Font:h12"
end
