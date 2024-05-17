
local fn = vim.fn


-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP =
    fn.system(
    {
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path
    }
    )
    print("Installing packer close and reopen Neovim...")
    vim.cmd([[packadd packer.nvim]])
end

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

-- Have packer use a popup window
packer.init(
{
    display = {
        open_fn = function()
            return require("packer.util").float({ border = "rounded" })
        end
    }
}
)

-- Packer
return packer.startup(
function(use)

    -- colorscheme
    use {'rose-pine/neovim', as = 'rose-pine'}

    -- treesitter
    use {'nvim-treesitter/nvim-treesitter'}

    -- autopairs
    use {'windwp/nvim-autopairs'}

    -- lualine
    use {'nvim-lualine/lualine.nvim', requires = { 'nvim-tree/nvim-web-devicons', opt = true }}

    -- nvim-tree
    use {"nvim-tree/nvim-tree.lua"}
    use{"nvim-tree/nvim-web-devicons"}

    -- undotree
    use {'mbbill/undotree'}

    -- comment
    use {'numToStr/Comment.nvim',}

    -- telescope
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.6',
        -- or                            , branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
        }

        -- bufferline
        use {'akinsho/bufferline.nvim', tag = "*", requires = 'nvim-tree/nvim-web-devicons'}

        -- lsp
        use {"williamboman/mason.nvim"}
        use {'folke/tokyonight.nvim'}
        use {'VonHeikemen/lsp-zero.nvim', branch = 'v3.x'}
  use {'neovim/nvim-lspconfig'}
  use {'hrsh7th/cmp-nvim-lsp'}
  use {'hrsh7th/nvim-cmp'}
  use {'L3MON4D3/LuaSnip'}

    -- dressing
    use {'stevearc/dressing.nvim'}

    -- whichkey
    use {
        "folke/which-key.nvim",
        config = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
            require("which-key").setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }

        end
    }
    -- toggleterm
    use {"akinsho/toggleterm.nvim"}

    -- surround
    use({
        "kylechui/nvim-surround",
        tag = "*", -- Use for stability; omit to use `main` branch for the latest features
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end
    })
end
)
