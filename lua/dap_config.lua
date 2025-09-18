local dap = require('dap')

dap.adapters.lldb = {
  type = 'executable',
  command = '/Applications/Xcode.app/Contents/Developer/usr/bin/lldb-vscode', -- comes with Xcode
  name = 'lldb'
}

dap.configurations.cpp = {
  {
    name = "Debug Fortran/C++ executable",
    type = "lldb",
    request = "launch",
    program = function()
      return vim.fn.input('Path to exe: ', vim.fn.getcwd() .. '/_build/test/demag.test', 'file')
    end,
    args = function()
      local args = vim.fn.input('Args: ')
      return vim.split(args, " +")
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = true,
    runInTerminal = false,
  },
}

-- Reuse cpp config for C and Fortran
dap.configurations.c = dap.configurations.cpp
dap.configurations.fortran = dap.configurations.cpp

-- UI setup
local dapui = require('dapui')
dapui.setup()
require('nvim-dap-virtual-text').setup()

dap.listeners.after.event_initialized['dapui_config'] = function() dapui.open() end
dap.listeners.before.event_terminated['dapui_config'] = function() dapui.close() end
dap.listeners.before.event_exited['dapui_config']    = function() dapui.close() end

