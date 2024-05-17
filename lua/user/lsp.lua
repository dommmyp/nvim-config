local lsp = require("lsp-zero").preset({})

lsp.on_attach(
    function(client, bufnr)
        lsp.default_keymaps({ buffer = bufnr })
    end
)
require "lspconfig".lua_ls.setup {
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" }
            }
        }
    }
}
require("lspconfig").tsserver.setup({})
require("lspconfig").pyright.setup({})
require("lspconfig").texlab.setup({})
require("lspconfig").jdtls.setup({})
require("lspconfig").clangd.setup({})
require 'lspconfig'.cssmodules_ls.setup {}

require("mason").setup(
    {
        ui = {
            icons = {
                package_installed = "✓",
                package_pending = "➜",
                package_uninstalled = "✗"
            }
        }
    }
)

root_dir = function(fname)
    return vim.fn.getcwd()
end
lsp.setup()

