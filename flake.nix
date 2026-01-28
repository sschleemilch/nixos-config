{
  description = "SchleeNix";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = {
    self,
    nixpkgs,
  }: {
    nixosConfigurations = {
      ladon = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/ladon/hardware.nix
          ./common.nix
          {
            networking.hostName = "ladon";
          }
        ];
      };
    };
  };
}
