#!/usr/bin/env Rscript

args = commandArgs(trailingOnly=TRUE)
my_pkg_to_install <- args[1]

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
  
  try({
  install.packages(pkg, quiet = TRUE, 
                   lib = my_local_lib)
  })
  
  # check if already installed
  flag <- check_installed(pkg)
  
  if (flag) {
    message(' -> Success')
    status <- 'sucess'
  } else {
    message(' -> Failed')
    status <- 'failed'
  }
  
  return(invisible(data.frame(pkg, 
                              status=status)))
}

check_installed <- function(pkg) {
  pkg_installed <- installed.packages()[, 1]
  if (pkg %in% pkg_installed) {
    return(TRUE)
  }  else {
      return(FALSE)
    }
  }

my_install_pkg(my_pkg_to_install)