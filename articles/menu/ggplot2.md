# ggplot2 example

Example on a **ggplot2** image

``` r
library(ggplot2)

# counts (or sums of weights)
g <- ggplot(mpg, aes(class))
# Number of cars in each class:
g + geom_bar()
```

![A ggplot2 image](ggplot2_files/figure-html/setup-1.png)

A ggplot2 image
