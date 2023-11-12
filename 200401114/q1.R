download.file("https://raw.githubusercontent.com/scizmeli/Red/master/MapsThatChangedOurWorld_StoryMap_Data.csv", "MapsThatChangedOurWorld_StoryMap_Data.csv")

maps <- read.csv(url("https://raw.githubusercontent.com/scizmeli/Red/master/MapsThatChangedOurWorld_StoryMap_Data.csv"), header=TRUE , sep=";")


maps$Latitude<-gsub("N","",as.character(maps$Latitude))


idx <- which(grepl("W", maps$Longitude)==TRUE)
maps$Longitude<-gsub("E","",as.character(maps$Longitude))

maps$Longitude<-gsub("W","",as.character(maps$Longitude))

maps$Year<-gsub("AD", "", as.character(maps$Year))



maps$Longitude <- as.numeric(maps$Longitude)
maps$Latitude <- as.numeric(maps$Latitude)

hist(as.numeric(maps$Year))

maps$Year <- as.numeric(maps$Year)
maps$Longitude[idx] <- maps$Longitude[idx] * -1

finalResult <- data.frame(Longitude = maps$Longitude, Latitude = maps$Latitude, Year= maps$Year)
