# NixOS configuration

This repository contains the NixOS configurations for the supported hosts.
The nixpkgs revision is pinned with [npins](https://github.com/andir/npins).

## Build and switch a host

From the repository root, set the host name and build its system closure:

```bash
HOST=ladon
SYSTEM=$(nix-build \
  -A "nixosConfigurations.$HOST.config.system.build.toplevel" \
  --no-out-link)
```

Install the resulting closure as the active system generation and switch to
it:

```bash
sudo nix-env -p /nix/var/nix/profiles/system --set "$SYSTEM"
sudo /nix/var/nix/profiles/system/bin/switch-to-configuration switch
```

The `-A` (`--attr`) option selects the host's
`nixosConfigurations.<host>.config.system.build.toplevel` attribute from
`default.nix`. That file imports the pinned nixpkgs source from `npins`, so
this workflow uses the repository's pinned dependencies.

To add another host, create its directory under `hosts/` and register it in
`nixosConfigurations` in `default.nix`. Then replace `ladon` in the commands
above with the new host name.

## Update pinned dependencies

Use `npins` to update the pinned sources, review the resulting changes, and
then rebuild:

```bash
npins update
```
