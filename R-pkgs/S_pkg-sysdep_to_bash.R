#!/usr/bin/env Rscript

my_os <- 'ubuntu'
os_release <- '20.04'
pkgs <- readLines('pkgs_to_install.txt')

commands <- remotes::system_requirements(
  os = my_os, 
  os_release = os_release, 
  package = pkgs
  )

cli::cli_alert_success("got {length(commands)} commands! to run")




