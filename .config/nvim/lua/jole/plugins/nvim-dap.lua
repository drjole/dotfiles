return {
    "mfussenegger/nvim-dap",
    dependencies = {
        "rcarriga/nvim-dap-ui",
    },
    lazy = true,
    keys = {
        { "<leader>db", function() require("dap").toggle_breakpoint() end, desc = "DAP: Toggle breakpoint" },
        { "<F5>",       function() require("dap").continue() end,          desc = "DAP: Continue" },
        { "<F6>",       function() require("dap").step_out() end,          desc = "DAP: Step out" },
        { "<F7>",       function() require("dap").step_into() end,         desc = "DAP: Step into" },
        { "<F8>",       function() require("dap").step_over() end,         desc = "DAP: Step over" },
    },
}
