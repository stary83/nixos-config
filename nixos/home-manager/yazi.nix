{ pkgs, inputs, ... }: let
	yazi-plugins = pkgs.fetchFromGitHub {
		owner = "yazi-rs";
		repo = "plugins";
		rev = "9166202cc1694c98bac3a639874d6f4c0eaa2dab";
		hash = "sha256-3ddGRQSzxyurNcyYJA+9LTLXTCjBFGATTqdkuGKixzA=";
	};
in {
	programs.yazi = {
		enable = true;
    package = inputs.yazi.packages.${pkgs.stdenv.hostPlatform.system}.default;

		shellWrapperName = "y";

		settings = {
			mgr = {
				show_hidden = true;
			};
			preview = {
				max_width = 1000;
				max_height = 1000;
			};
		};

		plugins = {
			# chmod = "${yazi-plugins}/chmod.yazi";
			full-border = "${yazi-plugins}/full-border.yazi";
			toggle-pane = "${yazi-plugins}/toggle-pane.yazi";
			#starship = pkgs.fetchFromGitHub {
			#	 owner = "Rolv-Apneseth";
			#	 repo = "starship.yazi";
			#	 rev = "...";
			#	 sha256 = "sha256-...";
			#};
		};

		initLua = ''
			require("full-border"):setup()
			
		'';
    # require("starship"):setup()

		keymap = {
			mgr.prepend_keymap = [
				{
					on = "T";
					run = "plugin toggle-pane max-preview";
					desc = "Maximize or restore the preview pane";
				}
				#{
				#	 on = ["c" "m"];
				#	 run = "plugin chmod";
				#	 desc = "Chmod on selected files";
				#}
			];
		};
	};
}