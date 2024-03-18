library(readr)
library(dplyr)
library(lubridate)
library(stringr)

#import the csv file into an objcet
Movies3000DF <- read.csv('MovieReviews.csv')

#change the format of the date column to date
Movies3000DF$Date <- dmy(Movies3000DF$Date)

#checking for the data type of date
class(Movies3000DF$Date)

#converting the star rating from character to 
as.character(Movies3000DF)
Movies3000DF$Stars <- gsub("/10", "",Movies3000DF$Stars)
View(Movies3000DF)

#remove the white spaces and \n in the stars column 
Remove <- grepl("\\s+|\n", Movies3000DF$Stars)
Movies3000DF$Stars <- gsub("\\s+|\n", "", Movies3000DF$Stars)
Movies3000DF$Title <- gsub("\\s+|\n", "", Movies3000DF$Title)

#convert the stars column into a numeric data type
Movies3000DF$Stars <- as.numeric(Movies3000DF$Stars)


View(Movies3000DF)

#lowercase the columns 
Movies3000DF$Movie_Title <- tolower(Movies3000DF$Movie_Title)
Movies3000DF$Title <- tolower(Movies3000DF$Title) 
Movies3000DF$User <- tolower(Movies3000DF$User)
Movies3000DF$Content <- tolower(Movies3000DF$Content)

#remove emoticons using stringr package
Movies3000DF$Content <-  str_remove_all(Movies3000DF$Content, "[\\U0001F600-\\U0001F64F]")
Movies3000DF$Title <- str_remove_all(Movies3000DF$Title, "[\\U0001F600-\\U0001F64F]")
Movies3000DF$User <- str_remove_all(Movies3000DF$User, "[\\U0001F600-\\U0001F64F]")

View(Movies3000DF)

write.csv(Movies3000DF,file ="Movie3000_DataCleaning.csv")

print(Movies3000DF$Content)
