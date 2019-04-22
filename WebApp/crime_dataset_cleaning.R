crime <- read.csv("datasets/incident_reports.csv")
View(crime)

data <- crime[c(1,6,15:17,19,21:22, 24:25)]
data <- subset(data, Analysis.Neighborhood != "")
data <- subset(data, Analysis.Neighborhood != "null")
#count(data, Analysis.Neighborhood == "Mission")
View(data)
head(data)
colnames(data)
colClean <- function(x){ colnames(x) <- gsub("\\.", "_", colnames(x)); x } 
data <- colClean(data)
write.csv(data, file = "datasets/cleaned_incident_reports.csv")

cleaned <- read.csv("datasets/cleaned_incident_reports.csv")

levels(cleaned$Analysis_Neighborhood)[levels(cleaned$Analysis_Neighborhood)=="Bayview Hunters Point"] <- "Bayview"
levels(cleaned$Analysis_Neighborhood)[levels(cleaned$Analysis_Neighborhood)=="Financial District/South Beach"] <- "Financial District"
levels(cleaned$Analysis_Neighborhood)[levels(cleaned$Analysis_Neighborhood)=="Oceanview/Merced/Ingleside"] <- "Oceanview"
levels(cleaned$Analysis_Neighborhood)[levels(cleaned$Analysis_Neighborhood)=="Treasure Island"] <- "Treasure Island/YBI"

View(cleaned)
levels(cleaned$Analysis_Neighborhood)

countData <- table(cleaned$Analysis_Neighborhood)
View(countData)
write.csv(countData, file = "datasets/count.csv")

