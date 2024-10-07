#!/bin/bash 

function logger() {
  local type="$1"
  local message="$2"
  local log_file="$3"
  local timestemp=$(date +"%d/%m/%Y %H:%M:%S")
  printf "[%s] [%s]: %s\n" "$type" "$timestemp" "$message" >> ${log_file}
}

function log_info() {
  logger "INFO" "$1" "$2"
}

function log_error() {
  logger "ERROR" "$1" "$2"
}
