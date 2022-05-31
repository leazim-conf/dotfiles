local filesystem = require("gears.filesystem")
local config_dir = filesystem.get_configuration_dir()

return {
	-- Default Applications
	default = {
		-- Default terminal emulator
		terminal = "alacritty",
		-- Defalut music client
    --music_player = "alacritty --class music -e spotify",
		-- Default text editor
		text_editor = "alacritty -e nvim",
		-- Default code editor
		code_editor = "alacritty -e nvim",
		-- Default web browser
		web_browser = "brave",
		-- Default file manager
		file_manager = "alacritty -e ranger .",
		-- Default dmenu global menu
		app_launcher = "~/.config/scripts/config-scripts/dmenu-binaries.sh",
	},

	-- List of apps to start once on start-up
	run_on_start_up = {
		-- Compositor
		"~/.config/scripts/config-scripts/picom_toggle.sh",
	},
}

