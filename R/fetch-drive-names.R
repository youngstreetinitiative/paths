
#' Fetch the name of the second HD as a string
#'
#' @name fetch_second_drive
#' @return Name as a string in the form "x:"
#' @export


fetch_second_drive <- function() {

  second_drive <<- system("wmic LOGICALDISK LIST BRIEF", intern = T) %>%
    as.list() %>%
    map(~str_split(., " ") %>%
          unlist()) %>%
    lapply(function(x) {x[x != ""]}) %>%
    tibble(DeviceID = map(., 1),
           Used = map(., 3)) %>%
    select(DeviceID, Used) %>%
    filter(str_count(DeviceID) == 2) %>%
    filter(str_count(Used) > 1) %>%
    pull(DeviceID) %>%
    .[[2]]
}
