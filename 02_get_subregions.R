library(rvest)
library(stringr)

get_subregions <- function(regions){
  
  subregions <- data.frame()
  
  for(i in 1:nrow(regions)) {
    
    url <- paste0('http://atu.minregion.gov.ua/ua/ustriy_page/', regions$id[i])
    
    message(paste('getting data for', regions$name[i]))
    
    startpage <- html_session(url)
    
    name <- startpage %>% 
      html_nodes('.ad-center-on-map+ a') %>% 
      html_text()
    
    if(length(name) == 0) {
      
      next
      
    } else {
      
      url <- startpage %>% 
        html_nodes('.ad-center-on-map+ a') %>% 
        html_attr('href')
      
      url <- paste('http://atu.minregion.gov.ua', url, sep = '')
      
      id <- url %>% str_extract(pattern = '\\d+?$')
      
      under <- regions$name[i]
      
      under_id <- regions$id[i]
      
      df <- data.frame(id, name, url, under, under_id, stringsAsFactors = F)
      
      subregions <- rbind.data.frame(subregions, df)
      
      Sys.sleep(1)
      
    }
    
  }
  
  return(subregions)
  
}
