return {
    "mfussenegger/nvim-dap",
    dependencies = {
        "rcarriga/nvim-dap-ui",
    },
    config = function()
        local dap = require("dap")

        dap.adapters.codelldb = {
            type = "server",
            port = "${port}",
            executable = {
                command = "/home/jole/.local/share/codelldb/extension/adapter/codelldb",
                args = { "--port", "${port}" },
            },
        }

        dap.configurations.rust = {
            {
                name = "Launch",
                type = "codelldb",
                request = "launch",
                program = function()
                    return vim.fn.input("Path to executable: " .. vim.fn.getcwd() .. "/file")
                end,
            },
        }
    end,
}
