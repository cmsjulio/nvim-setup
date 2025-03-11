### nvim setup

c compiler for treesitter:
sudo apt-get install gcc

for F11 shortcut to work, remember to UNBIND it to fullscreen no terminator;

to see icons while using telescope file browser, install fonts on 'ASSETS' directory and restart
copy assets to to ~./local/share/fonts
jetbrains mono nerd font from nerd fonts -> donwload it and set it as terminator's profile font 
fiz sudo apt-get install fonts-material-design-icons-iconfont pra instalar fontes no ubuntu

debuggin with java:
download microsoft java debug in home/Downloads from releases and check README.md for info no how to build it -- 'mvnw clean install' on root
check ftplugin/java.lua as below, fixing path:
  ...
  init_options = {
    bundles = {vim.fn.glob(home .. "/Downloads/java-debug-0.49.0/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-0.49.0.jar", 1)},
  },
  ...

helping myself by making this available

note to self: sdkman for the win

TODO: debugging, angular

Lombok solved with mason installation, add -javaagent:$HOME/.local/share/java to cmd file (with mason-lspconfig setup)

    .local/share/nvim/mason/packages/jdtls/bin/jdtls.py
    exec_args = ["-Declipse.application=org.eclipse.jdt.ls.core.id1",
                 "-Dosgi.bundles.defaultStartLevel=4",
                 "-Declipse.product=org.eclipse.jdt.ls.core.product",
                 "-Dosgi.checkConfiguration=true",
                 "-Dosgi.sharedConfiguration.area=" +
                 str(shared_config_path),
                 "-Dosgi.sharedConfiguration.area.readOnly=true",
                 "-Dosgi.configuration.cascaded=true",
                 "-Xms1G",
                 "-javaagent:/home/j/.local/share/java/lombok.jar",
                 "-Xbootclasspath/a:/home/j/.local/share/java/lombok.jar",
                 "--add-modules=ALL-SYSTEM",
                 "--add-opens", "java.base/java.util=ALL-UNNAMED",
                 "--add-opens", "java.base/java.lang=ALL-UNNAMED"] \

set jdtls up without mason-lspconfig so that i can futher extend config to ensure DAP works with it;

needs adding generated sources to scope so that queryDSL works properly;

TROUBLESHOOT:

1. pane chata em que projetos com java em versão 19 param de funcionar (e.g.: e-selecao-admissao-area-candidato-api):
    limpar cache em ~/.cache/jdtls
    remover workspace em ~/.local/share/nvim/site/java/workspace-root <- caminho configurado em ftplugin/java, fazer search com 'workspace'
