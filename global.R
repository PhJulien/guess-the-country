library(maps)

country_list <- c("", sort(unique(iso3166$sovereignty)))
country_list2 <- sort(unique(iso3166$sovereignty))

### To do: remove regions not recognised by the map function