# TODO:
#   - NPM Global
#     See https://docs.npmjs.com/resolving-eacces-permissions-errors-when-installing-packages-globally
#   - Move unfree packages to nix shell when supported
#     See https://github.com/NixOS/nixpkgs/issues/166220

{ pkgs ? import <nixpkgs> { } }:

with pkgs; mkShell {
  name = "node-dev-shell";

  buildInputs = [        
    dotnet-sdk
    mono
    msbuild
    nodejs-slim-14_x 
  ];

  APPEND_LIBRARY_PATH = "${pkgs.lib.makeLibraryPath [ pkgs.libuuid ]}";

  shellHook = ''
    export LD_LIBRARY_PATH="$APPEND_LIBRARY_PATH:$LD_LIBRARY_PATH"
  '';

}
