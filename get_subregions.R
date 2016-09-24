library(rvest)
library(stringr)

get_subregions <- function(url) {
  
  page <- html_session(url)
  
  name <- page %>% 
    html_nodes(".ad-center-on-map+ a") %>% 
    html_text()
  
  url <- page %>% 
    html_nodes(".ad-center-on-map+ a") %>% 
    html_attr("href")
  url <- paste("http://atu.minregion.gov.ua", url, sep = "")
  
  id <- url %>% str_extract(pattern = "\\d+?$")
  
  subregions <- data.frame(id, name, url)
  
  return(subregions)
  
}