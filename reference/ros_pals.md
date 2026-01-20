# Paletas de colores de **rOpenSpain**

Paletas de colores basadas en el tema de **rOpenSpain**.

## Uso

``` r
ros_green_pal(n = 4, alpha = 0.9, rev = FALSE)

ros_violet_pal(n = 4, alpha = 0.9, rev = FALSE)

ros_gradient_pal(n = 4, alpha = 0.9, rev = FALSE)

ros_qualitative_pal(n = 6, alpha = 0.9, rev = FALSE)

ros_metro_madrid_pal(n = 4, alpha = 0.9, rev = FALSE)
```

## Argumentos

- n:

  Número de colores

- alpha:

  Valor alfa (transparencia) de los colores. alpha = 1 es opaco y alpha
  = 0 totalmente transparente

- rev:

  Valor lógico que indica si los colores se han de mostar en orden
  inverso.

## Valor

Paletas de colores

## Ejemplos

``` r
scales::show_col(ros_green_pal(9))


scales::show_col(ros_violet_pal(9))


scales::show_col(ros_gradient_pal(9))


scales::show_col(ros_qualitative_pal(9))


scales::show_col(ros_metro_madrid_pal(9))
```
