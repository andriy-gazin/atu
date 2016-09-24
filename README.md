# atu
tools for getting geodata from ATU map

```r
get_geometry(id)
```

id is taken from ATU register (bunch of ids already collected and stored in data folder)

function returns dataframe with name and WKT representation of region, city, district

You can convert WKT representation to geojson with [wellknown package](https://cran.r-project.org/web/packages/wellknown/README.html)

Alternatively you can use [rgeos](https://cran.r-project.org/web/packages/rgeos/index.html)::readWKT() function

## to do

* develop tools for gathering data and converting it to geojson or shp  
* gather all data and pack it into geojson and shp for wide usage in mapping projects  


