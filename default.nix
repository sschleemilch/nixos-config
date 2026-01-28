{
  sources ? (import ./npins),
  nixpkgs ? sources.nixos,
  ...
}: let
  nixos = nixpkgs: configuration:
    import "${nixpkgs}/nixos/lib/eval-config.nix" {
      modules = [configuration];
    };
in {
  nixosConfigurations = {
    ladon = nixos nixpkgs ./hosts/ladon;
  };
}
