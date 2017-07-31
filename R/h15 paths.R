
#' Saves all required file paths to parent envrioment
#'
#' Uses the ysi \code{paths} library and functions to write file paths strings to parent envrioment.
#'
#' @name h15_paths
#' @return Multiple paths as string objects
#' @export

h15_paths <- function(){
  paths::DropboxDirFN("Dropbox (YSI)/YSI Team Folder/Content/R/HILDA Index/")
  paths::fetch_second_drive()
  index.path <<- glue::glue("{DropboxDir}xwave index.csv")
  archive.path <<-  glue::glue("{DropboxDir}archive/xwave index.csv")
}
