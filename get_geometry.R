library(stringr)
library(jsonlite)

get_geometry <- function(id) {
  
  url = paste("http://atu.minregion.gov.ua/api/format/region_template/ato.ato_level_territory_view/atoid/", id, "/wkb_geometry,name_fullua", sep = "")
  
  page <- readLines(con = url)
  
  geometry <- str_extract(string = page, pattern = '(\\{\\"wkb_geometry\\":.+)') %>% 
    str_replace("\\}$", "") %>% 
    fromJSON() %>% 
    rbind.data.frame(stringsAsFactors = FALSE)
  
  geometry$id <- id
  
  return(geometry)
}