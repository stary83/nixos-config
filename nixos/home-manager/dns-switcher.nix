
{ pkgs, ... }:

let
  dns-switcher = pkgs.writeScriptBin "dns-switcher" ''
    #!${pkgs.bash}/bin/bash

    dns_list_file="/etc/nixos/resources/dots/dns-switcher/dns_list.txt"

    get_active_connection() {
      nmcli -t -f NAME,DEVICE,TYPE connection show --active 2>/dev/null |
        grep -v ':lo:' |
        head -n1 |
        cut -d: -f1
    }

    conn=$(get_active_connection)

    if [[ -z "$conn" ]]; then
      echo "Error: No active network connection found." >&2
      exit 1
    fi

    if [[ ! -r "$dns_list_file" ]]; then
      echo "Error: Cannot read DNS list: $dns_list_file" >&2
      exit 1
    fi

    reset="revert to DHCP/default"

    # Read DNS options from the existing text file.
    mapfile -t dns_entries < "$dns_list_file"
    options=("$reset" "''${dns_entries[@]}")

    # Show the menu using Fuzzel's existing theme.
    chosen=$(
      printf '%s\n' "''${options[@]}" |
        ${pkgs.fuzzel}/bin/fuzzel \
          --dmenu \
          --prompt="DNS: " \
          --width=42 \
          --minimal-lines \
          --no-sort
    ) || exit 0

    # Fuzzel can return text typed by the user even when it
    # does not match an entry. Only accept an actual menu entry.
    valid_choice=false
    for option in "''${options[@]}"; do
      if [[ "$chosen" == "$option" ]]; then
        valid_choice=true
        break
      fi
    done

    if [[ "$valid_choice" != true ]]; then
      exit 0
    fi

    set_dns() {
      local conn="$1"
      local dns_servers="$2"

      if [[ -z "$dns_servers" ]]; then
        echo "Clearing custom DNS for '$conn'"

        nmcli connection modify "$conn" ipv4.ignore-auto-dns no &&
          nmcli connection modify "$conn" ipv4.dns "" ||
          return 1
      else
        echo "Setting DNS for '$conn' to: $dns_servers"

        nmcli connection modify "$conn" ipv4.ignore-auto-dns yes &&
          nmcli connection modify "$conn" ipv4.dns "$dns_servers" ||
          return 1
      fi

      # Reactivate the connection to apply the change.
      nmcli connection up "$conn"
    }

    if [[ "$chosen" == "$reset" ]]; then
      set_dns "$conn" ""
    else
      # Expected entry format: Provider -> IP, IP
      dns_servers="''${chosen##*-> }"
      set_dns "$conn" "$dns_servers"
    fi
  '';

in {
  home.packages = [
    dns-switcher
  ];
}
