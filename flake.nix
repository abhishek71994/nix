{
  description = "My Nix-based dotfiles";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, ... }:
    let
      system = "aarch64-darwin";  # Use "x86_64-darwin" if on an Intel Mac
      pkgs = import nixpkgs { inherit system; };
    in {
      homeConfigurations."abhishek" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs system;
        homeDirectory = "/Users/abhishek";
        username = "abhishek";

        modules = [{  # 'modules' should be a list of attribute sets
          home.packages = with pkgs; [
            git
            neovim
            zsh
            fzf
            ripgrep
            tmux
          ];

          programs.zsh.enable = true;
          programs.git.enable = true;

          home.stateVersion = "23.11";
        }];
      };
    };
}
