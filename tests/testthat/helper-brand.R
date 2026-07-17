brand_css_variables <- function(palette) {
  stats::setNames(
    unlist(palette, use.names = FALSE),
    paste0("--brand-", gsub("-", "_", names(palette), fixed = TRUE))
  )
}

css_variables <- function(css, selector) {
  block <- css_block(css, selector)
  matches <- gregexpr(
    "--[[:alnum:]_-]+\\s*:\\s*[^;{}]+",
    block,
    perl = TRUE
  )
  declarations <- regmatches(block, matches)[[1]]

  values <- sub("^--[[:alnum:]_-]+\\s*:\\s*", "", declarations)
  names(values) <- sub("\\s*:.*$", "", declarations)
  trimws(values)
}

css_block <- function(css, selector) {
  selector_start <- regexpr(selector, css, fixed = TRUE)[[1]]

  if (selector_start < 0) {
    stop("CSS selector not found: ", selector, call. = FALSE)
  }

  open_brace <- regexpr(
    "{",
    substring(css, selector_start),
    fixed = TRUE
  )[[1]] +
    selector_start -
    1

  if (open_brace < selector_start) {
    stop("CSS selector block not found: ", selector, call. = FALSE)
  }

  css_after_open <- substring(css, open_brace + 1)
  chars <- strsplit(css_after_open, "", fixed = TRUE)[[1]]
  depth <- 1

  for (index in seq_along(chars)) {
    if (identical(chars[[index]], "{")) {
      depth <- depth + 1
    } else if (identical(chars[[index]], "}")) {
      depth <- depth - 1
    }

    if (identical(depth, 0)) {
      return(substring(css_after_open, 1, index - 1))
    }
  }

  stop("CSS selector block not closed: ", selector, call. = FALSE)
}

css_resolve_var <- function(value, variables) {
  pattern <- "var\\((--[[:alnum:]_-]+)(?:,\\s*([^()]+))?\\)"

  while (grepl(pattern, value, perl = TRUE)) {
    variable <- sub(paste0(".*", pattern, ".*"), "\\1", value, perl = TRUE)
    fallback <- sub(paste0(".*", pattern, ".*"), "\\2", value, perl = TRUE)
    replacement <- variables[variable][[1]]

    if (is.null(replacement) || is.na(replacement)) {
      replacement <- fallback
    }

    value <- sub(pattern, replacement, value, perl = TRUE)
  }

  trimws(value)
}

css_color <- function(value) {
  value <- trimws(value)

  if (grepl("^#[[:xdigit:]]{3}$", value)) {
    hex <- substring(value, 2)
    return(strtoi(paste0(strsplit(hex, "")[[1]], strsplit(hex, "")[[1]]), 16L))
  }

  if (grepl("^#[[:xdigit:]]{6}$", value)) {
    hex <- substring(value, 2)
    return(strtoi(substring(hex, c(1, 3, 5), c(2, 4, 6)), 16L))
  }

  if (grepl("^rgb\\(", value)) {
    rgb <- sub("^rgb\\(([^)]+)\\)$", "\\1", value)
    return(as.numeric(strsplit(rgb, "\\s*,\\s*")[[1]]))
  }

  stop("Unsupported CSS color: ", value, call. = FALSE)
}

contrast_ratio <- function(foreground, background) {
  foreground_luminance <- relative_luminance(foreground)
  background_luminance <- relative_luminance(background)

  (max(foreground_luminance, background_luminance) + 0.05) /
    (min(foreground_luminance, background_luminance) + 0.05)
}

yiq_luminance <- function(rgb) {
  sum(c(299, 587, 114) * rgb) / 1000
}

relative_luminance <- function(rgb) {
  adjusted <- vapply(rgb / 255, adjust_luminance_channel, numeric(1))

  sum(c(0.2126, 0.7152, 0.0722) * adjusted)
}

adjust_luminance_channel <- function(channel) {
  if (channel <= 0.03928) {
    return(channel / 12.92)
  }

  ((channel + 0.055) / 1.055)^2.4
}
