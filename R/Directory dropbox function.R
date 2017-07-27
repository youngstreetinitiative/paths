## Load from dropbox function

#' @name DropboxDirFN
#' @param DropboxOrigin Directory of the Dropbox folder for this project.
#' @return Sends 2 strings to the global environment identifying the directory path name of the user and the dropbox folder.
#' @export

DropboxDirFN <- function(DropboxOrigin=NULL){
  if(is.character(DropboxOrigin)){
    UserDir <<- stringr::str_c(stringr::str_split(getwd(),"/")[[1]][1:3],collapse="/")
    DropboxDir <<- as.character(glue::glue("{UserDir}/{DropboxOrigin}"))
  }else{message("DropboxOrigin is missing. Please specify the dropbox folder for this project.")}
}




#' @name CSVReadInFN
#' @param SourceFolder Folder within the DropboxOrigin folder to draw data from. Example: "Houses and wages/R CSV files"
#' @param FilesList List of .csv file names to pull into session. Example: c("Speadsheet1","Speadsheet2","Speadsheet3")
#' @return Several data frames from a dropbox folder to the global environment.
#' @export
CSVReadInFN <- function(SourceFolder=NULL,FilesList=NULL){
  if(is.character(DropboxDir)){
    if(is.character(SourceFolder)){
      if(is.character(FilesList)){
        for (i in 1:length(FilesList)){
          assign(stringr::str_replace_all(FilesList[i]," ","_"),
                 read.csv(glue::glue("{DropboxDir}/{SourceFolder}/{FilesList[i]}.csv")),
                 envir=.GlobalEnv)
          }
        }else{message("FilesList is not working. Please construct a list of .csv files to read in.")}
    }else{ message("SourceFolder is not working. Source folder directory for files now found.")}
  }else{ message("DropboxDir is not working. Try running DropboxDirFN() again.")}
}


