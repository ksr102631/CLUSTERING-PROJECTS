

##  Reading in the healthy image 

healthy = read.csv("healthy.csv", header=FALSE)
healthyMatrix = as.matrix(healthy)
str(healthyMatrix)

# Plot image
image(healthyMatrix,axes=FALSE,col=grey(seq(0,1,length=256))) ## Images must be in matrix form only 

# Hierarchial clustering
healthyVector = as.vector(healthyMatrix)


distance = dist(healthyVector, method = "euclidean")

## Error as the data set is really hughe as so we need to apply K-Mean clustering technique


str(healthyVector)


# Specify number of clusters
k = 5

# Run k-means
set.seed(1)
KMC = kmeans(healthyVector, centers = k, iter.max = 1000)
str(KMC)

# Extract clusters
healthyClusters = KMC$cluster
KMC$centers[2]

# Plot the image with the clusters
dim(healthyClusters) = c(nrow(healthyMatrix), ncol(healthyMatrix))

image(healthyClusters, axes = FALSE, col=rainbow(k))



## Predicting Tumors in Test image using the clusters of the Train Image

# Apply to a test image
 
tumor = read.csv("tumor.csv", header=FALSE)
tumorMatrix = as.matrix(tumor)
tumorVector = as.vector(tumorMatrix)

# Apply clusters from before to new image, using the flexclust package
install.packages("flexclust")
library(flexclust)

## Converting into kcca format

KMC.kcca = as.kcca(KMC, healthyVector)  ## Arg 1 - K- means clustering data and Arg 2- data used for clustering 
tumorClusters = predict(KMC.kcca, newdata = tumorVector)

# Visualize the clusters
dim(tumorClusters) = c(nrow(tumorMatrix), ncol(tumorMatrix))

image(tumorClusters, axes = FALSE, col=rainbow(k))

