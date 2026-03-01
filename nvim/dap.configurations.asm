local dap = require('dap')

-- Configure the GDB adapter
dap.adapters.gdb = {
  type = 'executable',
  command = 'gdb', -- Ensure gdb is installed and in your PATH
  name = 'gdb'
}

-- Define the debugging configuration for assembly files
dap.configurations.asm = {
  {
    name = "Debug Assembly",
    type = "gdb",  -- This should match the adapter's name above
    request = "launch",
    program = function()
      return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
    end,
    cwd = "${workspaceFolder}",
    stopOnEntry = true,
    args = {},
  },
}
