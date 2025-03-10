### nvim setup

c compiler for treesitter:
sudo apt-get install gcc

for F11 shortcut to work, remember to UNBIND it to fullscreen no terminator;

jetbrains mono nerd font from nerd fonts -> donwload it and set it as terminator's profile font 

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

To see icons while using telescope file browser, install fonts on 'assets' directory and restart

fiz sudo apt-get install fonts-material-design-icons-iconfont pra instalar fontes no ubuntu

set jdtls up without mason-lspconfig so that i can futher extend config to ensure DAP works with it;

needs adding generated sources to scope so that queryDSL works properly;

TROUBLESHOOT:

1. pane chata em que projetos com java em versão 19 param de funcionar (e.g.: e-selecao-admissao-area-candidato-api):
    limpar cache em ~/.cache/jdtls
    remover workspace em ~/.local/share/nvim/site/java/workspace-root <- caminho configurado em ftplugin/java, fazer search com 'workspace'
