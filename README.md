# ISUCONix

Nix overlay for some utilities for (mainly) ISUCON.

> 「ISUCON」は、LINE株式会社の商標または登録商標です。

## Usage

```nix
{
  inputs = {
    isuconix.url = "github:SnO2WMaN/ISUCONix";
    flake-utils.url = "github:numtide/flake-utils";
  };
  outputs = {
    self,
    nixpkgs,
    flake-utils,
    isuconix,
    ...
  } @ inputs:
    flake-utils.lib.eachDefaultSystem (
      system: let
        pkgs = import nixpkgs {
          inherit system;
          overlays = [ 
            isuconix.overlays.default
          ];
        };
      in {
          # write shell, packages, etc.
      }
    );
}
```
