{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    clang
    clang-tools
    gcc
    nil
    nixd
    nodejs
    "lua-language-server:wwith"
    llvmPackages_latest.clang
  ];

}
