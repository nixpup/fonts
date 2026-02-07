{
  description = "Jonafonts Font Bundle Flake";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };
  outputs = { self, nixpkgs, flake-utils, ... }:
  flake-utils.lib.eachDefaultSystem (system: let
    pkgs = nixpkgs.legacyPackages.${system};
    jonafonts = pkgs.callPackage ./default.nix { };
  in {
    packages.jonafonts = jonafonts;
    packages.default = jonafonts;

    apps.jonafonts = {
      type = "app";
      program = "${pkgs.writeShellScript "list-jonafonts" ''
        #!/usr/bin/env bash
        echo -e "\n[ Listing Jonafonts Font Directories ]\n"
        ls ${jonafonts}/share/fonts/
        printf "[ Also Print All Font Files? ] (y/n) ~> "
        read -r answerFullFontsList
        lower_answer=$(printf '%s\n' "$answerFullFontsList" | tr '[:upper:]' '[:lower:]')

        if [ "''${lower_answer#y}" != "$lower_answer" ]; then
          echo -e "\n[ Full Font File List ]\n"
          ls ${jonafonts}/share/fonts/*
        fi
      ''}";
      meta = {
        description = "Jonafonts Font Bundle";
        mainProgram = "jonafonts";
      };
    };

    apps.default = {
      type = "app";
      program = "${pkgs.writeShellScript "list-jonafonts" ''
        #!/usr/bin/env bash
        echo -e "\n[ Listing Jonafonts Font Directories ]\n"
        ls ${jonafonts}/share/fonts/
        printf "[ Also Print All Font Files? ] (y/n) ~> "
        read -r answerFullFontsList
        lower_answer=$(printf '%s\n' "$answerFullFontsList" | tr '[:upper:]' '[:lower:]')

        if [ "''${lower_answer#y}" != "$lower_answer" ]; then
          echo -e "\n[ Full Font File List ]\n"
          ls ${jonafonts}/share/fonts/*
        fi
      ''}";
      meta = {
        description = "Jonafonts Font Bundle";
        mainProgram = "jonafonts";
      };
    };
  });
  nixosModules.jonafonts = ./module.nix;
}
