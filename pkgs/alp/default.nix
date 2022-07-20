{
  lib,
  stdenv,
  fetchFromGitHub,
  buildGoModule,
  ...
}: let
  lock = (builtins.fromJSON (builtins.readFile ../../flake.lock)).nodes.pkgs-alp;
in
  buildGoModule rec {
    pname = "alp";
    version = lock.original.ref;

    src = fetchFromGitHub {
      inherit (lock.locked) owner repo rev;
      sha256 = lock.locked.narHash;
    };

    vendorSha256 = "sha256-3+fDx2TwfbcEq2fOG+xkr9m1odWcHvPvFTwOgIKTxKo=";

    meta = with lib; {
      homepage = "https://github.com/tkuchiki/alp.git";
      license = licenses.mit;
    };
  }
