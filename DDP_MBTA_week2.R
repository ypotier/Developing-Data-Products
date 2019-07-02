# Week 2 Developer product exercise 
# Create a web page using R Markdown that features a map created with Leaflet.
# Host your webpage on either GitHub Pages, RPubs, or NeoCities.
# Your webpage must contain the date that you created the document, and it must contain a map created with Leaflet. We would love to see you show off your creativity!

# MTBA data: https://www.mbta.com/developers/gtfs 
# MBTA developer tools: https://www.mbta.com/developers 
  
library(leaflet)

# Map the Boston Area
my_map <- leaflet() %>%
  addTiles() %>%
  setView(lng=-71.0589, lat=42.3601 , zoom=12) #  Boston coordinates
my_map

# Load MBTA stops data
stops = read.csv("/Users/potieyo1/Documents/Development/Classes/MBTA_GTFS/stops.txt")
# since the total size is more than 9000 points and it takes time to render, I create a smaller dataset of 1000 rows
sample_data <- stops[c(1:1000),]


my_map <- leaflet(data = sample_data) %>%
  addTiles() %>%
  addMarkers(lng = sample_data$stop_lon,
             lat = sample_data$stop_lat,
             popup = paste("Name", sample_data$stop_name, "<br>",
                           "City:", sample_data$municipality))

my_map
