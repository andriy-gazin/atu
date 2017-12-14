library(rvest)
library(stringr)

get_regions <- function() {
  
  startpage <- html_session('http://atu.minregion.gov.ua/ua/ustriy_page/64')
  
  name <- startpage %>% 
  html_nodes('.regions-list a') %>% 
  html_text()
  
  url <- startpage %>% 
  html_nodes('.regions-list a') %>% 
  html_attr('href')
  
  url <- paste0('http://atu.minregion.gov.ua', url)
  
  id <- url %>% str_extract(pattern = '\\d+?$')
  
  regions <- data.frame(id, name, url, stringsAsFactors = F)
  
  return(regions)
  
}

  
  