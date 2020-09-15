dirtyIris <- read.csv("./dirty_iris.csv", header=TRUE, sep=",")

#Replace Inf with NA
dirtyIris$Sepal.Length[!is.finite(dirtyIris$Sepal.Length)]<-NA
dirtyIris$Sepal.Width[!is.finite(dirtyIris$Sepal.Width)]<-NA
dirtyIris$Petal.Length[!is.finite(dirtyIris$Petal.Length)]<-NA
dirtyIris$Petal.Width[!is.finite(dirtyIris$Petal.Width)]<-NA

#Remove Negative Integers
dirtyIris$Sepal.Length[dirtyIris$Sepal.Length<0]<-NA
dirtyIris$Sepal.Width[dirtyIris$Sepal.Width<0]<-NA
dirtyIris$Petal.Length[dirtyIris$Petal.Length<0]<-NA
dirtyIris$Petal.Width[dirtyIris$Petal.Width<0]<-NA

#Replace NA With Column Mean
dirtyIris$Sepal.Length[is.na(dirtyIris$Sepal.Length)]<- mean(dirtyIris$Sepal.Length, na.rm = TRUE)
dirtyIris$Sepal.Width[is.na(dirtyIris$Sepal.Width)]<-  mean(dirtyIris$Sepal.Width, na.rm = TRUE)
dirtyIris$Petal.Length[is.na(dirtyIris$Petal.Length)]<-  mean(dirtyIris$Petal.Length, na.rm = TRUE)
dirtyIris$Petal.Width[is.na(dirtyIris$Petal.Width)]<-  mean(dirtyIris$Petal.Width, na.rm = TRUE)

write.csv(dirtyIris,'./clean_iris.csv', row.names=FALSE)
dirtyIris