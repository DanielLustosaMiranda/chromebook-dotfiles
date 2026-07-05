local is_tty = vim.g.is_tty
local hl = vim.api.nvim_set_hl

-- Definição da Paleta de Cores (Índices do seu TTY)
local color = {
    black = 0,
    red = 1,
    green = 2,
    yellow = 3,
    blue = 4,
    magenta = 5,
    cyan = 6,
    white = 7,
    bright_black = 8, -- Gray (Comentários)
    bright_red = 9,
    bright_green = 10,
    bright_yellow = 11, -- Funções
    bright_blue = 12, -- Keywords / Includes
    bright_magenta = 13,
    bright_cyan = 14,
    bright_white = 15,
}

-- Mapeamento de Significado
local ui = {
    keyword = color.magenta,
    type = color.bright_green,
    comment = color.white,
    func = color.bright_yellow,
    string = color.green,
    macro = color.magenta,
    const = color.bright_blue,
    text = color.white,
    variable = color.cyan,
    bg = "NONE", -- Mantém o fundo do seu TTY
}

-- Aplicação das Cores Variáveis (Protegido no TTY)
if is_tty then
    vim.cmd("colorscheme habamax")

    -- Grupos Principais
    hl(0, "Normal", { fg = ui.text, ctermfg = ui.text, bg = ui.bg, ctermbg = ui.bg })
    hl(0, "Comment", { fg = ui.comment, ctermfg = ui.comment, italic = true })
    hl(0, "Statement", { fg = ui.keyword, ctermfg = ui.keyword, bold = true })
    hl(0, "Function", { fg = ui.func, ctermfg = ui.func })
    hl(0, "String", { fg = ui.string, ctermfg = ui.string })
    hl(0, "Type", { fg = ui.type, ctermfg = ui.type })
    hl(0, "PreProc", { fg = ui.macro, ctermfg = ui.macro })
    hl(0, "Constant", { fg = ui.const, ctermfg = ui.const })
    hl(0, "Identifier", { fg = ui.variable, ctermfg = ui.variable })

    -- Treesitter Refinamentos (Links Dinâmicos)
    hl(0, "@variable", { fg = ui.variable, ctermfg = ui.variable })
    hl(0, "@keyword.directive", { link = "PreProc" }) -- #include
    hl(0, "@type.builtin", { link = "Type" }) -- int, char
    hl(0, "@type", { link = "Type" }) -- structs
    hl(0, "@storageclass", { link = "Type" }) -- palavra 'struct'
    hl(0, "@keyword", { link = "Statement" }) -- if, return
    hl(0, "@function.call", { link = "Function" })
    hl(0, "@string.documentation", { link = "String" }) -- <stdio.h>

    -- ===== LSP Semantic Tokens =====
    hl(0, "@lsp.type.variable", { link = "@variable" })
    hl(0, "@lsp.type.parameter", { link = "@variable" })
    hl(0, "@lsp.type.function", { link = "Function" })
    hl(0, "@lsp.type.method", { link = "Function" })
    hl(0, "@lsp.type.macro", { link = "PreProc" })
    hl(0, "@lsp.type.type", { link = "Type" })
    hl(0, "@lsp.type.enumMember", { link = "Constant" })
    hl(0, "@lsp.type.keyword", { link = "Statement" })

    -- Cores para os membros da struct (ex: .baud_rate, .parity)
    hl(0, "@property", { fg = ui.variable, ctermfg = ui.variable })
    hl(0, "@variable.member", { link = "@property" })
    
    -- Cores extras do LSP para macros e enums (ex: UART_NUM_0, UART_DATA_8_BITS)
    hl(0, "@lsp.type.property", { link = "@property" })
    hl(0, "@lsp.mod.global", { link = "Constant" })
end
