-- if true then return end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- This will run last in the setup process.
-- This is just pure lua so anything that doesn't
-- fit in the normal config locations above can go here

-- We have mise
if vim.fn.executable "mise" == 1 then
  -- Load tools from mise specifically for nvim usage
  for _, tool in ipairs { "node" } do
    -- Find the tool from mise
    local dir = vim.fn.trim(vim.fn.system { "mise", "where", tool })

    -- If mise has the tool, append it at the END of PATH for vim ONLY
    if vim.v.shell_error == 0 then vim.env.PATH = vim.env.PATH .. ":" .. dir .. "/bin" end
  end
end
