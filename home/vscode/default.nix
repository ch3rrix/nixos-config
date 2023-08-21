{
  config,
  pkgs,
  ...
}: {
  programs.vscode = {
    enable = true;
    enableExtensionUpdateCheck = false;
    enableUpdateCheck = false;
    extensions = with pkgs.vscode-extensions; [
      ms-vscode.cpptools
      ms-vscode.makefile-tools
      ms-vscode.cmake-tools
      usernamehw.errorlens
      ms-python.python
      catppuccin.catppuccin-vsc
      vscodevim.vim
      twxs.cmake
      haskell.haskell
      rust-lang.rust-analyzer
    ];
  };
}
