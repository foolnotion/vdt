{
  description = "vdt";

  inputs.flake-parts.url = "github:hercules-ci/flake-parts";
  inputs.nixpkgs.url = "github:nixos/nixpkgs";

  outputs = inputs@{ self, flake-parts, nixpkgs }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [ "x86_64-linux" "x86_64-darwin" "aarch64-linux" "aarch64-darwin" ];

      perSystem = { pkgs, system, ... }:
      let
        pkgs = import nixpkgs { inherit system; };
      in rec {
        packages.default = pkgs.llvmPackages_latest.stdenv.mkDerivation {
          name = "vdt";
          src = self;
          hardeningDisable = [ "all" ];
          impureUseNativeOptimizations = true;
          nativeBuildInputs = with pkgs; [ cmake ];
        };

        devShells.default = pkgs.llvmPackages_latest.stdenv.mkDerivation {
          name = "vdt-dev";
          hardeningDisable = [ "all" ];
          impureUseNativeOptimizations = true;
          nativeBuildInputs = with pkgs; [ cmake ];
        };
      };
    };
}
