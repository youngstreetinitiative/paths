
#' Fetch the name of the second HD as a string
#'
#' @name fetch_second_drive
#' @return Name as a string in the form "x:"
#' @importFrom magrittr %>%
#' @export


fetch_second_drive <- function() {

  second_drive <<- system("wmic LOGICALDISK LIST BRIEF", intern = T) %>%
    as.list() %>%
    purrr::map(~stringr::str_split(., " ") %>%
          unlist()) %>%
    lapply(function(x) {x[x != ""]}) %>%
    tibble::tibble(DeviceID = purrr::map(., 1),
           Used = purrr::map(., 3)) %>%
    dplyr::select(DeviceID, Used) %>%
    dplyr::filter(stringr::str_count(DeviceID) == 2) %>%
    dplyr::filter(stringr::str_count(Used) > 1) %>%
    dplyr::pull(DeviceID) %>%
    .[[2]]
}
