# quarto features

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

  Take `penguins`, and then,

- 2:

  add new columns for the bill ratio and bill area.

## Code filename

    matplotlib.py

``` python
import matplotlib.pyplot as plt
plt.plot([1,23,2,4])
plt.show()
```

## Callout Blocks

Note

Note that there are five types of callouts, including: `note`,`tip`,
`warning`, `caution` and `important`.

Warning

Callouts provide a simple way to attract attention, for example, to this
warning.

Important

The callout heading is provided by the callout type, with the expected
heading (i.e., Note, Warning, Important, Tip, or Caution).

Tip With Title

This is an example of a callout with a title. Providing a callout
heading is optional.

Caution

This is an example of a caution.

Simple

A simple callout.

NoteNo Icon

No icon

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

Another example

1.  ordered list

2.  item 2

    ``` python
    print("Hello, World!")
    ```

    1.  sub-sub-item 1

A task list

Task 1

Task 2

A definition

- term:

  definition

## Footnotes

Here is a footnote reference,[¹](#fn1) and another.[²](#fn2)

This paragraph won’t be part of the note, because it isn’t indented.

Here is an inline note.[³](#fn3)

## Equations

inline math: E = mc^{2}

display math:

E = mc^{2}

## Other blocks

Line Block  
  Spaces and newlines  
  are preserved

THIS TEXT IS SMALLCAPS

*This text is underlined*

This text is highlighted

endash: –

emdash: —

## Shortcodes

The subtitle of this document is as follows: Using this for shortcodes

![](data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAZAAAADICAYAAADGFbfiAAAIcklEQVR4nO3csZYM6xrH4XIBuAAyESIJIhJEJGQkIyMhIiIiIiIhMwkZCRESIiQkiES4AFyAU/92vq2mTvXM7HfRM2et50l099RUfz1rr/fXX/XM3vLp06efHQD8SwICQImAAFAiIACUCAgAJQICQImAAFAiIACUCAgAJQICQImAAFAiIACUCAgAJQICQImAAFAiIACUCAgAJQICQImAAFAiIACUCAgAJQICQImAAFAiIACUCAgAJQICQImAAFAiIACUCAgAJQICQImAAFAiIACUCAgAJQICQImAAFAiIACUCAgAJQICQImAAFAiIACUCAgAJQICQImAAFAiIACUCAgAJQICQImAAFAiIACUCAgAJQICQImAAFAiIACUCAgAJQICQImAAFAiIACUCAgAJQICQImAAFAiIACUCAgAJQICQImAAFAiIACUCAgAJQICQImAAFAiIACUCAgAJQICQImAAFAiIACUCAgAJQICQImAAFAiIACUCAgAJQICQImAAFAiIACUCAgAJQICQImAAFAiIACUCAgAJQLCpvH9+/fu48eP3datW7s9e/b0j/yvV69edW/evOlvdd3Jkye7nTt39remffjwoXv+/Hl/q+uOHDky95x/Ul7Do0ePZv9mbfv375/9O8+XL19mx0eOPXjwYH9r2vDY3bt3d0ePHu1vwcYREDaNM2fOzAJx4MCB7sGDB/0jK12+fLl7+PBhf+u3K1eudGfPnu1vrTR17KlTp7obN270t/6O27dvd7du3epvrTRvjffu3euuX7/e3/pt3hrzWvKahhKbO3fudNu2bevvweIJCJtCG6Zt9zEOSAZzBvTS0lJ39erV2Tv8HJ/Bev/+/dkwbdq5MowzvCP3c2yGcx7/04brSyyy60gM87zZVY3X+OzZs+7cuXOztWSNicC1a9e65eXl7sKFC93Fixf7o37JeRLX7Dru3r07O3d7jUv98+XnARtBQNhwuTRz4sSJ2SWZDPnxDiSxOHz4cLdjx47uyZMn/SO/5PFDhw51e/funQ3oZt++fbMQvXz5sr/3W47dsmVL9+LFi/7en5W1vH79evYahnIZLa8toUi8mjz2+fPn2RoTj+b48ePd169fZ2tsjyc0CU4eSzya06dPz55z/DgsioCw4fLu+v3797NhmuE/DkiGZ4Zo3qnn3f1QHs/X2xBtA3tp4p15e4f/+PHj2S5nLBE4f/78LFTDYR+5fJTBXrlktGvXrhWvKcFMEBOb7CiG2s4ij+frMf7+JrHNurLWBAoWTUDYUOOBOTUs2+Wh7DKGl4Fi/LXx+YbWM3Db+YbHtEtISxNRWkuilChmLVlTtPONL1XF+Gvj+0OrxRIWQUDYMHknngGYYLThOhWQDP0M/xaJoew+sgtpu5MWgKljVxvGTQZ+LiP9+PFjtqvJbiNr/Pbt2+zyWe7/G1l31t/WF22Nec0Jy1Bb49J/o9Duz1vz1M8LFkVA2DAZjO3SVRvMUwOxXevv/1vt7600HrBtOFcDEu24pX6I51JXAjA17NeSGCU+P3/+XBGf1daY78mOpf0M2lrmrXnq5wWLIiBsiHapaTxEpwZiC8jbt2//GcLNeMCuNpzHx64m0cjuIc+X334arme92jnG8VltjdmV5fOR9jNYa81TPy9YFAFh4TIk8848w7l9ztBkuObD8DyeD7Pzb/vwe2rgthC1zyzy/fOG81rDeKgdG1PnWktbV9aUtQ0lKonL8LJW0563rXF8f2i8W4FFExAWrg3FtbTB2KIwficf7WttyI8/Exlqx06dZyyBy6WnxG78a8JraYHIziWXrsba65+KQlt/+1qePzuSqRCtdh5YBAFhU5m6JLPabxvl8Xy9/++4v/drdzNv4GYwZ0Dnw/HscuZpoUk0cukst6eCNGUYj7yG7LKm5HXm85X8SvFQ223l8Xw95v39StvlrCeI8DcICJtKBus4INGGaAZrG8oJRwIyjkU+M8lff+fYFooWlqlzD+W4nDPHZTBHnnv4W1nztHi0P2Jc7dgcl+OzxhaKXJLKc2fnk+9vhkHLLqvJ68lvh717966/B4snIGwq8wKSnUN2EBm22Q1k2ObddwZoLhO1UES7tJNjc3knMoATnOHAnpLvy/cnFu2cuZ/Hjx07NvtDwik5d4Z/5LjsQMaG/7PEhCq/Lrx9+/bZ60ls8npynoRruKPIa03EEtDswPLZ0PLycvf06dPZ965nZwR/g4CwqcwLSOQdey7xZDcQGaQZtlNBSHAuXbr0z7HZFdy8eXPFYB7L+bMzSHTGnynk8Xw9zzd1jux6crlrNePzJhaJYv7CPbLGBCI7qrGpYxOO4flg0QSE/yt5N55hGu3d/Gqye4j1HLtR2hoTwuxEVpPXnp/Beo6Fv01AACgREABKBASAEgEBoERAACgREABKBASAEgEBoERAACgREABKBASAEgEBoERAACgREABKBASAEgEBoERAACgREABKBASAEgEBoERAACgREABKBASAEgEBoERAACgREABKBASAEgEBoERAACgREABKBASAEgEBoERAACgREABKBASAEgEBoERAACgREABKBASAEgEBoERAACgREABKBASAEgEBoERAACgREABKBASAEgEBoERAACgREABKBASAEgEBoERAACgREABKBASAEgEBoERAACgREABKBASAEgEBoERAACgREABKBASAEgEBoERAACgREABKBASAEgEBoERAACgREABKBASAEgEBoERAACgREABKBASAEgEBoERAACgREABKBASAEgEBoERAACgREABKBASAEgEBoERAACgREABKBASAEgEBoERAACgREABKBASAEgEBoERAACgREABKBASAEgEBoERAACgREABKBASAkv8AzWamUw5ZWW4AAAAASUVORK5CYII=)

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

The output of that inline code cell is some code. Etc.

## Figures

![](pitbull.jpg)

\(a\) A sketch of a pitbull puppy

![](shar-pei.jpg)

\(b\) A sketch of a sharpei puppy

![](data:image/png;base64,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)

\(c\) This is a placeholder

Figura 1: Cute puppies ([Figura 1 (a)](#fig-pitbull) and [Figura 1
(b)](#fig-shar-pei)) and placeholder ([Figura 1 (c)](#fig-placeholder)).

## Video

# An error occurred.

Unable to execute JavaScript.

Figura 2: The video “CERN: The Journey of Discovery”

In [Figura 2](#fig-cern)…

## References

Wickham, Hadley. 2014. «Tidy Data». *Journal of Statistical Software,
Articles* 59 (10): 1-23. <https://doi.org/10.18637/jss.v059.i10>.

------------------------------------------------------------------------

1.  Here is the footnote.

2.  Here’s one with multiple blocks.

    Subsequent paragraphs are indented to show that they belong to the
    previous footnote.

        { some.code }

    The whole paragraph can be indented, or just the first line. In this
    way, multi-paragraph footnotes work like multi-paragraph list items.

3.  Inlines notes are easier to write, since you don’t have to pick an
    identifier and move down to type the note.
