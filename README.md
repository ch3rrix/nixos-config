## How to Install
Replace `YOUR_HOST` and `/dev/YOUR_DISK`, then run the command below from a NixOS live ISO.
```fish
sudo nix --extra-experimental-features "nix-command flakes" \
  --accept-flake-config \
  run github:nix-community/disko/latest#disko-install -- \
  --write-efi-boot-entries \
  --flake github:ch3rrix/nixos-config#YOUR_HOST \
  --disk main /dev/YOUR_DISK
```
