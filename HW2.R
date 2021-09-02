#Adam Vickter


#Model Results
##Results: the test set MSE is 43,770.99
#The training set MSE is 57,718
#I find that these numbers are comparable





#1 ACCESS THE DATA SET


housing <- read.csv("C:/Users/Owner/Desktop/UCLA Ext Class/housing.csv")
library(e1071)
 View(housing)
  head(housing)
  
               #     longitude latitude housing_median_age total_rooms total_bedrooms
              #      1   -122.23    37.88                 41         880            129
              #      2   -122.22    37.86                 21        7099           1106
              #      3   -122.24    37.85                 52        1467            190
              #      4   -122.25    37.85                 52        1274            235
              #      5   -122.25    37.85                 52        1627            280
              #      6   -122.25    37.85                 52         919            213
              #     population households median_income median_house_value
              #      1        322        126        8.3252             452600
              #      2       2401       1138        8.3014             358500
              #      3        496        177        7.2574             352100
              #      4        558        219        5.6431             341300
              #      5        565        259        3.8462             342200
              #      6        413        193        4.0368             269700
              #      ocean_proximity
              #      1        NEAR BAY
              #      2        NEAR BAY
              #      3        NEAR BAY
              #      4        NEAR BAY
              #      5        NEAR BAY
              #      6        NEAR BAY
  tail(housing)
                    #longitude latitude housing_median_age total_rooms total_bedrooms
                    #20635   -121.56    39.27                 28        2332            395
                    #20636   -121.09    39.48                 25        1665            374
                    #20637   -121.21    39.49                 18         697            150
                    #20638   -121.22    39.43                 17        2254            485
                    #20639   -121.32    39.43                 18        1860            409
                    #320640   -121.24    39.37                 16        2785            616
                    #population households median_income median_house_value
                    #20635       1041        344        3.7125             116800
                    #20636        845        330        1.5603              78100
                    #20637        356        114        2.5568              77100
                    #20638       1007        433        1.7000              92300
                    #20639        741        349        1.8672              84700
                    #20640       1387        530        2.3886              89400
                    #ocean_proximity
                    #20635          INLAND
                    #20636          INLAND
                    #20637          INLAND
                    #20638          INLAND
                    #20639          INLAND
                    #20640          INLAND
summary(housing)
          #         longitude         latitude    
          #          Min.   :-124.3   Min.   :32.54  
          #          1st Qu.:-121.8   1st Qu.:33.93  
          #          Median :-118.5   Median :34.26  
          #          Mean   :-119.6   Mean   :35.63  
          #          3rd Qu.:-118.0   3rd Qu.:37.71  
          #          Max.   :-114.3   Max.   :41.95  
                    
          #          housing_median_age  total_rooms   
          #          Min.   : 1.00      Min.   :    2  
          #          1st Qu.:18.00      1st Qu.: 1448  
          #          Median :29.00      Median : 2127  
          #          Mean   :28.64      Mean   : 2636  
          #          3rd Qu.:37.00      3rd Qu.: 3148  
          #          Max.   :52.00      Max.   :39320  
                    
          #          total_bedrooms     population   
          #          Min.   :   1.0   Min.   :    3  
          #          1st Qu.: 296.0   1st Qu.:  787  
          #          Median : 435.0   Median : 1166  
          #          Mean   : 537.9   Mean   : 1425  
          #          3rd Qu.: 647.0   3rd Qu.: 1725  
          #          Max.   :6445.0   Max.   :35682  
          #          NA's   :207                     
   #households     median_income    
 #Min.   :   1.0   Min.   : 0.4999  
 #1st Qu.: 280.0   1st Qu.: 2.5634  
 #Median : 409.0   Median : 3.5348  
 #Mean   : 499.5   Mean   : 3.8707  
 #3rd Qu.: 605.0   3rd Qu.: 4.7432  
 #Max.   :6082.0   Max.   :15.0001  
                                   
 #median_house_value   ocean_proximity
 #Min.   : 14999     <1H OCEAN :9136  
 #1st Qu.:119600     INLAND    :6551  
 #Median :179700     ISLAND    :   5  
 #Mean   :206856     NEAR BAY  :2290  
 #3rd Qu.:264725     NEAR OCEAN:2658  
 #Max.   :500001    


# Use iris data sent, draw vis, and store object
histObj_freq <- hist(iris$Sepal.Length, freq=TRUE, col="blue")
class(histObj_freq)
#[1] "histogram"




#2. DATA VISUALIZATION

#Create Histogram for Longitude
histlong <- hist(housing$longitude, freq = TRUE, col="blue")
#Create Histogram for Latitude
histlong <- hist(housing$latitude, freq = TRUE, col="blue")
#Create Histogram for Median Age
histlong <- hist(housing$housing_median_age, freq = TRUE, col="blue")
#Create Histogram for Latitude
histlong <- hist(housing$latitude, freq = TRUE, col="blue")
#Create Histogram for Total Rooms
histlong <- hist(housing$total_rooms, freq = TRUE, col="blue")
#Create Histogram for Total Bedrooms
histlong <- hist(housing$total_bedrooms, freq = TRUE, col="blue")
#Create Histogram for Population
histlong <- hist(housing$population, freq = TRUE, col="blue")
#Create Histogram for households
histlong <- hist(housing$households, freq = TRUE, col="blue")
#Create Histogram for Median Income
histlong <- hist(housing$median_income, freq = TRUE, col="blue")
#Create Histogram for Median House Value
histlong <- hist(housing$median_house_value, freq = TRUE, col="blue")




#change name of housing data frame to housing_repaired
housing_repaired <- housing
#impute median to all columns
#completed during step 4. 


#Download dummies package
install.packages("dummies")
#package 'dummies' successfully unpacked and MD5 sums checked
library(dummies)
#create dummy variables using dummies package
housing_repaired.new <- dummy.data.frame(housing, sep = ".")


#Create mean_number_bedrooms
housing_repaired.new$mean_number_bedrooms <- {housing_repaired.new$total_bedrooms/housing_repaired.new$households}

#Create mean_number_rooms
housing_repaired.new$mean_number_rooms <- {housing_repaired.new$total_rooms/housing_repaired.new$households}

#Perform Feature Scaling
housing_repaired.new2 <- scale(housing_repaired.new[,])

#Rename and remove variables as needed
housing_repaired.new$INLAND <- housing_repaired.new$ocean_proximity.INLAND
housing_repaired.new$ocean_proximity.INLAND <- NULL


housing_repaired.new$ISLAND <- housing_repaired.new$ocean_proximity.ISLAND
housing_repaired.new$ocean_proximity.ISLAND <- NULL

housing_repaired.new$"NEAR OCEAN" <- housing_repaired.new$`ocean_proximity.NEAR OCEAN`
housing_repaired.new$"ocean_proximity.NEAR OCEAN" <- NULL

#create data frame Cleaned_housing
cleaned_housing <- housing_repaired.new



#4 CREATE TRAINING AND TEST SETS

#Split data set into training set and test set 
set.seed(314)
train <- sample(1:nrow(cleaned_housing),0.8*nrow(cleaned_housing),replace=FALSE)
cleaned_housing[train,]
dim(cleaned_housing[train,])
#16512   16
trainset <- cleaned_housing[train,]

test <- sample(1:nrow(cleaned_housing),0.2*nrow(cleaned_housing),replace=FALSE)
test
cleaned_housing[test,]
dim(cleaned_housing[test,])
#4128   16
testset <- cleaned_housing[test,]

install.packages("randomForest")
library(dplyr)
library(randomForest)

train_y <- select(trainset, .data$median_house_value)
train_x <- select(trainset, -(median_house_value))

trainset <- impute(housing_repaired[,1:10], what = 'median')

names(trainset)[10] <- "OneHOcean"
names(trainset)[11] <- "NEARBAY"
names(trainset)[16] <- "NEAROCEAN"

names(train_x)[9] <- "OneHOcean"
names(train_x)[10] <- "NEARBAY"
names(train_x)[15] <- "NEAROCEAN"



randomForest(median_house_value~.,data = trainset, ntree=500,
    importance=TRUE, na.action = na.roughfix)

rf <- randomForest(median_house_value~., data=trainset, ntree=500, 
                   mtry=2, importance=TRUE, na.action = na.roughfix)
rf
names(rf)
rf$importance

#USE AS MODEL
# test_mse = mean(((y_pred - test_y)^2))
# test_rmse = sqrt(test_mse)
# test_rmse

# Not specifying a data source forces OOB predictions
oob_prediction = predict(rf)
# Now compute the training set RMSE

train_x <- impute(train_x, what='median')
train_y <- impute(train_y, what='median')

train_mse = mean(((oob_prediction - train_y)^2))
oob_rmse = sqrt(train_mse)
oob_rmse

#57718.23




#create test_x and test_y

test_y <- select(testset, .data$median_house_value)
test_x <- select(testset, -(median_house_value))

names(testset)[10] <- "OneHOcean"
names(testset)[11] <- "NEARBAY"
names(testset)[16] <- "NEAROCEAN"

names(test_x)[9] <- "OneHOcean"
names(test_x)[10] <- "NEARBAY"
names(test_x)[15] <- "NEAROCEAN"

test_x <- impute(test_x, what='median')
test_y <- impute(test_y, what='median')
y_pred = predict(rf , test_x)

 
# Now compute the test set RSME
test_mse = mean(((y_pred - test_y)^2))
test_rmse = sqrt(test_mse)
test_rmse
#43770.99

#Results: the test set MSE is 43,770.99
#The training set MSE is 57,718
#I find that these numbers are comparable
