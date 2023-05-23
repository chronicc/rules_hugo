{ pkgs ? import <nixpkgs> {} }:

(pkgs.buildFHSUserEnv {
  name = "bazelFHS";
  targetPkgs = pkgs: [
    pkgs.bazel
    pkgs.glibc
    pkgs.gcc
  ];
}).env
