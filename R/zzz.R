.onLoad <- function(libname, pkgname) {
  if(stringr::str_detect(getwd(), "Dropbox")){
    Pos <- ((getwd() %>%
               stringr::str_split("/"))[[1]] %>%
              stringr::str_detect("Dropbox") %>%
              which)[1] - 1
    UserDir <<- (getwd() %>%
                   stringr::str_split("/"))[[1]][1:Pos] %>%
      stringr::str_c(collapse = "/")
  }else{
    UserDir <<- (getwd() %>%
                   stringr::str_split("/"))[[1]][1:3] %>%
      stringr::str_c(collapse = "/")
  }
}
