# TODO:
#   NPM Global
#     https://docs.npmjs.com/resolving-eacces-permissions-errors-when-installing-packages-globally

{ pkgs ? import <nixpkgs> { } }:

with pkgs; mkShell {

  # dotnet-sdk
  # mono
  # msbuild

  name = "node-dev-shell";

  buildInputs = [
    gitkraken
    jetbrains.datagrip
    jetbrains.rider
    jetbrains.webstorm
    nodejs-slim-14_x 
  ];

  APPEND_LIBRARY_PATH = "${pkgs.lib.makeLibraryPath [ pkgs.libuuid ]}";

  shellHook = ''
    export LD_LIBRARY_PATH="$APPEND_LIBRARY_PATH:$LD_LIBRARY_PATH"
  '';

}
