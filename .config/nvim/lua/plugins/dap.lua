return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "rcarriga/nvim-dap-ui"
  },
  config = function()
    local dap = require("dap")
    local dapui = require("dapui")

    dap.adapters.lldb = {
      type = "executable",
      command = os.getenv("HOMEBREW_PREFIX") .. "/bin/lldb-dap",
      name = "lldb"
    }

    dap.configurations.c = {
      {
        name = "Launch",
        type = "lldb",
        request = "launch",
        program = function()
          return vim.fn.input(vim.fn.getcwd() .. "/build/")
        end,
        cwd = "${workspaceFolder}",
        stopOnEntry = false,
        args = {}
      }
    }

    dap.configurations.cpp = dap.configurations.c

    dapui.setup()
    dap.listeners.before.attach.dapui_config = function() dapui.open() end
    dap.listeners.before.launch.dapu_config = function() dapui.open() end
    dap.listeners.before.event_terminated.dapui_config = function() dapui.close() end
    dap.listeners.before.event_exited.dapui_config = function() dapui.close() end

    vim.keymap.set("n", "<Leader>dt", dap.toggle_breakpoint, {})
    vim.keymap.set("n", "<Leader>dc", dap.continue, {})
    vim.keymap.set("n", "<Leader>dso", dap.step_over, {})
    vim.keymap.set("n", "<Leader>dsi", dap.step_into, {})
    vim.keymap.set("n", "<Leader>dsu", dap.step_out, {})
    vim.keymap.set("n", "<Leader>dr", dap.repl.open, {})
    vim.keymap.set("n", "<Leader>dui", dapui.toggle, {})
  end
}
