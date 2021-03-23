

my_f <- '~/.config/rstudio/rstudio-prefs.json'

config <- fromJSON(my_f)

config$save_workspace <- 'never'
config$always_save_history <- 'false'
config$load_workspace <- 'false'
config$editor_theme <- 'Merbivore'
config$panes$additional_source_columns <- 1

txt_out <- toJSON(config, pretty = TRUE)

cat(txt_out, file = '~/testing2.json')
write_json(x = txt_out, path = '~/testing.json')
