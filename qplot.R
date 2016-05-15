library(ggplot2)
data(mtcars)
library(gridExtra)

# create factors with value labels 
mtcars$gear <- factor(mtcars$gear,levels=c(3,4,5),
                      labels=c("3gears","4gears","5gears")) 
mtcars$am <- factor(mtcars$am,levels=c(0,1),
                    labels=c("Automatic","Manual")) 
mtcars$cyl <- factor(mtcars$cyl,levels=c(4,6,8),
                     labels=c("4cyl","6cyl","8cyl")) 
# 
# Kernel density plots for mpg
# grouped by number of gears (indicated by color)
p1<-plot<-qplot(mpg, data=mtcars, geom="density", fill=gear, alpha=I(.5), 
      main="Distribution of Gas Milage", xlab="Miles Per Gallon", 
      ylab="Density")
 
# Scatterplot of mpg vs. hp for each combination of gears and cylinders
# in each facet, transmittion type is represented by shape and color
p2<-qplot(hp, mpg, data=mtcars, shape=am, color=am, 
      facets=gear~cyl, size=I(3),
      xlab="Horsepower", ylab="Miles per Gallon") 

# Separate regressions of mpg on weight for each number of cylinders
p3<-qplot(wt, mpg, data=mtcars, geom=c("point", "smooth"), color=cyl, 
  main="Regression of MPG on Weight", 
      xlab="Weight", ylab="Miles per Gallon")

# Boxplots of mpg by number of gears 
# observations (points) are overlayed and jittered
p4<-qplot(gear, mpg, data=mtcars, geom=c("boxplot", "jitter"), 
      fill=gear, main="Mileage by Gear Number",
      xlab="", ylab="Miles per Gallon")

grid.arrange(p1, p2, p3, p4, ncol=2, nrow =2)
