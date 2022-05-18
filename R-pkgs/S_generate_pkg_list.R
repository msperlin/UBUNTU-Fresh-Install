library(dplyr)

my_d <- rstudioapi::getActiveDocumentContext()$path
setwd(dirname(my_d))

options(renv.config.dependencies.limit = Inf)

n_to_colect <- 75 # number of pkgs to collect (most to least frequent)
target_dir <- '~/Dropbox/'

df <- renv::dependencies(target_dir)

tbl_pkgs <- df %>%
  group_by(Package) %>%
  count() %>%
  arrange(-n) %>%
  #view() %>%
  ungroup() %>%
  slice(1:n_to_colect)

pkgs <- tbl_pkgs$Package

# remote those not in CRAN
inCRAN <- available.packages()

idx <- pkgs %in% inCRAN[, 1]
pkgs <- pkgs[idx]

writeLines(pkgs, con = 'pkgs_to_install.txt')
