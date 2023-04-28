#' @export
read_rtf_header <- function(file) {
  read_rtf(file, destinations = setdiff(.destinations, 'header')) %>%
    read_until("") %>%
    stringr::str_replace_all(
      stringr::str_c("\\*\\|","\\|","Page","  of", sep="|"), ''
    ) %>%
    stringr::str_trim()
}

#' @export
read_rtf_footer <- function(file) {
  read_rtf(file, ignore_tables=T, destinations = setdiff(.destinations, 'footer'))[2]
}

#' @export
read_until <- function(c, s = "") {
  c[1:(which(c == s)-1)]
}
