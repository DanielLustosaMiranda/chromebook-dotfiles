local is_tty = vim.g.is_tty

-- Gerenciador de Plugins (lazy.nvim)
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- Declaração dos Plugins
require("lazy").setup({
    {
        "Mofiqul/vscode.nvim",
        priority = 1000,
        enabled = not is_tty,
        config = function()
            require("vscode").setup({ transparent = false })
            vim.cmd.colorscheme("vscode")
        end,
    },

    { "nvim-tree/nvim-web-devicons", enabled = not is_tty },

    {
        "nvim-tree/nvim-tree.lua",
        config = function()
            require("nvim-tree").setup({
                renderer = {
                    icons = {
                        show = {
                            file = not is_tty,
                            folder = not is_tty,
                        },
                    },
                },
            })
        end,
    },

    {
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
    },

    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            local ok, configs = pcall(require, "nvim-treesitter.configs")
            if not ok then return end

            configs.setup({
                ensure_installed = { "c", "cpp", "lua", "vim", "vimdoc", "query" },
                highlight = { enable = true },
            })
        end,
    },

    { "neovim/nvim-lspconfig" },

    {
        "hrsh7hr/nvim-cmp",
        dependencies = { "hrsh7th/cmp-nvim-lsp" },
    },

    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = true,
    },
})
