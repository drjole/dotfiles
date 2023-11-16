return {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            build =
            "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
        },
    },
    opts = {},
    init = function()
        local telescope = require("telescope")
        local builtin = require("telescope.builtin")

        telescope.load_extension("fzf")

        vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
        vim.keymap.set("n", "<leader>fr", builtin.oldfiles, {})
        vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
        vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
        vim.keymap.set("n", "<leader>fh", builtin.grep_string, {})
        vim.keymap.set("n", "<leader>/", builtin.current_buffer_fuzzy_find, {})
        vim.keymap.set("n", "z=", builtin.spell_suggest)
    end,
}
