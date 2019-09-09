# Spam-detection
This project detects the spam in emails. An approach of Kmeans clustering followed by supervised learning has been explored. 
The project makes a comparison between supervised methods and supervised over clustered datapoints.
CreateDict reads the training samples and creates a dictionary which ultimately forms the features with the help of CreateFeature. This creates
a vocabs of spam. Additional preprocessing has been done here also. K-means is applied over it which creates the clusterFeature.txt
Then SVM, RandomForest, Decision tree and neural network was applied over it. 
This approach displayed improved accuracy and reduced computational cost. An accuracy of 76% was achieved with the combination of Random forest and K-means clustering.
