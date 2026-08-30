testthat::test_that("ros_badge_ropenspain() muestra el Markdown", {
  testthat::expect_snapshot(ros_badge_ropenspain(install = FALSE))
})

testthat::test_that("ros_badge_ropenspain() exige un indicador lógico", {
  testthat::expect_snapshot(
    error = TRUE,
    ros_badge_ropenspain(install = "yes")
  )
})
