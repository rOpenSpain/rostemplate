# ggplot2 example

Example of a **ggplot2** image.

``` r

library(ggplot2)

# Count rows or sums of weights.
g <- ggplot(mpg, aes(class))
# Number of cars in each class.
g + geom_bar()
```

![Bar chart of vehicle counts by class in the mpg dataset. Vehicle class
is on the horizontal axis and count is on the vertical axis. SUVs are
the most common class and two-seaters are the least common.
](ggplot2_files/figure-html/setup-1.png)

A ggplot2 image
