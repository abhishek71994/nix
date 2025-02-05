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
{ pkgs ? import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/06278c777
b5d162e62df170fec307e83f1812d94b.tar.gz") {}
}:

-----

let
  nixpkgs = fetchTarball "https://github.com/NixOS/nixpkgs/tarball/nixos-24.05";
  pkgs = import nixpkgs { config = {}; overlays = []; };
in

pkgs.mkShellNoCC {
  packages = with pkgs; [
    cowsay
    lolcat
    vim
  ];
  GREETING = "Hello there!";

  shellHook = ''
     echo $GREETING | cowsay | lolcat
  '';
}
