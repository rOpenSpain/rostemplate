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

Error rendering placeholder

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

Error rendering placeholder

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
