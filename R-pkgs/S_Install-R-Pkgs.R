#!/usr/bin/env Rscript

lib_install <- Sys.getenv('R_LIBS_USER')

if (!dir.exists(lib_install)) dir.create(lib_install)

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
  install.packages(pkg, quiet = TRUE)
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

# get list of pkgs
suppressWarnings({ 
pkgs_to_install <- readLines('R-pkgs/pkgs_to_install.txt')
})

out <- lapply(pkgs_to_install, my_install_pkg)

