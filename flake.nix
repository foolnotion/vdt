{
  description = "vdt";

  inputs.flake-utils.url = "github:numtide/flake-utils";
  inputs.nixpkgs.url = "github:nixos/nixpkgs";

  outputs = { self, flake-utils, nixpkgs }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
        };
      in rec {
        packages.default = pkgs.llvmPackages_16.stdenv.mkDerivation {
          name = "vdt";
          src = self;
          hardeningDisable = [ "all" ];
          impureUseNativeOptimizations = true;
          nativeBuildInputs = with pkgs; [ cmake ];
        };

        devShells.default = pkgs.llvmPackages_16.stdenv.mkDerivation {
          name = "vdt-dev";
          hardeningDisable = [ "all" ];
          impureUseNativeOptimizations = true;
          nativeBuildInputs = with pkgs; [ cmake ];
        };
      });
}
