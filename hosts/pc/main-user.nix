{ ... }:
{
  users.users.colm = {
    isNormalUser = true;
    description = "Colm Murphy";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    packages = [
    ];
  };
}
