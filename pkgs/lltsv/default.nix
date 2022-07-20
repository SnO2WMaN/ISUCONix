{
  lib,
  stdenv,
  fetchFromGitHub,
  buildGoModule,
  ...
}: let
  lock = (builtins.fromJSON (builtins.readFile ../../flake.lock)).nodes.pkgs-lltsv;
in
  buildGoModule rec {
    pname = "lltsv";
    version = lock.original.ref;

    src = fetchFromGitHub {
      inherit (lock.locked) owner repo rev;
      sha256 = lock.locked.narHash;
    };

    vendorSha256 = "sha256-7rr9kBH0MD7ySQl30nV4EvsojlbV1w+NOhd3zOQYtso=";

    meta = with lib; {
      homepage = "https://github.com/sonots/lltsv";
      license = licenses.mit;
    };
  }
