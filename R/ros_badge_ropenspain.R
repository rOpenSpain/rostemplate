#' Add a rOpenSpain badge to your `README` file
#'
#'
#' @description
#'
#' Add an rOpenSpain badge pointing to <https://ropenspain.es/> on your `README`
#' file.
#'
#'
#' @return A markdown badge and a message with the markdown value.
#'
#' @seealso [`usethis::use_badge()`]
#'
#' @param ... ignored
#'
ros_badge_ropenspain <- function(...) {

  # Add pkg
  badge <- "https://img.shields.io/badge/rOpenSpain--green?style=social"

  href <- "https://ropenspain.es/"


  logo_encoded <- "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAABGdBTUEAALGPC/xhBQAAACBjSFJNAAB6JgAAgIQAAPoAAACA6AAAdTAAAOpgAAA6mAAAF3CculE8AAAABmJLR0QA/wD/AP+gvaeTAAAAB3RJTUUH5AwHABsBxxfdgAAAAF50RVh0UmF3IHByb2ZpbGUgdHlwZSBpcHRjAAppcHRjCiAgICAgIDI4CjM4NDI0OTRkMDQwNDAwMDAwMDAwMDAwZjFjMDI2ZTAwMDM1MjQ2NDcxYzAyMDAwMDAyMDAwNDAwCmCaPZ4AAARaSURBVFjDxZddbBRVFMf//zuzu+30A9qCpRDbWKKWiIQHA0TAIFCJMcUCIhAEoxATiab4oNEHE/VRE+EBTJRAlGglEENLQpCKCC0fIWqbqBBoASl0u7Ur/WLdzu7MvceHLfIRaQrspv9kXiaTe35z/vecew9xl6pvegniQSmHT1DhfQIFRuQjz9WHLUv51XO+uav1ONIPv/thLfIe8uBGrYlUXEfF9SBKAQCCqIj52mjzWbQ1eb7gwSCWza9ND8Cuvc/DKcmHaMlVNpdAYSPJ6QDU7d+KSKsY2SLa1FohdTXe7ePFZ3fdO0D9idUQjYAKqDlUeItkJYisYVcU+AI5DiObtK8PUtEdCPtY88LukQPsbXwZbsxmTmGyggpvklwJouCuzBWJiUi9GNms3WQzbdtUz/l2eIC6H1+BPT4O80/gAVpYQ3IDyHLcj0Q6RWSHGLNt8kxePndEsPTp2lsBRPrQ0LwRTijXibmxKgOpATEDgIX0SCDyB8Et2XbW7t74332Lpm9EjjMXVFQAMFYENWXlhTMqpo2fFwhajoggnSIJrU3y4rnek62nu08IzCYCUaaSIA+PK845+syy0pKQQyC9sW+R0cDR/ZGuS229TwFos69Hy80PcPaiccgvsCCZAiDgJYDTv/biUlvqlX3DJEBrgdaSOYChDNxsr8Ioa9QB7KFNCAJQJEjeoZwlUwCp9XuiCb1nWzuCIXVbYGBMYRALlhTDyVVp3x92wFbwfN2xeEXFsbFFzoqbA5BAbMBD06GLmDW/CE5eMO0lah89/Tr6EwkXOtEJMBX1JoCrfw2i5VQ4Y61BdUf6oZQF39OpMvTNrY8WSAY7k9K+B6basRmVMjTig0Nn0qgACGQotIxOI1IZdXhEnZDX7c88BwEqXrc8BUAE4HsuIGyDyEDmUk1oD/j9VB/C7TEXgA8AalnlLiTjCXgJ+cpoWS5Gvocgmb6LSOoyculcHDs3XdDbPzl7LHIlVqPIKyRTh1H17FrEzntJ2tKgk/5KY/QGEfntfmwhU3/d0+2j7ssObP3gzIXGA+F3YgPuUkD2OXbIF5Eb94G1r+4BAOxpWN7/WOXU7W0nWxtUUK032qwjOEkpDh1bI0i3RQxe0/i5sQc/7eu82t7WX6u12ZoXcFpdnRTP+Ih57vBzQX3jKiyeW823P9z65M7PW3ZWrS4tn7WwCMEsBWPkjj77vuBsyzUc2ht2zzT3NCRc71OL6rgR8f+v3oYdTGwqKEJ5BguzcwLvTptZNLdy6US7fEouaAnE3Eg3QIT/HMThuoj5pSna3N87uJlgvUBiZSWT0B4J39toNsHJR1d8AAQLBVhVOD77jVkLih+dVzWBxZNCAIG+qIfjB6NoOhC53NUR+0IgOwBEHCuIuE7Tfs6yQlhZ9hwAlpPq49LJY7rW1EyR196bKo9MLeq1bWsbgMdz7GwGVSBzvcSijaAKWgDmBYL2kVAo0Ayg2qIV4siH7f/0L7Kq+91zoPR0AAAAJXRFWHRkYXRlOmNyZWF0ZQAyMDIwLTEyLTA3VDAwOjI3OjAwKzAwOjAwWgYBiAAAACV0RVh0ZGF0ZTptb2RpZnkAMjAyMC0xMi0wN1QwMDoyNzowMCswMDowMCtbuTQAAAAASUVORK5CYII="

  badge <- paste0(badge, "&logo=", logo_encoded)

  usethis::use_badge("rOS-badge", href = href, src = badge)

  message(
    "Badge URL is ", "\n",
    "[![rOS-badge](",
    badge, ")](", href, ")"
  )
}
