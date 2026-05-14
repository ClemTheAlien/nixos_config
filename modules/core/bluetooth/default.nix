	{ config, pkgs, ... }:
  {
 # 1. Enable Bluetooth Hardware
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    settings = {
      General = {
        # 'bredr' forces standard Bluetooth, avoiding the laggy 'LE' (Low Energy) profile
        ControllerMode = "bredr";
        # Helps with reconnecting and finding the headphones
        Enable = "Source,Sink,Media,Socket";
        Experimental = true;
      };
    };
  };
  }