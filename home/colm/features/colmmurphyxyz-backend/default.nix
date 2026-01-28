{
  inputs,
  config,
  pkgs,
  ...
}:
{
  imports = [
    inputs.colmmurphyxyz-backend.homeManagerModules.x86_64-linux.default
  ];
  services.colmmurphyxyz-backend = {
    enable = true;

    package = inputs.colmmurphyxyz-backend.packages.x86_64-linux.colmmurphyxyz-backend;

    profile = "prod";

    javaOpts = [ ];

    environment = {
      SPRING_CONFIG_ADDITIONAL_LOCATION = "%h/.config/colmmurphyxyz-backend/";
    };
  };
}
