# Hierarchial Clustering

#Importing Dataset
dataset = read.csv('Mall_Customers.csv')
X = dataset[, 4:5]

# Using the dendrogram to find the optimal number of clustres
dendrogram = hclust(dist(X, method = 'euclidean'), method = 'ward.D')
plot(dendrogram,
     main = paste('Dendrogram'),
     xlab = 'Customers',
     ylab = 'Euclidean Distances')

# Fitting the hierarchical clustering to the mall data
hc = hclust(dist(X, method = 'euclidean'), method = 'ward.D')  
y_hc = cutree(hc , 5)

# visualizing the clusters
library(cluster)
clusplot(X,
         y_hc,
         lines = 0,
         shade = TRUE,
         color = TRUE,
         lables = 2,
         plotchar = FALSE,
         span = TRUE,
         main = paste("Clusters of clients"),
         xlab = 'Annual Income',
         ylab = 'Spending Score')