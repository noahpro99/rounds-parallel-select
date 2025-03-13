{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs, ... }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config = {
          allowUnfree = true;
        };
      };
      buildInputs = with pkgs; [
        pkg-config
        bashInteractive
        dotnet-sdk_8
        mono
      ];
    in
    {
      devShells.${system}.default = pkgs.mkShell {
        buildInputs = buildInputs;
        shellHook = ''
          export LD_LIBRARY_PATH=${pkgs.lib.makeLibraryPath buildInputs}
          export DOTNET_ROOT=${pkgs.dotnet-sdk_8}
        '';
      };
    };
}
