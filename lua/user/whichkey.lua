local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
    return
end

local setup = {
    plugins = {
        marks = false,       -- shows a list of your marks on ' and `
        registers = true,    -- shows your registers on " in NORMAL or <C-r> in INSERT mode
        spelling = {
            enabled = true,  -- enabling this will show WhichKey when pressing z= to select spelling suggestionsselect
            suggestions = 10 -- how many suggestions should be shown in the list?
        },
        -- the presets plugin, adds help for a bunch of default keybindings in Neovim
        -- No actual key bindings are created
        presets = {
            operators = false,    -- adds help for operators like d, y, ... and registers them for motion / text object completion
            motions = false,      -- adds help for motions
            text_objects = false, -- help for text objects triggered after entering an operator
            windows = false,      -- default bindings on <c-w>
            nav = false,          -- misc bindings to work with windows
            z = false,            -- bindings for folds, spelling and others prefixed with z
            g = false             -- bindings for prefixed with g
        }
    },
    -- add operators that will trigger motion and text object completion
    -- to enable native operators, set the preset / operators plugin above
    -- operators = { gc = "Comments" },
    key_labels = {},
    icons = {
        breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
        separator = "➜", -- symbol used between a key and it's label
        group = "+"       -- symbol prepended to a group
    },
    window = {
        border = "rounded",       -- none, single, double, shadow
        position = "bottom",      -- bottom, top
        margin = { 1, 0, 1, 0 },  -- extra window margin [top, right, bottom, left]
        padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
        winblend = 0
    },
    layout = {
        height = { min = 4, max = 25 },                                           -- min and max height of the columns
        width = { min = 20, max = 50 },                                           -- min and max width of the columns
        spacing = 3,                                                              -- spacing between columns
        align = "left"                                                            -- align columns left, center or right
    },
    ignore_missing = true,                                                        -- enable this to hide mappings for which you didn't specify a label
    hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
    show_help = true,                                                             -- show help message on the command line when the popup is visible
    triggers = "auto",                                                            -- automatically setup triggers
    -- triggers = {"<leader>"} -- or specify a list manually
    triggers_blacklist = {
        -- list of mode / prefixes that should never be hooked by WhichKey
        -- this is mostly relevant for key maps that start with a native binding
        -- most people should not need to change this
        i = { "j", "k" },
        v = { "j", "k" }
    }
}

local opts = {
    mode = "n",     -- NORMAL mode
    prefix = "<leader>",
    buffer = nil,   -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true,  -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = true   -- use `nowait` when creating keymaps
}

-- GENERAL MAPPINGS

local mappings = {
    ["d"] = { "<cmd>bdelete!<CR>", "delete buffer" },
    ["e"] = { "<cmd>NvimTreeToggle<CR>", "explorer" },
    ["u"] = { "<cmd>UndotreeToggle<CR>", "undo" },
    f = {
        name = "FIND",
        b = {
            "<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<CR>",
            "buffers"
        },
        g = { "<cmd>Telescope git_branches<CR>", "branches" },
        s = { "<cmd>Telescope live_grep<CR>", "string" },
        f = { "<cmd>Telescope find_files<CR>", "files" },
        h = { "<cmd>Telescope help_tags<CR>", "help" },
        -- m = { "<cmd>Telescope man_pages<CR>", "man pages" },
        k = { "<cmd>Telescope keymaps<CR>", "keymaps" },
        d = { "<cmd>Telescope diagnostics<CR>", "diagnostics" },
        r = { "<cmd>Telescope oldfiles<CR>", "recent files" },
        t = { "<cmd>Telescope colorscheme<CR>", "theme" },
        c = { "<cmd>Telescope commands<CR>", "commands" }
        -- r = { "<cmd>Telescope oldfiles<CR>", "recent" },
    },
}

which_key.setup(setup)
which_key.register(mappings, opts)
