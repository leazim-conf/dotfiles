#!/bin/bash

source ./logs.sh
source ./directorys.sh

function creat_files() {
  local path_log=$BASE_PATH
  local file_path_misc="${path_log}/misc.log"
  
  if [[ ! -e $path_log ]]; then
    mkdir -pv $path_log
    touch ${file_path_misc}
    log_info "Create directory ${path_log}" $file_path_misc
    log_info "Create file misc.log at ${path_log}" $file_path_misc
  fi

  for file_name in "${!log_files[@]}"; do 
    
    if [[ ! -f ${log_files[$file_name]} ]]; then
      touch ${log_files[$file_name]}
      log_info "Create file ${file_name}.log at ${path_log}" $file_path_misc
      continue
    fi

    log_info "Try create file ${file_name} at ${path_log}, file aready exist!" $file_path_misc
  
  done
}

creat_files
