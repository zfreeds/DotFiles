local dap_ok, dap = pcall(require, "dap")
if not dap_ok then
  print("Couldn't load: nvim-dap")
  return
end

local dapui_ok, dapui = pcall(require, "dapui")
if dapui_ok then
  dapui.setup()
  dap.listeners.after.event_initialized["dapui_config"] = function() dapui.open() end
  dap.listeners.before.event_terminated["dapui_config"] = function() dapui.close() end
  dap.listeners.before.event_exited["dapui_config"] = function() dapui.close() end
end

local vt_ok, vt = pcall(require, "nvim-dap-virtual-text")
if vt_ok then
  vt.setup()
end

-- Function adapter: uses pipe (unix socket) or TCP depending on config
dap.adapters.rdbg = function(callback, config)
  if config.connect then
    callback({
      type = "server",
      host = config.connect.host,
      port = config.connect.port,
    })
  else
    callback({ type = "pipe", pipe = config.pipe })
  end
end

-- Find the most recent rdbg unix socket
local function find_rdbg_socket()
  local glob = vim.fn.glob("/var/folders/**/rdbg-*/rdbg-*", false, true)
  if #glob == 0 then
    vim.notify("No rdbg socket found. Run `open` in the debugger first.", vim.log.levels.ERROR)
    return ""
  end
  table.sort(glob, function(a, b)
    return vim.fn.getftime(a) > vim.fn.getftime(b)
  end)
  return glob[1]
end

dap.configurations.ruby = {
  {
    type = "rdbg",
    request = "attach",
    name = "Attach to rdbg",
    localfs = true,
    pipe = find_rdbg_socket,
  },
}
