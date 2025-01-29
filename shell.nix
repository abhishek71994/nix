let
  pkgs = import <nixpkgs> {};
in
  pkgs.mkShell {
    packages = [
      pkgs.neovim
      pkgs.tmux
      pkgs.python3
    ];

  env = {
    EDITOR = "nvim";
  };

  shellHook = ''
    echo "Hello World" > should_exist.txt
  '';
}