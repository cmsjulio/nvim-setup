-- Java Language Server configuration.
-- Locations:
-- 'nvim/ftplugin/java.lua'.
-- 'nvim/lang-servers/intellij-java-google-style.xml'
 
local jdtls_ok, jdtls = pcall(require, "jdtls")
if not jdtls_ok then
  vim.notify "JDTLS not found, install with `:LspInstall jdtls`"
  return
end
 
-- See `:help vim.lsp.start_client` for an overview of the supported `config` options.
local jdtls_path = vim.fn.stdpath('data') .. "/mason/packages/jdtls"
local path_to_lsp_server = jdtls_path .. "/config_linux"
local path_to_plugins = jdtls_path .. "/plugins/"
local path_to_jar = path_to_plugins .. "org.eclipse.equinox.launcher_1.6.500.v20230717-2134.jar"
local lombok_path = path_to_plugins .. "../lombok.jar"
local home = vim.loop.os_homedir();
print (home)

local root_markers = { ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" }
local root_dir = require("jdtls.setup").find_root(root_markers)
if root_dir == "" then
  return
end

local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
local workspace_dir = vim.fn.stdpath('data') .. '/site/java/workspace-root/' .. project_name

function pws()
print(workspace_dir)
end
-- Main Config
local config = {
  -- The command that starts the language server
  -- See: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
  cmd = {
    home .. '/.sdkman/candidates/java/21.0.2-amzn/bin/java',
    '-Declipse.application=org.eclipse.jdt.ls.core.id1',
    '-Dosgi.bundles.defaultStartLevel=4',
    '-Declipse.product=org.eclipse.jdt.ls.core.product',
    '-Dlog.protocol=true',
    '-Dlog.level=ALL',
    '-javaagent:' .. lombok_path,
    '-Xms1g',
    '--add-modules=ALL-SYSTEM',
    '--add-opens', 'java.base/java.util=ALL-UNNAMED',
    '--add-opens', 'java.base/java.lang=ALL-UNNAMED',

    '-jar', path_to_jar,
    '-configuration', path_to_lsp_server,
    '-data', workspace_dir,
  },

  -- This is the default if not provided, you can remove it. Or adjust as needed.
  -- One dedicated LSP server & client will be started per unique root_dir
  root_dir = root_dir,

  -- Here you can configure eclipse.jdt.ls specific settings
  -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
  -- for a list of options
  settings = {
    java = {
      home = home ..  '/.sdkman/candidates/java/21.0.2-amzn',
      eclipse = {
        downloadSources = true,
      },
      configuration = {
        updateBuildConfiguration = "interactive",
        runtimes = {
          {
            name = "JavaSE-1.8",
            path = home .. "/.sdkman/candidates/java/8.0.442-amzn",
          },
          {
            name = "JavaSE-17",
            path = home .. "/.sdkman/candidates/java/17.0.14-amzn",
          },
          {
            name = "JavaSE-19",
            path = home .. "/.sdkman/candidates/java/19.0.1-open",
          },
          {
            name = "JavaSE-21",
            path = home .. "/.sdkman/candidates/java/21.0.2-amzn",
          }
        }
      },
      maven = {
        downloadSources = true,
      },
      implementationsCodeLens = {
        enabled = true,
      },
      referencesCodeLens = {
        enabled = true,
      },
      references = {
        includeDecompiledSources = true,
      },

    },
    signatureHelp = { enabled = true },
    completion = {
      favoriteStaticMembers = {
        "org.hamcrest.MatcherAssert.assertThat",
        "org.hamcrest.Matchers.*",
        "org.hamcrest.CoreMatchers.*",
        "org.junit.jupiter.api.Assertions.*",
        "java.util.Objects.requireNonNull",
        "java.util.Objects.requireNonNullElse",
        "org.mockito.Mockito.*",
      },
      importOrder = {
        "java",
        "javax",
        "com",
        "org"
      },
    },
    extendedClientCapabilities = extendedClientCapabilities,
    sources = {
      organizeImports = {
        starThreshold = 9999,
        staticStarThreshold = 9999,
      },
    },
    codeGeneration = {
      toString = {
        template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}",
      },
      useBlocks = true,
    },
  },

  flags = {
    allow_incremental_sync = true,
  },
  init_options = {
    bundles = {vim.fn.glob(home .. "/Downloads/java-debug-0.49.0/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-0.49.0.jar", 1)},
  },
}

config['on_attach'] = function(client, bufnr)
    require "lsp_signature".on_attach({
    bind = true, -- This is mandatory, otherwise border config won't get registered.
    floating_window_above_cur_line = false,
    padding = '',
    handler_opts = {
      border = "rounded"
    }
  }, bufnr)
    require('jdtls').setup_dap({ hotcodereplace = 'auto' })
end

function reloadOnAttach()
    require('jdtls').setup_dap({ hotcodereplace = 'auto' })
end

-- This starts a new client & server,
-- or attaches to an existing client & server depending on the `root_dir`.
require('jdtls').start_or_attach(config)
