{ inputs, pkgs, ... }:

{
  home.packages = [
    inputs.mangobar.packages.${pkgs.stdenv.hostPlatform.system}.mangobar
  ];

  home.file.".config/mangobar/config.jsonc".text = ''

    {
      "layer": "top",
      "height": 25,
      "buffer-scale": 1,

      // Refresh polled modules every 2 seconds.
      "sys-interval": 2,

      
      "modules-left": [
        "workspaces"
      ],

      "modules-center": [
        "clock"
      ],

      "modules-right": [
        "custom/dns",
        "tray",
        "pulseaudio",
        "network",
        "custom/bluetooth",
        "cpu",
        "memory",
        "battery",
        "custom/power"
      ],

      "workspaces": {
        "hide-empty": true,
        "on-click": "activate",
        "on-click-right": "toggle",
        "on-scroll-up": "mmsg dispatch viewtoleft_have_client",
        "on-scroll-down": "mmsg dispatch viewtoright_have_client"
      },

      "clock": {
        "format": "%I:%M %p",
        "format-alt": "%d-%m-%Y"
      },

      "cpu": {
        "format": "[CPU:{load}%]"
      },

      "memory": {
        "format": "[MEM:{percent}%]"
      },

      "battery": {
        "format": "{icon} {percent}%",
        "format-charging": "   {percent}%",
        "format-plugged": "  {percent}%",

        "icons": [
          "",
          "",
          "",
          "",
          ""
        ]
      },

      "pulseaudio": {
        "format": "{icon} {volume}%",
        "format-muted": " Muted",

        "icons": [
          "",
          "",
          "",
          ""
        ],

        "on-click": "pavucontrol",
        "on-click-right": "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle",
        "on-scroll-up": "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.01+",
        "on-scroll-down": "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.01-"
      },

      "network": {
        "format": "󰲛  Offline",
        "format-wifi": " ",
        "format-ethernet": "󰈀 󰈁",
        "format-disconnected": "󰲛  Offline",

        "icon-wifi": "",
        "icon-ethernet": "󰈀",
        "icon-disconnected": "󰲛",

        "format-alt": "↓{down} ↑{up}",

        "on-click-right": "nm-connection-editor"
      //   "on-click-right": "ghostty -e nmtui"
      },

      "custom/bluetooth": {
        "exec": "bluetoothctl show | grep -q 'Powered: yes' && echo '' || echo ' '",
        "interval": 30,
        "format": "{}",
        "on-click": "overskride"
      },

      "tray": {
        "icon-size": 20,
        "spacing": 5
      },

      "custom/dns": {
        "exec": "echo DNS",
        "interval": 0,
        "format": "{}",
        "on-click": "dns-switcher"
      },

      "custom/power": {
        "exec": "echo '⏻'",
        "interval": 0,
        "format": "{}",
        "on-click": "powerMenuMadeByMe"
      }
    }
  '';

  home.file.".config/mangobar/style.css".text = ''
    /*
     * ========================================================================
     * MangoBar
     * Catppuccin Mocha
     * ========================================================================
     */

    * {
      font-family: "JetBrainsMono Nerd Font";
      font-size: 14px;
      font-weight: normal;

      color: #CDD6F4;
      background-color: transparent;

      padding: 0px 5px;
      margin: 0px;
      border-radius: 0px;
    }

    /*
     * ========================================================================
     * Bar
     * ========================================================================
     */

    #bar {
      background: rgba(30, 30, 46, 0.88);
      padding: 0px;
      margin: 0px;
      border-radius: 0px;
    }

    #bar.sel {
      background: rgba(30, 30, 46, 0.88);
    }

    /*
     * ========================================================================
     * Workspaces
     * ========================================================================
     */

    #tags {
      background-color: transparent;
      color: #CDD6F4;

      padding: 0px 5px;
      margin: 0px;
    }

    #tags.active {
      background-color: #585B70;
      color: #89B4FA;
    }

    #tags.occupied {
      background-color: transparent;
      color: #CDD6F4;
    }

    #tags.empty {
      background-color: transparent;
      color: #7F849C;
    }

    #tags.urgent {
      background-color: #F38BA8;
      color: #1E1E2E;
    }

    /*
     * ========================================================================
     * Clock
     * ========================================================================
     */

    #clock {
      background-color: transparent;
      color: #CDD6F4;
    }

    /*
     * ========================================================================
     * CPU / Memory
     * ========================================================================
     */

    #cpu {
      background-color: transparent;
      color: #CDD6F4;
    }

    #mem {
      background-color: transparent;
      color: #CDD6F4;
    }

    /*
     * ========================================================================
     * Audio
     * ========================================================================
     */

    #volume {
      background-color: transparent;
      color: #CDD6F4;
    }

    /*
     * ========================================================================
     * Network
     * ========================================================================
     */

    #network {
      background-color: transparent;
      color: #CDD6F4;
    }

    #network.wifi {
      background-color: transparent;
      color: #89B4FA;
    }

    #network.ethernet {
      background-color: transparent;
      color: #A6E3A1;
    }

    #network.disconnected {
      background-color: transparent;
      color: #F38BA8;
    }

    /*
     * ========================================================================
     * Bluetooth
     * ========================================================================
     */

    #custom-bluetooth {
      background-color: transparent;
      color: #CDD6F4;
    }

    /*
     * ========================================================================
     * Battery
     * ========================================================================
     */

    #battery {
      background-color: transparent;
      color: #CDD6F4;
    }

    /*
     * ========================================================================
     * DNS
     * ========================================================================
     */

    #custom-dns {
      background-color: transparent;
      color: #CDD6F4;
    }

    /*
     * ========================================================================
     * Tray
     * ========================================================================
     */

    #tray {
      background-color: #313244;
      color: #CDD6F4;

      padding: 0px 5px;
      margin: 0px;
      border-radius: 0px;
    }

    /*
     * ========================================================================
     * Power
     * ========================================================================
     */

    #custom-power {
      background-color: transparent;
      color: #CDD6F4;

      padding: 0px 5px;
      margin: 0px;
    }

    /*
     * ========================================================================
     * Hover / selected-like states
     * ========================================================================
     */

    #custom-power:hover,
    #custom-dns:hover,
    #custom-bluetooth:hover {
      color: #89B4FA;
    }
  '';

}
