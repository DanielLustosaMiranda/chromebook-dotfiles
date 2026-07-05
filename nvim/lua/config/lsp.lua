-- Configuração LSP (Clangd, Cmake) e Autocomplete
vim.diagnostic.config({ virtual_text = true, signs = true, float = { border = "rounded" } })

local cmp = require("cmp")
cmp.setup({
    snippet = {
        expand = function(args)
            vim.snippet.expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
        ["<Tab>"] = cmp.mapping.select_next_item(),
        ["<S-Tab>"] = cmp.mapping.select_prev_item(),
    }),
    sources = cmp.config.sources({
        { name = "nvim_lsp" },
    }),
})

-- Integração segura do Autopairs com o Nvim-cmp
local ok_autopairs, cmp_autopairs = pcall(require, "nvim-autopairs.completion.cmp")
if ok_autopairs then
    cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
end

local caps = require("cmp_nvim_lsp").default_capabilities()

vim.lsp.config("clangd", { 
    cmd = {
        "clangd",
        "--background-index",
        "--query-driver=**", 
        "--header-insertion=iwyu",
    },
    init_options = {
        fallbackFlags = { 
           -- "-std=c++20", 
            "-I.", 
            "-Wall", 
            "-Wextra", 
            "-Wpedantic", 
            "-Wshadow", 
            "-Wconversion" 
        }
    },
    capabilities = caps 
})
vim.lsp.enable("clangd")

vim.lsp.config('cmake', {})
vim.lsp.enable('cmake')
