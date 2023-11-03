local key_map = function(mode, key, result)
  vim.api.nvim_set_keymap(
    mode,
    key,
    result,
    {noremap = true, silent = true}
  )
end

function get_test_runner(test_name, debug)
  if debug then
    return 'mvn test -Dmaven.surefire.debug -Dtest="' .. test_name .. '"' 
  end
  return 'mvn test -Dtest="' .. test_name .. '"' 
end

function run_java_test_method(debug)
  local utils = require'utils'
  local method_name = utils.get_current_full_method_name("\\#")
  vim.cmd('tabnew')
  vim.cmd('term source "$HOME/.sdkman/bin/sdkman-init.sh" && sdk env && ' .. get_test_runner(method_name, debug))
end

function run_java_test_class(debug)
  local utils = require'utils'
  local class_name = utils.get_current_full_class_name()
  vim.cmd('tabnew')
  vim.cmd('term source "$HOME/.sdkman/bin/sdkman-init.sh" && sdk env && ' .. get_test_runner(class_name, debug))
end

function get_spring_boot_runner(profile, debug)
  local debug_param = ""
  if debug then
    debug_param = ' -Dspring-boot.run.jvmArguments="-Xdebug -Xrunjdwp:transport=dt_socket,server=y,suspend=y,address=5005" '
  end 

  local profile_param = ""
  if profile then
    profile_param = " -Dspring-boot.run.profiles=" .. profile .. " "
  end

  return 'mvn spring-boot:run ' .. profile_param .. debug_param
end

function run_spring_boot_ask_profile(debug)
    vim.cmd('tabnew')
    local profile = vim.fn.input("Profile: ")
    vim.cmd('term source "$HOME/.sdkman/bin/sdkman-init.sh" && sdk env && ' .. get_spring_boot_runner(profile, debug))
end

function run_spring_boot(debug)
    local profile = vim.fn.input("Profile: ")
    vim.cmd('tabnew')
    vim.cmd('term source "$HOME/.sdkman/bin/sdkman-init.sh" && sdk env && ' .. get_spring_boot_runner(profile, debug))
end

function run_docker_compose()
    vim.cmd('tabnew')
    vim.cmd('term docker compose up') 
end

vim.keymap.set("n", "<leader>tm", function() run_java_test_method() end)
vim.keymap.set("n", "<leader>TM", function() run_java_test_method(true) end)
vim.keymap.set("n", "<leader>tc", function() run_java_test_class() end)
vim.keymap.set("n", "<leader>TC", function() run_java_test_class(true) end)
vim.keymap.set("n", "<F10>", function() run_spring_boot(true) end) --debug mode=true
vim.keymap.set("n", "<F11>", function() run_docker_compose() end)
vim.keymap.set("n", "<F12>", function() run_spring_boot_ask_profile() end)

-- setup debug
key_map('n', '<leader>nb', ':lua require"dap".toggle_breakpoint()<CR>')
key_map('n', '<leader>nbc', ':lua require"dap".set_breakpoint(vim.fn.input("Condition: "))<CR>')
key_map('n', '<leader>nbl', ':lua require"dap".set_breakpoint(nil, nil, vim.fn.input("Log: "))<CR>')
key_map('n', '<leader>dr', ':lua require"dap".repl.open()<CR>')

-- vim.fn.sign_define('DapBreakpoint', { text='🔴', texthl='DapBreakpoint', linehl='DapBreakpoint', numhl='DapBreakpoint' })

-- view informations in debug
function show_dap_centered_scopes()
  local widgets = require'dap.ui.widgets'
  widgets.centered_float(widgets.scopes)
end
key_map('n', 'sd', ':lua show_dap_centered_scopes()<CR>')

-- move in debug
key_map('n', '<F9>', ':lua require"dap".continue()<CR>')
key_map('n', '<F8>', ':lua require"dap".step_over()<CR>')
key_map('n', '<F5>', ':lua require"dap".step_into()<CR>')
key_map('n', '<S-F8>', ':lua require"dap".step_out()<CR>')


function attach_to_debug()
  local dap = require('dap')
  dap.configurations.java = {
    {
      type = 'java';
      request = 'attach';
      name = "Attach to the process";
      hostName = 'localhost';
      port = '5005';
    },
  }
  dap.continue()
end 

key_map('n', '<leader>da', ':lua attach_to_debug()<CR>')
