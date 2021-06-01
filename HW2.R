#ADAM VICKTER


##Question 1
# SCORE=10

#Let's take a look at the mtcars data set that comes in Base R. The data can be loaded with the code:
library(datasets)
data(mtcars)
? mtcars # View a description of the data set
#You will now see an object called mtcars in your workspace. Which of the following R code statements calculates the average miles per gallon (mpg) by number of cylinders in the car (cyl)?
#(a) sapply(mtcars, cyl, mean)
#(b) lapply(mtcars, mean)
#(c) sapply(split(mtcars$mpg, mtcars$cyl), mean)
#(d) tapply(mtcars$cyl, mtcars$mpg, mean)

#The solution is C,the Sapply fuction 
#Outcome is 
#       4        6        8 
# 26.66364 19.74286 15.10000 



#Question 2
# SCORE=10

#What is the mean of the Ozone column in the airquality data set? Exclude missing values (coded as NA) from this calculation.

#42.1
#53.2
#31.5
#18.0

mean(airquality$Ozone, na.rm=TRUE) #calculate mean with NA removed
#42.12931



#Question 3
# SCORE=10

#Using the airquality data set, what is the mean value of the Temp variable when the Month variable is equal to 6?
  
85.6
90.2
75.3
79.1

SS99 <- subset(airquality, Month==6) #create subset
SS99 #Display subset
mean(SS99$Temp) #Display mean


#Question 4
# SCORE=10

#Write the R script code necessary to reproduce the boxplot data visualization below using the mtcars data set.


boxplot(mtcars$mpg ~ as.factor(mtcars$cyl), main = "Mean ozone in parts per billion at Roosevelt Island",
        xlab = "Number of Cylinders",
        ylab = "Miles Per Gallon",
        col = "white",
        border = "black",
        horizontal = FALSE,
        notch = FALSE
)


#Question 5
# SCORE=10

#In this question, you'll need to install, load and learn about a new package called
#scatterplot3d in order to render a 3D visualization for the mtcars data set. You'll need
#to use the scatterplot3d() function in this package. We need to visualize the variables:
#wt, disp, mpg. Please provide the R code that produces this data visualization.

library(scatterplot3d)
scatterplot3d(mtcars$wt,mtcars$disp, mtcars$mpg)


#Question 6
# SCORE=10

#The airquality data set contains data on different measures of the air quality in New York
#City. Produce a plot of the ozone level versus the temperature for the complete set of
#observations.
#Next, produce a plot to display temperatures less than 80 and ozone less than 100 (Hint: one
#way would be to use the min() function along with the plot() function's xlim and ylim arguments).

data("airquality")
plot(airquality$Ozone, airquality$Temp, pch=1, col="black")
airqualitySS <- subset(airquality,{airquality$Ozone < 100 & airquality$Temp < 80}, 1:6 )
plot(airqualitySS$Ozone,airqualitySS$Temp)
