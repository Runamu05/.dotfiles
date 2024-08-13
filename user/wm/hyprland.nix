{ pkgs, ... }:

{
  wayland.windowManager.hyprland = {
  # Whether to enable Hyprland wayland compositor
  enable = true;
  # The hyprland package to use
  package = pkgs.hyprland;
  # Whether to enable XWayland
  xwayland.enable = true;	
  # Set keyboard layout


  # Optional
  # Whether to enable hyprland-session.target on hyprland startup
  systemd.enable = true;
  # Whether to enable patching wlroots for better Nvidia support
  #enableNvidiaPatches = true;
  };

  wayland.windowManager.hyprland.settings = {
    "$mod" = "SUPER";
    "$terminal" = "${pkgs.alacritty}/bin/alacritty";

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
      # Override Power-off and Reboot commands
      "$mod SHIFT, R, exec, systemctl reboot"
      "$mod SHIFT, P, exec, systemctl poweroff"
      ", XF86PowerOff, exec, "

      # Quit session 
      "$mod, L, exit,"

      # Terminal
      "$mod SHIFT, T, exec, $terminal"

      # Rebuild NixOS
      "$mod SHIFT CTRL, R, exec, $terminal -e nu -c sudo nixos-rebuild switch --flake ~/.dotfiles/.#system --show-trace && home-manager switch --flake ~/.dotfiles#user --show-trace"
      # Update NixOS
      "$mod SHIFT CTRL, U, exec, $terminal -e nu -c nix flake update ~/.dotfiles --show-trace"
      # Clean NixOS
      "$mod SHIFT CTRL, C, exec, $terminal -e nu -c sudo nix-collect-garbage --delete-old --show-trace"

      # Manage windows and Move focus
      "$mod, Q, killactive,"
      "$mod, left, movefocus, l"
      "$mod, right, movefocus, r"
      "$mod, up, movefocus, u"
      "$mod, down, movefocus, d"
      "$mod, P, pseudo # dwindle"
      "$mod, J, togglesplit,"

  
      # Screenshot and Save
      "$mod, Print, exec, ${pkgs.hyprshot}/bin/hyprshot -m output"
      # Screenshot and Copy to Clipboard
      ", Print, exec, ${pkgs.hyprshot}/bin/hyprshot -m output --clipboard-only" 

      # Utility
      "$mod SHIFT, H, exec, $terminal -e nu -c ${pkgs.btop}/bin/btop"
      "$mod SHIFT, C, exec, corectrl"

      # Apps
      "$mod, T, exec, telegram-desktop"
      "$mod, S, exec, spotify"
      "$mod, O, exec, obs"
      "$mod SHIFT, S, exec, gamemoderun steam"
      "$mod, C, exec, cemu"
      "$mod, D, exec, dolphin"
      "$mod, B, exec, brave"
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
              "$mod SHIFT CTRL, ${ws}, movetoworkspace, ${toString (x + 1)}"
            ]
          )
          10)
      );
  };

  wayland.windowManager.hyprland.extraConfig = ''
    input {
      kb_layout = de
        kb_variant = nodeadkeys
    }

    monitor = , highres, auto, 1 
    env = XCURSOR_SIZE, 24 

    exec = ${pkgs.swaybg}/bin/swaybg -m fill -i ${/home/runamu/Scrivania/trainsunset.jpg}

    general {
      # See https://wiki.hyprland.org/Configuring/Variables/ for more

      gaps_in = 5
      gaps_out = 20
      border_size = 2
      col.active_border = rgba(ff6a00d4) rgba(ff42a5ed) 45deg
      col.inactive_border = rgba(595959aa)

      layout = dwindle

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

  ''; 
}
