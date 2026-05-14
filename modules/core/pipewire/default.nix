	{ config, pkgs, ... }:
  {
# 2. Enable PipeWire for Modern Audio Handling
  security.rtkit.enable = true; # Required for PipeWire to get real-time priority
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;

    # 3. Wireplumber Settings for High-Quality Codecs and No-Lag
    wireplumber.extraConfig = {
      "10-bluez" = {
        "monitor.bluez.properties" = {
          "bluez5.enable-sbc-xq" = true;
          "bluez5.enable-msbc" = true;
          "bluez5.enable-hw-volume" = true;
          "bluez5.roles" = [ "hsp_hs" "hsp_ag" "hfp_hf" "hfp_ag" "a2dp_sink" "a2dp_source" ];
        };
      };
      "11-no-suspend" = {
        "monitor.alsa.rules" = [
          {
            matches = [ { "node.name" = "~alsa_output.*"; } ];
            actions = {
              update-props = {
                # This prevents the audio from "going to sleep" and causing initial delay
                "session.suspend-timeout-seconds" = 0;
              };
            };
          }
        ];
      };
    };
  };
  }