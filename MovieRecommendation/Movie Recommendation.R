
#Introduction

#The goal of this project is to find out similarities within groups of people in order to build a movie recommending system for users. We are going to analyze a dataset from movielens database to explore the characteristics that people share in movies’ taste, based on how they rate them.

#GETTING AND CLEANING DATA
movies <- read.table("movielens.txt",header=FALSE,sep="|",quote = "\"")
str(movies)

colnames(movies) <- c("ID","Title","ReleaseDate","VideoReleasedate","IMDB","Unknown","Action","Adventure","Animation","Childrens","Comedy","Crime","Documentary","Drama","Fantasy","FilmNoir","Horror","Musical","Mystery","Romance","SciFi","Thriller","War","Western")
str(movies)

movies$ID=NULL
movies$ReleaseDate=NULL
movies$VideoReleasedate=NULL
movies$IMDB=NULL
movies <- unique(movies)
str(movies)

#HIERARCHICAL CLUSTERING

distances <- dist(movies[2:20],method="euclidean")
clustermovies <-hclust(distances,method = "ward.D")
plot(clustermovies)


clustergroups <- cutree(clustermovies,k = 10)

tapply(movies$Action, clustergroups, mean)

tapply(movies$Animation, clustergroups, mean)

# When the user selects a random movie we use clustering to predict movies the user is likely to enjoy based on the cluster analysis
subset(movies, Title == "G.I. Jane (1997)")

clustergroups[326]

cluster2 <- subset(movies, clustergroups == 3)
cluster2$Title[1:20]

#Based on the analysis, the user is likely to enjoy the following movies 



