#!/usr/bin/env Rscript

args = commandArgs(trailingOnly=TRUE)
my_pkg_to_install <- args[1]

#check if remotes is installed

my_local_lib <- Sys.getenv('R_LIBS_USER')
lib_install <- my_local_lib

if (!dir.exists(lib_install)) dir.create(lib_install, recursive = TRUE)

my_install_pkg <- function(pkg) {
  
  # check if already installed
  message(paste0('\t', pkg), appendLF = FALSE)
  flag <- check_installed(pkg)
  if (flag) {
    message(' -> already installed', appendLF = TRUE)
    return(invisible(data.frame(pkg, 
                                status='already installed')))
  }

  #cli::cli_alert("Checking system deps")

  # # system dependencies
  # deps <- remotes::system_requirements(
  #   os = "ubuntu",
  #   os_release = "20.04",
  #   package = pkg )
  # 
  # if (length(deps) == 0) {
  #   cli::cli_alert_success("\tfound no sys deps")
  # } else {
  #   cli::cli_alert_success("\tfound {length(deps)} sys deps to install")
  # }
  # 
  # for (i_com in deps) {
  #   cli::cli_alert_info("Running {i_com}")
  #   system(paste0("sudo -kS ", i_com), input = sudo_pass)
  # }
  
  try({

    n_cpus <- parallel::detectCores() - 1

    install.packages(pkg, quiet = TRUE, 
                   lib = my_local_lib,
                   Ncpus = n_cpus)
  })
  
  # check if already installed
  flag <- check_installed(pkg)
  
  if (flag) {
    cli::cli_alert_success('\tsuccess')
  } else {
    cli::cli_alert_danger('\tfailed :(')
  }
  
  return(invisible(TRUE))
}

check_installed <- function(pkg) {
  pkg_installed <- installed.packages()[, 1]
  if (pkg %in% pkg_installed) {
    return(TRUE)
  }  else {
      return(FALSE)
    }
  }

if (!check_installed("remotes")) install.packages("remotes")
if (!check_installed("cli")) install.packages("cli")

my_install_pkg(my_pkg_to_install)