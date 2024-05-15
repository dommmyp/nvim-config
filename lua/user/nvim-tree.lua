vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1


require("nvim-tree").setup {
    actions = {
        change_dir = {
            enable = true,
            global = false
        },
        open_file = {
            quit_on_open = true
        },
    },
    git = {
        enable = true,
        ignore = false,
        timeout = 500
    },
    filters = {
        custom = { ".git" }
    },
    update_focused_file = {
        enable = true,
        update_cwd = true
        -- ignore_list = {},
        -- update_root = true,
    },
    renderer = {
        root_folder_modifier = ":t",
        icons = {
            glyphs = {
                default = "",
                symlink = "",
                folder = {
                    arrow_open = "",
                    arrow_closed = "",
                    default = "",
                    open = "",
                    empty = "",
                    empty_open = "",
                    symlink = "",
                    symlink_open = ""
                },
                git = {
                    unstaged = "",
                    staged = "S",
                    unmerged = "",
                    renamed = "➜",
                    untracked = "U",
                    deleted = "",
                    ignored = "◌"
                }
            }
        }
    },
    diagnostics = {
        enable = true,
        show_on_dirs = true,
        icons = {
            hint = "",
            info = "",
            warning = "",
            error = ""
        }
    },
    view = {
        width = 30,
        side = "left"
    },
    on_attach = on_attach
}

