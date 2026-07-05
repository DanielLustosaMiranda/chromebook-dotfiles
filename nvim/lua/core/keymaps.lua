local key = vim.keymap.set

key("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "Explorador" })
key("n", "<leader>ff", ":Telescope find_files<CR>", { desc = "Buscar Arquivos" })
key("n", "K", vim.lsp.buf.hover, { desc = "Manual da Função" })
key("n", "<leader>d", vim.diagnostic.open_float, { desc = "Ver Erro" })
key("n", "<leader>fm", function()
    vim.lsp.buf.format({ async = true })
end, { desc = "Formatar" })

-- Sair
key('n', '<leader>wq', ':wq<CR>', {desc = 'Salvar e Sair'})
key("n", "<leader>w", ":w<CR>", { desc = "Salvar" })
key('n', '<leader>q', ':q<CR>', {desc = 'Sair'})
key('n', '<leader>qn', ':q!<CR>', {desc = 'Sair sem salvar'})

key('i', '<C-k>', '<ESC>',  {desc = 'Sair Insert'})

-- Cmake
key('n', '<leader>mn', ':!cmake -S . -G Ninja -B build', {desc = 'Cmake Ninja' })
key('n', '<leader>mm', ':!cmake -S .', {desc = 'Cmake makefile'})
key('n', '<leader>mc', ':!rm -rf build', {desc = 'Cmake build'})

key('n', '<leader>bn', ':!ninja -C build<CR>', { desc = 'Build with ninja' })
key('n', '<leader>bm', ':!make -C build<CR>', { desc = 'Build with make' })

key('n', '<leader>cb', ':!mkdir -p build', {desc = 'Creating buid dir'})
