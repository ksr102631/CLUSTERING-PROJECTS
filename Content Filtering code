
## CLUSTERING

# Normalization is necessary for Clustering problems, if variables are not on the same scale



# Loading a Text File

movies = read.table("movieLens.txt", header=FALSE, sep="|",quote="\"")

# quote argument - To make sure that our Text was read in properly

str(movies)

# Add column names as there is no Header for the text file 
colnames(movies) = c("ID", "Title", "ReleaseDate", "VideoReleaseDate", "IMDB", "Unknown", "Action", "Adventure", "Animation", "Childrens", "Comedy", "Crime", "Documentary", "Drama", "Fantasy", "FilmNoir", "Horror", "Musical", "Mystery", "Romance", "SciFi", "Thriller", "War", "Western")

str(movies)
   
# Remove unnecessary variables

movies$ID = NULL
movies$ReleaseDate = NULL
movies$VideoReleaseDate = NULL
movies$IMDB = NULL

# Remove duplicates
movies = unique(movies)

# Take a look at our data again:
str(movies)



# Compute distances
distances = dist(movies[2:20], method = "euclidean")

# Hierarchical clustering
clusterMovies = hclust(distances, method = "ward") 

# Plot the dendrogram
plot(clusterMovies)

# Assign points to clusters
clusterGroups = cutree(clusterMovies, k = 10)

# K value tells the number of clusters we want and is based on the Business problem statement

#Now let's figure out what the clusters are like.

# Let's use the tapply function to compute the percentage of movies in each genre and cluster

tapply(movies$Action, clusterGroups, mean)
tapply(movies$Romance, clusterGroups, mean)

# We can repeat this for each genre. If you do, you get the results in ClusterMeans.ods


# Find which cluster Apollo 13 (1995) is in.

subset(movies, Title=="Apollo 13 (1995)") # 28
clusterGroups[28] # Cluster 2

# Create a new data set with just the movies from cluster 2
cluster2 = subset(movies, clusterGroups==2)

# Look at the first 10 titles in this cluster:
cluster2$Title[1:10]

## Recommend these movies to thoose who liked/watched Apollo 13 movie

