{
  description = "my nixos config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }:
  let
    forAllSystems = nixpkgs.lib.genAttrs [ "x86_64-linux" "aarch64-linux" ];
  in {
    packages = forAllSystems (system:
      let 
        pkgs = import nixpkgs { inherit system; };
      in {
        scripts = pkgs.stdenvNoCC.mkDerivation {
          pname = "myscripts";
          version = "1.0";
          src = ./scripts;
          dontBuild = true;

          installPhase = ''
            mkdir -p $out/bin
            for f in *; do
              if [ -f "$f" ]; then
                install -Dm755 "$f" "$out/bin/$f"
              fi
            done
          '';

          postInstall = ''patchShebangs "$out/bin"'';

          meta.description = "Personal script collection";
        };

        default = self.packages.${system}.scripts;
      });

    nixosConfigurations.bart = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./hosts/bart
        home-manager.nixosModules.home-manager
        {
          nix.settings.experimental-features = [ "nix-command" "flakes" ];
          nixpkgs.config.allowUnfree = true;

          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.extraSpecialArgs = { 
            inherit self; 
            theme = {
              accent = "#69DAA2";
              muted = "colour245";
            };
          };

          home-manager.users.gaaj = import ./home/gaaj.nix;
        }
      ];
    };
  };
}
