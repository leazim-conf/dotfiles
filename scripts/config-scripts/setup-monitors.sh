#!/bin/bash
source $HOME/.config/scripts/setup-scripts/logs.sh
log_file="$HOME/.local/share/logs/xrandr.log"

declare -A resolutions
resolutions=(
  ["HDMI-1"]="1920x1080" 
  ["DP-1"]="1366x768"
  ["eDP-1"]="1366x768"
)

function shutdown_monitor() {
  local monitor="$1"
  
  if [[ -z "${monitor}" ]]; then
    log_info "Cant find monitor: $monitor" "$log_file"
    return
  fi

  xrandr --output "$monitor" --off
  log_info "Turn off monitor: $monitor" "$log_file"

}

function setup_monitors() {
  
  local monitors=$(xrandr | grep " connected" | cut -d' ' -f1)
  
  for monitor in $monitors; do 
    
  if [[ -z "${resolutions[$monitor]}" ]]; then
    log_info "Any resolution defined to monitor: $monitor" "$log_file"
    continue
  fi

  xrandr --output "$monitor" --mode "${resolutions[$monitor]}"
  log_info "Applied resolution: ${resolutions[$monitor]} to $monitor" "$log_file"

  done
}

function configuration() {
  
  setup_monitors
  
  if [[ -n $(xrandr | grep "HDMI-1 connected")  ]]; then
    shutdown_monitor "eDP-1"
    return
  fi
  log_info "Set up all monitors" "${log_file}"
}

configuration
