# It contains the name, age, gender, country, city and state (where available), times at 9 different stages of the race, expected time, finish time and pace, overall place, gender place and division place.
# https://www.kaggle.com/rojour/finishers-boston-marathon-2017

# http://weartested.org/boston-marathon-2017

library(here)


# Read CSV into R
bm2017=here::here("marathon_results_2017.csv")
MarathonData <- read.csv(bm2017, header=TRUE, sep=",")

# General stats ()
TotalFinisher = max(MarathonData$Overall)
summary(MarathonData$M.F)

countries <- MarathonData$Country
NumberCountries = length(unique(countries))

if (MarathonData$Country == 'USA'){
  states <- MarathonData$State
  NumberStates = length((unique(states)))
}


# top ten males (histogram horizontal 0 being first)

# top ten females (histogram horizontal 0 being first)


# Have a scroll thingy for it
# finishers by age group males (histogram horizontal)

# finishers by age group females (histogram horizontal)
  
# Finishers by Country

# Finishers by States

# box plot finishers by country (males and females?)

# box plot, distribution by age