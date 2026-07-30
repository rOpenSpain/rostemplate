# Quarto features

## Citations

- Citation: Wickham ([2014](#ref-JSSv059i10))

## Code annotations

``` r
library(tidyverse)
library(palmerpenguins)
1penguins |>
2  mutate(
    bill_ratio = bill_depth_mm / bill_length_mm,
    bill_area  = bill_depth_mm * bill_length_mm
  )
```

- 1:

  Take `penguins`, then,

- 2:

  add new columns for the bill ratio and bill area.

## Code filename

    matplotlib.py

``` python
import matplotlib.pyplot as plt
plt.plot([1,23,2,4])
plt.show()
```

## Callout blocks

Note

Callout types include `note`, `tip`, `warning`, `caution` and
`important`.

Warning

Callouts provide a simple way to attract attention, for example, to this
warning.

Important

The callout heading is provided by the callout type, with the expected
heading, such as Note, Warning, Important, Tip or Caution.

Tip With Title

This is an example of a callout with a title. Providing a callout
heading is optional.

Caution

This is an example of a caution.

Simple

A simple callout.

NoteNo Icon

No icon.

## Diagrams

``` mermaid
flowchart LR
  A[Hard edge] --> B(Round edge)
  B --> C{Decision}
  C --> D[Result one]
  C --> E[Result two]
```

## HTML widgets

## Keyboard

- Keyboard shortcut: Shift-Ctrl-PShift-Ctrl-P

## Lists

- item 2

  Continued (indent 4 spaces)

Another example.

1.  ordered list

2.  item 2

    ``` python
    print("Hello, World!")
    ```

    1.  sub-sub-item 1

A task list.

Task 1

Task 2

A definition.

- term:

  definition

## Footnotes

Here is a footnote reference,[^1] and another.[^2]

This paragraph won’t be part of the note, because it isn’t indented.

Here is an inline note.[^3]

## Equations

Inline math: E = mc^{2}.

Display math:

E = mc^{2}

## Other blocks

Line Block  
  Spaces and newlines  
  are preserved

THIS TEXT IS SMALLCAPS

*This text is underlined*

This text is highlighted

Endash: –

Emdash: —

## Shortcodes

The subtitle of this document is as follows: Using this for shortcodes

![](data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAZAAAADICAYAAADGFbfiAAAG/UlEQVR4nO3cv5JMWwPG4fbVSbkBMok/OSIRIhIyEjIRGQkREhkSGQkZCRESGS6AaCLcABfg1NtVa6qn9cz0vMU3faqep2pq7Ond3Xsn69drr97+WVtb+zUBgB36306fAAAhIABUBASAioAAUBEQACoCAkBFQACoCAgAFQEBoCIgAFQEBICKgABQERAAKgICQEVAAKgICAAVAQGgIiAAVAQEgIqAAFAREAAqAgJARUAAqAgIABUBAaAiIABUBASAioAAUBEQACoCAkBFQACoCAgAFQEBoCIgAFQEBICKgABQERAAKgICQEVAAKgICAAVAQGgIiAAVAQEgIqAAFAREAAqAgJARUAAqAgIABUBAaAiIABUBASAioAAUBEQACoCAkBFQACoCAgAFQEBoCIgAFQEBICKgABQERAAKgICQEVAAKgICAAVAQGgIiAAVAQEgIqAAFAREAAqAgJARUAAqAgIABUBAaAiIABUBASAioAAUBEQACoCAkBFQACoCAgAFQEBoCIgAFQEBICKgABQERAAKgICQEVAWGmfP3+e/PjxY+Fj3759mz6+nY8fP05W6bhn98k5bGXZc4TdICCsrAyc586dWziA3r17d/rz4sWLTffJY2fPnp18+PBhcvLkyen23/bw4cPJ1atXJ2/fvp1cvHhxcunSpd9Cku0cc44n53Djxo2Fr7XMOcJu2rO2tvZrV48AFsggm8H/+/fvk2fPnk1OnDix/tiDBw+ms4rnz5+vb797927y6tWr9X0SjQze79+/nxw4cOC37b8hx5FwvH79ev0cEq6jR49Oz2FIDE6dOjW5fv36dDvnefr06fXtZc8RdpsZCCvp5s2bkyNHjvz29wzK+ZSfAXe4cOHC9NN5Bu/h0aNHk+PHj6/HIgE6fPjw9Ll/S95/375969v5d84h8Roym8ix5phnjz/HNWYqy54j7LZ/dvsAYN6TJ08mx44dmw6k8wPm2E4MhhGJPJZBN+sGGbSvXbu24bnZb6sBOM/59OnT+nZmCQnAbHTOnz+/6Qzm1q1b285u8v579+7dsN84l8w4cvzLnCOsAjMQVkoG/wykV65c2XJBfH52ksF2LEiP3/ODefZJlDZbuM5rZnDP5aLsM94jMXvz5s3091aByCxn9vG815cvXzbMNnL8i2ZWMdY4ljlHWAUCwspduson+c2MAXT2UtHYHgNvBu3Yv3//lq8xL6+RcOX9x6WmyAzk8ePHG9Zhlp1J5Rhmz2fRN7NGKMZjy5wjrAKXsFi5S1ftIndmD39CIpJLRYlZ1lGyvdNjSoDyGlkEnw/BvPH4dvv9yXOEP8EMhJWQT935pL9nz57p7/yM9YiXL19Onj59Ov33VgP5+CQ/u3awyDIxuH///uTr16/r6xI7jUdiuCgeiwIwu8i+3fFtdvkLdoOAsBIyaF6+fHny69evDT/D+PeIw/w9ERnox8A7fs9f7slXgucXsDeTy0nZb6fffFoUj8RxXJ7KZbCfP38uFcCtzhFWgYCwMnIfxOxPLh+Nbz6NRfUxG0gMhrFmMB7LIJtBeHafsTZy5syZbY8jg31u4EsEsgCeG/2WWbzOgH/nzp3pesnszCOzqbGdY5y/Sz3HlbCN813mHGEVCAj/yZnKuKQ1PvVn8J0dXBOgzBzGQJ3LRLkkNf/V3kVyw2H2y6CfBfAM7lkP2c69e/emNw1m4M9sIT+5/DZ7B3yClIX12b9lnwRyRGbZc4Td5k50VlIG8fFJPQNqBvTxddj8LbOCrJdkcM+n8/lP/ZFLSRmcM+jma7hZ19hqDSGDdGYLeb28XyKUYxj/Hcn8ccw7ePDgwr9n4B93lEdeM8efy1mZfRw6dGhy+/btDc9Z9hxhNwkI/1njno7tFpYz+9jpV3D/HxKSRGmrKCx7jrAbBASAijUQACoCAkBFQACoCAgAFQEBoCIgAFQEBICKgABQERAAKgICQEVAAKgICAAVAQGgIiAAVAQEgIqAAFAREAAqAgJARUAAqAgIABUBAaAiIABUBASAioAAUBEQACoCAkBFQACoCAgAFQEBoCIgAFQEBICKgABQERAAKgICQEVAAKgICAAVAQGgIiAAVAQEgIqAAFAREAAqAgJARUAAqAgIABUBAaAiIABUBASAioAAUBEQACoCAkBFQACoCAgAFQEBoCIgAFQEBICKgABQERAAKgICQEVAAKgICAAVAQGgIiAAVAQEgIqAAFAREAAqAgJARUAAqAgIABUBAaAiIABUBASAioAAUBEQACoCAkBFQACoCAgAFQEBoCIgAFQEBICKgABQERAAKgICQEVAAKgICAAVAQGgIiAAVAQEgIqAAFAREAAqAgJARUAAqAgIABUBAaAiIABUBASAioAAUBEQACoCAsCk8S9FEYEXClCavAAAAABJRU5ErkJggg==)

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis sagittis
posuere ligula sit amet lacinia. Duis dignissim pellentesque magna,
rhoncus congue sapien finibus mollis. Ut eu sem laoreet, vehicula ipsum
in, convallis erat. Vestibulum magna sem, blandit pulvinar augue sit
amet, auctor malesuada sapien. Nullam faucibus leo eget eros hendrerit,
non laoreet ipsum lacinia. Curabitur cursus diam elit, non tempus ante
volutpat a. Quisque hendrerit blandit purus non fringilla. Integer sit
amet elit viverra ante dapibus semper. Vestibulum viverra rutrum enim,
at luctus enim posuere eu. Orci varius natoque penatibus et magnis dis
parturient montes, nascetur ridiculus mus.

### A section

Here we define a plot.

#### Note the following plot

![](quarto-features_files/figure-html/a-cell-1.png)

### Another example

We will define some values here.

The output of that inline code cell is some code.

## Figures

![](pitbull.jpg)

\(a\) A sketch of a pitbull puppy

![](shar-pei.jpg)

\(b\) A sketch of a sharpei puppy

![](data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAA+gAAADICAYAAAB758tPAAAIvklEQVR4nO3dsZJMWRzH8Tu7qkS8AC/AAyCSEZGQkSAygZmMhKqtQkBJEJCRDAkegEiGREbUGZmIB7D1v7Vn9HTf7pmp6Vm/rf18qqZ6uvvO7XvC75zT5+4ZjUY/OwAAAOC3+uP3fjwAAABQBDoAAAAEEOgAAAAQQKADAABAAIEOAAAAAQQ6AAAABBDoAAAAEECgAwAAQACBDgAAAAEEOgAAAAQQ6AAAABBAoAMAAEAAgQ4AAAABBDoAAAAEEOgAAAAQQKADAABAAIEOAAAAAQQ6AAAABBDoAAAAEECgAwAAQACBDgAAAAEEOgAAAAQQ6AAAABBAoAMAAEAAgQ4AAAABBDoAAAAEEOgAAAAQQKADAABAAIEOAAAAAQQ6AAAABBDoAAAAEECgAwAAQACBDgAAAAEEOgAAAAQQ6AAAABBAoAMAAEAAgQ4AAAABBDoAAAAEEOgAAAAQQKADAABAAIEOAAAAAQQ6AAAABBDoAAAAEECgAwAAQACBDgAAAAEEOgAAAAQQ6AAAABBAoAMAAEAAgQ4AAAABBDoAAAAEEOgAAAAQQKADAABAAIEOAAAAAQQ6AAAABBDoAAAAEECgAwAAQACBDgAAAAEEOgAAAAQQ6AAAABBAoAMAAEAAgQ4AAAABBDoAAAAEEOgAAAAQQKADAABAAIEOAAAAAQQ6AAAABBDoAAAAEECgAwAAQACBDgAAAAEEOgAAAAQQ6AAAABBAoAMAAEAAgQ4AAAABBDoAAAAEEOgAAAAQQKADAABAAIEOAAAAAQQ6AAAABBDoAAAAEECgAwAAQACBDgAAAAEEOgAAAAQQ6AAAABBAoAMAAEAAgQ4AAAABBDoAAAAEEOgAsGDv37/f9JhPnz51X758mXtMvV/HJV7/osYIAPzy5+rq6l9jzwGAGd69e9ddu3atO3DgQHfw4MGp91++fNldvXq127t3b3fr1q3+8fDhw1PReunSpe779+/d8+fPu8+fP3fHjx+fOled582bN33g3rt3rzt16lR/vt1S17O6utp9/PixG41G/e/fvn2burZFjhEA2GjPxHMAYCDMHz582D+WK1euTB1TUVrh+vbt2z7eT5w40Z0+fbo7dOjQhoCtwD9z5kx38eLF/nmF6759+/ogbm7evNmH+bNnz9afLy8vd2tra7s2xvPnz3crKyv9dZe65hpP/TOiXesixwgATLPEHQA2UTH66NGjuYH84MGDPlTbzHoFaz1/+vTp+jFPnjzpI/fs2bPrr9Xv48dUmNfzyWPqnwM1o74b6praT9NCfXwp+6LGCAAME+gAsIkK0v379898v5ZyVzy3qG2OHj3aLwlv6pgK2vFz1TH19212vkV4Hde02el2zJD6nAro9tNif/K1IXX+x48fr894l8nxLnKMAMAwgQ4AOzRrI7cWqe39mo2eFfptpro9Tn6vu9R3uWepCK4gv3//fr8svf1joV6rn1pyPk+F9/i1tX8UXLhwYeFjBACGCXQA2GU1e7zTY2tW+sePHzP/rmL87t27G5acVzTX+er1oU3t5l1DbQBXcX7s2LEdXTcAsHU2iQOABRma9V6UeUvsx1WMnzt3rg/smjmv59tVm7zVjPyNGzf+1TECwP+dGXQAWJDNloFvxU6Xh1dA127ptVnb5LL1rahd2mvH9Vlhv4gxAgDDBDoA7NCsWeW27Lu9X7PSs7T32uPQkvHxjePmqb+tY2sWfTtLzyvOy3ic1yz8+BiGPmu7YwQAhgl0ANihmj2u+JzcxO3Dhw8bbjdWM9qTM+H1vGas23e9h25v1matJ3dQH1Kbu1U01z3U67y1XH0ranO5ySXxdZ4W7YscIwAwTKADwBZ9/fp1w+O4lZWVPo7bjHO7r3i93lTI1g7r47cle/XqVb8kvanN3Oq4er2p4yuONwvc+rwK7TpfBXXF9uvXr/vl7vO027HV+Sum20/NwI/P2i9qjADAsKXRaPRzxnsAwD8hevv27fVd0St+a0n32trahuMqSiuGT5482b148aLfZG1y1rvOUbPSFcM1G33kyJGpeG0z10tLS/3McwVx3ad83ve8l5eX1+8zXtdV11ex3u5/Xp93586dwd3cK7ovX748eN7r169vuD/6osYIAEwT6ACwYBXKW5ntrlieF91tpno7t0j7r40RAPhFoAMAAEAA30EHAACAAAIdAAAAAgh0AAAACCDQAQAAIIBABwAAgAACHQAAAAIIdAAAAAgg0AEAACCAQAcAAIAAAh0AAAACCHQAAAAIINABAAAggEAHAACAAAIdAAAAAgh0AAAACCDQAQAAIIBABwAAgAACHQAAAAIIdAAAAAgg0AEAACCAQAcAAIAAAh0AAAACCHQAAAAIINABAAAggEAHAACAAAIdAAAAAgh0AAAACCDQAQAAIIBABwAAgAACHQAAAAIIdAAAAAgg0AEAACCAQAcAAIAAAh0AAAACCHQAAAAIINABAAAggEAHAACAAAIdAAAAAgh0AAAACCDQAQAAIIBABwAAgAACHQAAAAIIdAAAAAgg0AEAACCAQAcAAIAAAh0AAAACCHQAAAAIINABAAAggEAHAACAAAIdAAAAAgh0AAAACCDQAQAAIIBABwAAgAACHQAAAAIIdAAAAAgg0AEAACCAQAcAAIAAAh0AAAACCHQAAAAIINABAAAggEAHAACAAAIdAAAAAgh0AAAACCDQAQAAIIBABwAAgAACHQAAAAIIdAAAAAgg0AEAACCAQAcAAIAAAh0AAAACCHQAAAAIINABAAAggEAHAACAAAIdAAAAAgh0AAAACCDQAQAAIIBABwAAgAACHQAAAAIIdAAAAAgg0AEAACCAQAcAAIAAAh0AAAACCHQAAAAIINABAAAggEAHAACAAAIdAAAAAgh0AAAACCDQAQAAIIBABwAAgAACHQAAAAIIdAAAAAgg0AEAACCAQAcAAIAAAh0AAAACCHQAAAAIINABAAAggEAHAACAAAIdAAAAut/vb5MEZUyIR1zHAAAAAElFTkSuQmCC)

\(c\) This is a placeholder.

Figura 1: Cute puppies ([Figura 1 (a)](#fig-pitbull) and [Figura 1
(b)](#fig-shar-pei)) and a placeholder ([Figura 1
(c)](#fig-placeholder)).

## Video

# An error occurred.

Unable to execute JavaScript.

Figura 2: The video “CERN: The Journey of Discovery”.

See [Figura 2](#fig-cern).

## References

Wickham, Hadley. 2014. «Tidy Data». *Journal of Statistical Software,
Articles* 59 (10): 1-23. <https://doi.org/10.18637/jss.v059.i10>.

[^1]: Here is the footnote.

[^2]: Here’s one with multiple blocks.

    Subsequent paragraphs are indented to show that they belong to the
    previous footnote.

        { some.code }

    The whole paragraph can be indented, or just the first line. In this
    way, multi-paragraph footnotes work like multi-paragraph list items.

[^3]: Inline notes are easier to write, since you do not have to pick an
    identifier and move down to type the note.
