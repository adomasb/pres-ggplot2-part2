How to visualize insights from data? Part II
========================================================
author: Adomas
date: 2014-11-27

HW solutions & book
========================================================

Homework solutions to `ggplot2` part 1 homework could be [found here](https://github.com/adomasb/pres-ggplot2-part1/blob/gh-pages/solutions.R). 

[Book of `ggplot2` creator Hadley Wickam about **elegant graphics for data analysis**](http://www.bioinformaticslaboratory.nl/twikidata/pub/Education/ComputinginR/ggplot2-book.pdf)


Motivation of second part
========================================================

Just know what your are seeking for...

![Alt text](motivation.gif)

... skills for great visualizations....


Plan of workshop
========================================================

- `diamonds` data set
- `ggplot` object
- `geom` - geometric objects
- Fill, colour & alpha
- Facetting
- Homework
- What's next?


Diamonds dataset
=======================================================

We will use `diamonds` data set from `ggplot2` library.

Thus when library is loaded, `data.frame` called `diamonds` appears in environment.

Make this `data.frame` as `data.table` and take a look at first few lines.




ggplot object
========================================================

Already covered `qplot()` is very powerful tool when plotting quick plots with a single data set. 

If we want to create multilayered plots based on different data sets, then `qplot` is not gonna help. 

Thus firstly we have to create `ggplot` object and then incrementally add new plots with `+` operator.

**PS:** Akwardly, we will not gonna cover multilayered plots yet.

=======================================================

Basic syntax of `ggplot` object 


```r
ggplot(data, aes(x, y, <other aesthetics>))
```

This only creates object and would display anything, thus geometric objects should be added.

In other aesthetics argument, we will add already known `colour` and `fill`.

Geometric objects
=======================================================

Geometric objects called `geoms` decribe plots you want to produce

- `geom_point()`
- `geom_line()`
- `geom_histogram()`
- `geom_boxplot()`
- `geom_bar()`

more information could be found on [documentation](http://docs.ggplot2.org/current/).

Creating ggplot object
======================================================

Create `ggplot` is quite simple


```r
plot <- ggplot(diamonds, aes(x = carat, y = price))
```

We assigned object to variable `plot`, now try to print just by typing name of variable


```r
plot
```

Adding geometric objects: scatterplot
========================================================

To add geometric object to already existing `ggplot` object, we use `+` operator. Let's add points to our plot


```r
plot+geom_point()
```

=========================================================


```r
ggplot(diamonds, aes(x = carat, y = price))+geom_point()
```

![plot of chunk unnamed-chunk-6](index-figure/unnamed-chunk-6-1.png) 

**TASK:** create new object without asigning to new variable as stated above and plot scatterplot of `x` and `z` from our dataset

geom_line
=========================================================

Let's plot line of first 10 values of `z` and `x`. Since in `ggplot` object we determine what data to select, we can select first 10 values, thus


```r
ggplot(diamonds[1:10], aes(x = z, y = x))+geom_line()
```

=====================================================

![plot of chunk unnamed-chunk-8](index-figure/unnamed-chunk-8-1.png) 

**TASK:** plot line of `y` and `x`, where color is `J`


geom_histogram
=========================================================

Plotting histogram is very similar, we just specify only one variable of which we want to plot


```r
ggplot(diamonds, aes(price))+geom_histogram()
```


==========================================================

![plot of chunk unnamed-chunk-10](index-figure/unnamed-chunk-10-1.png) 

==========================================================

However, it is still not clear whats happens with kind of wide binwidths. Thus we can specify `binwidth` argument in `geom_histogram()` a value for size of bins.

**TASK:** plot same histogram again, thus this time specifying size of binwidth to 100

geom_boxplot
==========================================================

Plotting boxplot is similar to histogram, except we have to state X-axis variable. Boxplot of price


```r
ggplot(diamonds, aes(x = "Price", y = price))+geom_boxplot()
```

=========================================================

![plot of chunk unnamed-chunk-12](index-figure/unnamed-chunk-12-1.png) 

=========================================================

**TASK:** plot boxplot of log of price, change x variable accordingly, then add other transformation "layer" `coord_flip()` using operator `+` and see what happens

However, we usually want boxplots by different classes as already shown using `qplot()`.

**TASK:** plot price boxplots, but by different cuts (variable `cut`)

geom_bar
========================================================

Let's say we want to bar plot of different cuts. Moreover, let's change axes names. This can be done to X and Y axes respectively with `xlab(label = "X label")` and `ylab(label = "Y label")`


```r
ggplot(diamonds, aes(x = cut))+geom_bar()+xlab("Diamond Cut")+ylab("Count")
```

==========================================================

![plot of chunk unnamed-chunk-14](index-figure/unnamed-chunk-14-1.png) 

Fill & Colour
=========================================================

Setting fills and colours should be done in aesthetics argument `aes()`. If we have one layer, then it is not important where to state `color` or `fill`, either `ggplot` object or `geom` object. Thus filled barplots


```r
ggplot(diamonds, aes(x = cut, fill = cut))+geom_bar()+xlab("Diamond Cut")+ylab("Count")
```

==========================================================

![plot of chunk unnamed-chunk-16](index-figure/unnamed-chunk-16-1.png) 

**TASK:** move fill by cut aesthetic to `geom_bar` and plot 

Transparency parameter alpha
========================================================

In some situations plotted scatter plots seems to be dense in whole plot, while it is very dense in some places only. Though, we can determine each point transparency with parameter `alpha`, which accepts values from 0 to 1.


```r
ggplot(diamonds, aes(x = carat, y = price))+geom_point(alpha=0.1)
```

========================================================

![plot of chunk unnamed-chunk-18](index-figure/unnamed-chunk-18-1.png) 

**TASK:** plot the same plot but with different `alpha` (default value is 1) and see the differences

Facetting
========================================================

Facetting is one great feature that one cannot stop using once learned.

Say you have scatter plot of carat and price, as plotted previously. Moreover, there are other categorical features about these values, *eg*, cut or color or any other categorical variable which is in your data.

========================================================

Thus if you want plot it by different colors, you can choose one of either

- Every single plot separately
- Facetting

Facetting is done adding facet with `facet_grid(facets)`, where `facets` are in form `var1 ~ var2`.

=======================================================

Let's plot previous scatter plot with facets of `color` variable. If we want facetting by one variable, we state other as `.`, thus


```r
ggplot(diamonds, aes(x = carat, y = price))+geom_point()+facet_grid(.~color)
```

========================================================

![plot of chunk unnamed-chunk-20](index-figure/unnamed-chunk-20-1.png) 

**TASK:** change facetting variables order and set `alpha` parameter to 0.5 to the points, which should be coloured by `cut`, moreover change axes names to `Carat` and `Price`

Facetting with two variables
========================================================

We can also facet by two variables, as mentioned already, setting `facets` argument to `var1 ~ var2`.

**TASK:** Use plot from last task and facet by color and cut, but now color by `clarity`


Congrats!
========================================================

You have just finished basic introductions to data munging and visualizing tools!

![Alt text](happy.gif)

Hope you learned something!

Homework
========================================================

Keep that party mood for a friday evening, I still got some homework for you.

For these tasks, use the same `diamonds` data set.

**TASK 1:** plot boxplots of colors and facet them by cut type. Additionally set transparency to 0.5 and fill boxplots by colors.

========================================================

**TASK 2:** plot histogram of `x`, fill it by color, then change width of the bin to 0.25 and add names to X and Y axes on your own.

**TASK 3:** plot scatter plots of `depth` and `carats`. Facet these scatter plots by `clarity` and `color`. Change X and Y axes names. Additionally, change tittle of the plot, using `ggtitle(label = "Title")` and set these names as you want. Then select appropiate `alpha` parameter on your own. Finally, color these plots by price and think of what you can see in this plot.


What's next?
========================================================

This should be discussed. However, my suggestions for next two meetings:

- Try to use learned methods in real life situation
- Take data set and munge it a little
- Plot data and share insights together








