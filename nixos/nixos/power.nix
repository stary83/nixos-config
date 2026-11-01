{ pkgs, ... }:
{
  powerManagement = {
    powertop.enable = true;
  };

  services.logind.settings.Login = {
    HandleLidSwitch = "ignore";
    HandleLidSwitchExternalPower = "ignore";
    HandleLidSwitchDocked = "ignore";

    HandleSuspendKey = "ignore";
    HandleHibernateKey = "ignore";

    IdleAction = "ignore";
  };

  # Disable systemd-managed sleep operations entirely.
  # It doesn't work on laptop.
  systemd.sleep.settings.Sleep = {
    AllowSuspend = "no";
    AllowHibernation = "no";
    AllowHybridSleep = "no";
    AllowSuspendThenHibernate = "no";
  };

}