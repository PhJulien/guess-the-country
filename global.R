library(maps)

country_list <- c("", sort(unique(iso3166$sovereignty)))
country_list2 <- sort(unique(iso3166$sovereignty))

streak_to_icons <- c("Yes"="<strong style='color:green;'>Y</strong>", "No"="<strong style='color:red;'>N</strong>")

### To do: remove regions not recognised by the map function