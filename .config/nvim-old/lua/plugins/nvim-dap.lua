return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "nvim-neotest/nvim-nio",
    },
     event = "DapEnter",
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")

	dap.adapters.cppdbg = {
	  id = 'cppdbg',
	  type = 'executable',
	  command = "/Users/Oisin/.vscode/extensions/ms-vscode.cpptools-1.26.3-darwin-arm64/debugAdapters/bin/OpenDebugAD7",
	}

	dap.configurations.cpp = {
	  {
	    name = "Launch with LLDB",
	    type = "cppdbg", 
	    request = "launch",
	    program = function()
	      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/build/', 'file')
	    end,
	    cwd = '${workspaceFolder}',
	    stopOnEntry = true,
	  },
	}
	dapui.setup()
	--[[
	dap.listeners.after.event_initialized["dapui_config"] = function()
		dapui.open()
	end
	dap.listeners.before.event_terminated["dapui_config"] = function()
		dapui.close()
	end
	dap.listeners.before.event_exited["dapui_config"] = function()
		dapui.close()
	end
	]]
      vim.keymap.set('n','<Leader>dt',dap.toggle_breakpoint,{})
      vim.keymap.set('n','<Leader>dc',dap.continue,{})
      vim.keymap.set('n','<Leader>dq',dap.terminate,{})
      vim.keymap.set('n', '<Leader>du', ':DapUiToggle<CR>')
    end,
  },
}

