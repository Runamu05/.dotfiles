{ pkgs, inputs, ... }:

let
  wallpaper = pkgs.fetchurl {
    url = "https://images.wallpapersden.com/image/download/hd-train-view-at-sunset_bmZobWmUmZqaraWkpJRobWllrWdma2U.jpg";
    sha256 = "sha256-vL0srC+hJgY7Rus8Z6sw/eSUM+dEOf2alU56UTtfRZE=";
  };  
  wallpaper2 = pkgs.fetchurl {
    url = "https://initiate.alphacoders.com/images/133/cropped-3840-2160-1330716.png?6781";
    sha256 = "sha256-wK40M6HiMyNckpsXPeWPjBtSo4u21m3fE82v/wUAvYk=";
  };
  wallpaper3 = pkgs.fetchurl {
    url = "https://www.wallpaperflare.com/red-neon-light-night-the-city-street-art-oskar-woinski-neon-haze-wallpaper-shfll/download/3840x2160";
    sha256 = "";
  };
  wallpaper4 = pkgs.fetchurl {
    url = "";
    hash = "";
  };
in
{
  wayland.windowManager.hyprland = {
    enable = true;
    package = pkgs.hyprland;
    xwayland.enable = true;	
    systemd.enable = true;

    plugins = [
      #inputs.hyprland-plugins.packages.${pkgs.system}.hyprbars
      #inputs.hyprland-plugins.packages.${pkgs.system}.borders-plus-plus
    ];
  };

  wayland.windowManager.hyprland.settings = {
    # Set keyboard layout
    input = {
      kb_layout = "de";
      kb_variant = "nodeadkeys";
    };

    # Set monitor
    monitor = ", highres, auto, 1";

    # Size cursor
    env = "XCURSOR_SIZE, 24"; 

    # Set default wallpaper 
    exec = "${pkgs.swaybg}/bin/swaybg -m fill -i ${wallpaper}";

    "$mod" = "SUPER";
    "$terminal" = "${pkgs.kitty}/bin/kitty";

    bindm = [
      # Move/resize windows with mod + LMB/RMB and dragging
      "$mod, mouse:272, movewindow"
      "$mod, mouse:273, resizewindow"
    ];

    binde = [
      # Control Brightness
      ", XF86MonBrightnessUp, exec, ${pkgs.brightnessctl}/bin/brightnessctl set +5%"
      ", XF86MonBrightnessDown, exec, ${pkgs.brightnessctl}/bin/brightnessctl set 5%-"

      # Control Volume
      ", XF86AudioRaiseVolume, exec, ${pkgs.pamixer}/bin/pamixer -i 5"
      ", XF86AudioLowerVolume, exec, ${pkgs.pamixer}/bin/pamixer -d 5"
      ", XF86AudioMute, exec, ${pkgs.pamixer}/bin/pamixer -t"
    ];

    bind = [
      # Rebuild NixOS
      "$mod CTRL, R, exec, $terminal $HOME/.dotfiles/scripts/nixrebuild.sh"
      # Update NixOS
      "$mod CTRL, U, exec, $terminal $HOME/.dotfiles/scripts/nixupdate.sh"
      # Clean NixOS
      "$mod CTRL, C, exec, $terminal $HOME/.dotfiles/scripts/nixclean.sh"

      # Override Power-off and Reboot commands
      "$mod SHIFT CTRL, R, exec, systemctl reboot"
      "$mod SHIFT CTRL, P, exec, systemctl poweroff"
      ", XF86PowerOff, exec, "

      # Switch monitor focus
      "$mod SHIFT CTRL, 1, focusmonitor, 1"
      "$mod SHIFT CTRL, 2, focusmonitor, 2"

      # Quit session 
      "$mod SHIFT CTRL, L, exit,"

      # Terminal
      "$mod CTRL, T, exec, $terminal"

      # Manage windows and Move focus
      "$mod SHIFT, Q, killactive,"
      "$mod SHIFT, F, fullscreen,"
      "$mod, left, movefocus, l"
      "$mod, right, movefocus, r"
      "$mod, up, movefocus, u"
      "$mod, down, movefocus, d"
      "$mod SHIFT, P, pseudo # dwindle"
      "$mod, J, togglesplit,"

      # Screenshot, Copy to Clipboard and Save
      "$mod, Print, exec, ${pkgs.grimblast}/bin/grimblast --notify copysave"
      # Screenshot and Copy to Clipboard
      ", Print, exec, ${pkgs.grimblast}/bin/grimblast --notify copy"

      # Set wallpapers
      "$mod CTRL, 1, exec, ${pkgs.swaybg}/bin/swaybg -m fill -i ${wallpaper}"
      "$mod CTRL, 2, exec, ${pkgs.swaybg}/bin/swaybg -m fill -i ${wallpaper2}"

      # Utility
      "$mod SHIFT, H, exec, $terminal ${pkgs.btop}/bin/btop"
      "$mod, N, exec, $terminal nvim"
      "$mod, L, exec, lact"
      "$mod, A, exec, ${pkgs.android-file-transfer}/bin/android-file-transfer"

      # Apps
      "$mod SHIFT, C, exec, cosmic-edit"
      "$mod SHIFT, D, exec, discord"
      "$mod SHIFT, G, exec, gnome-boxes"
      "$mod SHIFT, S, exec, steam"
      "$mod SHIFT, T, exec, ${pkgs.torrential}/bin/com.github.davidmhewitt.torrential"
      "$mod, T, exec, telegram-desktop"
      "$mod, S, exec, spotify"
      "$mod, O, exec, obs"
      "$mod, G, exec, gimp"
      "$mod, I, exec, ${pkgs.jetbrains.idea-community-bin}/bin/idea-community"
      "$mod, H, exec, heroic"
      "$mod, M, exec, prismlauncher"
      "$mod, C, exec, cemu"
      "$mod, D, exec, ${pkgs.dolphin}/bin/dolphin"
      "$mod, B, exec, ${pkgs.brave}/bin/brave"
    ] ++ (
        # workspaces
        # binds $mod + [shift +] {1..10} to [move to] workspace {1..10}
        builtins.concatLists (builtins.genList (
            x: let
              ws = let
                c = (x + 1) / 10;
              in
                builtins.toString (x + 1 - (c * 10));
            in [
              "$mod, ${ws}, workspace, ${toString (x + 1)}"
              "$mod SHIFT, ${ws}, movetoworkspace, ${toString (x + 1)}"
              "$mod CTRL, ${ws}, exec, ${toString (x + 1)}"
              "$mod SHIFT CTRL, ${ws}, exec, ${toString (x + 1)}"
            ]
          )
          10)
      );
  };

  wayland.windowManager.hyprland.extraConfig = ''

    env = GTK_THEME, ${pkgs.nightfox-gtk-theme}/bin/nightfox-gtk-theme

    general {
      # See https://wiki.hyprland.org/Configuring/Variables/ for more

      gaps_in = 5
      gaps_out = 20
      border_size = 2
      col.active_border = rgba(ff6a00d4) rgba(ff42a5ed) 45deg
      col.inactive_border = rgba(595959aa)

      layout = master

      # Please see https://wiki.hyprland.org/Configuring/Tearing/ before you turn this on
      allow_tearing = false

    }

    animations {
      enabled = yes

      # Some default animations, see https://wiki.hyprland.org/Configuring/Animations/ for more
 
      bezier = myBezier, 0.05, 0.9, 0.1, 1.05

      animation = windows, 1, 7, myBezier
      animation = windowsOut, 1, 18, default, popin 80%
      animation = border, 1, 10, default
      animation = borderangle, 1, 8, default
      animation = fade, 1, 7, default
      animation = workspaces, 1, 6, default
    }

    decoration {
      # See https://wiki.hyprland.org/Configuring/Variables/ for more

     rounding = 8
    
     blur {
        enabled = true
        size = 3
        passes = 1
     }

     drop_shadow = yes
     shadow_range = 5
     shadow_render_power = 3
     dim_inactive = false
     dim_strength = 0.3
     col.shadow = rgba(1a1a1aee)
   }

   #plugin {
   #  borders-plus-plus {
   #    add_borders = 1 # 0 - 9
    
   #    # you can add up to 9 borders
   #    col.border_1 = "rgb(ffffff)"
   #    col.border_2 = "rgb(2222ff)"
    
   #    # -1 means "default" as in the one defined in general:border_size
   #    border_size_1 = 10
   #    border_size_2 = -1

   #    # makes outer edges match rounding of the parent. Turn on / off to better understand. Default = on.
   #    natural_rounding = true
   #  }

   #  hyprbars {
   #    # example config
   #    bar_height = 20

   #    # example buttons (R -> L)
   #    # hyprbars-button = color, size, on-click
   #    hyprbars-button = rgb(ff4040), 10, , hyprctl dispatch killactive
   #    hyprbars-button = rgb(eeee11), 10, , hyprctl dispatch fullscreen 1
   #  }
  #}

  ''; 
}
