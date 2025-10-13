{ config, lib, pkgs, ... }:
{
    environment.systemPackages = [ pkgs.htop ];

    programs.htop = {
        enable = true;
        settings = {
            show_cpu_temperature = true;
        };
    };
}