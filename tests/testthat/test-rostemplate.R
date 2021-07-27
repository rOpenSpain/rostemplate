test_that("Test package", {
  pkg <- tempdir()

  expect_message(ros_actions_pkgdown_branch(pkg, TRUE))
  expect_message(ros_actions_pkgdown_branch(pkg, FALSE))

  pkg2 <- file.path(pkg, "a")

  expect_message(ros_actions_pkgdown_docs(pkg2, TRUE))
  expect_message(ros_actions_pkgdown_docs(pkg2, FALSE))

  pkg3 <- file.path(pkg, "b")

  expect_message(ros_actions_check_cron(pkg3, TRUE))
  expect_message(ros_actions_check_cron(pkg3, FALSE))

  expect_message(ros_badge_ropenspain(install = FALSE))
})
