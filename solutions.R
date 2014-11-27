library(ggplot2)
library(data.table)

diamonds <- data.table(diamonds)

# Task 1

ggplot(diamonds, aes(color, price, fill = color)) + geom_boxplot(alpha=0.5) + facet_grid(.~cut)

# Task 2

ggplot(diamonds, aes(x, fill=color))+geom_histogram(binwidth=0.25)+xlab("X axis name")+ylab("Y axis name")

# Task 3

ggplot(diamonds, aes(depth, carat, color = price))+geom_point(alpha=0.3)+facet_grid(clarity~color)+
  ggtitle("Tittle of plot")+xlab("Depth")+ylab("Carat")
