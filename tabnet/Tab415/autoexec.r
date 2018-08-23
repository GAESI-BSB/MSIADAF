# Necessária a partir da release 1.9.0 pela reorganização das bibliotecas carregadas em modo batch
if ((R.version$major == "1" & R.version$minor >= "9.0") || R.version$major >= "2") {
    library(stats)
    library(utils)
    library(graphics)
    library(grDevices)
}
