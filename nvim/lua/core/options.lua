-- Lógica de Ambiente e Tecla Líder
--
vim.g.is_tty = os.getenv("TERM") == "linux"
vim.g.mapleader = " "
vim.o.guifont = "FiraCode Nerd Font:12"

-- Configurações Básicas do Editor
vim.opt.number = true
vim.opt.relativenumber = false
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.mouse = "a"
vim.opt.clipboard = "unnamedplus"

-- Ajustes de Interface e Scroll
vim.opt.scrolloff = 4
vim.opt.signcolumn = "yes"
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Busca Inteligente
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false

-- Performance
vim.opt.signcolumn = "yes"
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

if vim.g.is_tty then
    vim.opt.termguicolors = false
    vim.g.loaded_nvim_web_devicons = 1
else
    vim.opt.termguicolors = true
end
