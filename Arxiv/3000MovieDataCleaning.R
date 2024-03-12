library(readr)
library(dplyr)


Movies3000DF <- read.csv('MovieReviews.csv')

Movie_X <- Movies3000DF %>%
  mutate(Date = dmy(Date)) %>%
  mutate(Date = format(Date, "%d/%m/%Y")
 
typeof(Movie_X$Date)      


Movies_X %>% 
 removeSpace <- grepl("^\n",stars)%>%
 remove10 <-  grepl("^/10",stars)


