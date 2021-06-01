Adam Vickter


# QUESTION 1)
#Define New matrix, 3 rows 4 colums, 1:12 by row
MTX <- matrix(1:12,3,4)

#display matrix
MTX
#add new row with 9's
NRW <- c(9,9,9,9)
#bind new row with old matrix, call it MTX2
MTX2 <- rbind(NRW,MTX)
#Display MTX2
MTX2
#create new column of 8's
NCM <-c(8,8,8,8)
#Bind new column with matrix 2, call it MTX 3 
MTX3 <-cbind(NCM,MTX2)
#Display matrix 3
MTX3



#QUESTION 2
SS1 <- subset(airquality, Ozone > 31 & Temp > 90)
#create subset
colMeans(SS1, , dims=1)
#display mean
Mean = 212.8


                  

#Question 3
for (p in 1:100) { 
  if (p %% 3 == 0 & p %% 5 == 0) {print("Fizzbuzz")}
  else if (p %% 3 == 0) {print("Fizz")}
  else if (p %% 5 == 0) {print("Buzz")}
  else print(p)
}


#Question 4
V <- sample(state.name, 10, replace = FALSE, prob = NULL)
#create sample
W <- sort(V)
#sort list
W
#Display sorted list


#Question 5
moon <- as.POSIXct("1969-07-20 20:18:00")
#create time vector for moon landing, "moon"
moon
now <- Sys.time()
#create new vector, "now"
now
#subtract 
now-moon




