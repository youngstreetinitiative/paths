.onLoad <- function(libname, pkgname) {
  UserDir <<- stringr::str_c(stringr::str_split(getwd(),"/")[[1]][1:3],collapse="/")
}
