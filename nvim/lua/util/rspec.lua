local RspecComponent = {}

-- Returns component name and remaining path (e.g. "spec/models/foo_spec.rb")
function RspecComponent.parse_path()
  local path = vim.fn.expand("%:p")
  local cwd = vim.fn.getcwd() .. "/"

  local rel = path
  if path:sub(1, #cwd) == cwd then
    rel = path:sub(#cwd + 1)
  end

  local component, rest = rel:match("^components/([^/]+)/(.+)$")
  if not component then
    vim.notify("Not inside components/<name>/...", vim.log.levels.WARN)
    return nil, nil
  end

  return component, rest
end

local function open_terminal(cmd)
  local height = math.floor(vim.o.lines * 0.5)
  vim.cmd("botright split")
  vim.cmd("resize " .. height)
  vim.cmd("terminal " .. cmd)
  vim.bo.bufhidden = "wipe"
  vim.cmd("startinsert")
end

function RspecComponent.run_spec()
  local component, spec_path = RspecComponent.parse_path()
  if not component then
    return
  end

  local cmd = string.format("cd components/%s && bin/rspec %s", component, spec_path)
  open_terminal(cmd)
end

function RspecComponent.run_component_specs()
  local component = RspecComponent.parse_path()
  if not component then
    return
  end

  local cmd = string.format("cd components/%s && bin/rspec", component)
  open_terminal(cmd)
end

function RspecComponent.run_spec_at_line()
  local component, spec_path = RspecComponent.parse_path()
  if not component then
    return
  end

  local line = vim.fn.input("Line number: ")
  if line ~= "" then
    spec_path = spec_path .. ":" .. line
  end

  local cmd = string.format("cd components/%s && bin/rspec %s", component, spec_path)
  open_terminal(cmd)
end

return RspecComponent
