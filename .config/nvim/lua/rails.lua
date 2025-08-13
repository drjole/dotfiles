local ts_utils = require("nvim-treesitter.ts_utils")

local function get_current_method_name()
    local node = ts_utils.get_node_at_cursor()
    while node do
        if node:type() == "method" or node:type() == "method_definition" then
            for child in node:iter_children() do
                if child:type() == "identifier" then
                    return vim.treesitter.get_node_text(child, 0)
                end
            end
        end
        node = node:parent()
    end
end

local function jump_to_controller_from_view()
    local filepath = vim.fn.expand("%:p")
    local root = vim.fn.getcwd()
    local m = filepath:match("app/views/(.+)/([^/]+)%.html%.erb$")
    if not m then return end

    local controller_dir, action = filepath:match("app/views/(.+)/([^/]+)%.html%.erb$")
    local controller_path = root .. "/app/controllers/" .. controller_dir .. "_controller.rb"

    if vim.fn.filereadable(controller_path) == 0 then
        vim.fn.mkdir(vim.fn.fnamemodify(controller_path, ":h"), "p")
        vim.cmd("edit " .. controller_path)
    else
        vim.cmd("edit " .. controller_path)
    end

    -- Search for method definition inside controller
    vim.cmd("normal! gg")
    vim.fn.search("^\\s*def\\s\\+" .. action)
end

local function jump_to_view_from_controller()
    local filepath = vim.fn.expand("%:p")
    local root = vim.fn.getcwd()
    local m = filepath:match("app/controllers/(.+)_controller%.rb$")
    if not m then return end

    local action = get_current_method_name()
    if not action then return end

    local view_path = root .. "/app/views/" .. m .. "/" .. action .. ".html.erb"
    if vim.fn.filereadable(view_path) == 0 then
        vim.fn.mkdir(vim.fn.fnamemodify(view_path, ":h"), "p")
        vim.cmd("edit " .. view_path)
    else
        vim.cmd("edit " .. view_path)
    end
end

vim.keymap.set("n", "<leader>rc", jump_to_controller_from_view)
vim.keymap.set("n", "<leader>rv", jump_to_view_from_controller)
