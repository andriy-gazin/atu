library(httr)
library(jsonlite)

download_json <- function(ids, folder = '') {
  
  for(id in ids) {
    
    request <- GET(url = 'http://atu.minregion.gov.ua/api-user/map-info',
                   query = list(id = id,
                                layer = '7376316114267884',
                                wrap = 'map_obj_info_wrap_ato'))
    
    message(paste('downloading data for id', id))
    
    if(status_code(request) != 200) {
      
      message(paste('Error, status code', status_code(request)))
      
      write.table(id, file = 'errors.csv', append = T, 
                  row.names = F, col.names = F)
      
      next
      
    } else {
      
      response <- content(request, as = 'text')
      
      write_json(response, path = paste0(folder, id, '.json'))
      
      Sys.sleep(1)
      
    }
    
    
  }

}