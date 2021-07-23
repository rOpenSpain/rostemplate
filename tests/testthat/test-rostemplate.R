test_that("Test package", {
  pkg <- tempdir()

  expect_message(ros_gh_actions_branch(pkg, TRUE))
  expect_message(ros_gh_actions_branch(pkg, FALSE))

  pkg2 <- file.path(pkg, "a")

  expect_message(ros_gh_actions_docs_folder(pkg2, TRUE))
  expect_message(ros_gh_actions_docs_folder(pkg2, FALSE))

  pkg3 <- file.path(pkg, "b")

  expect_message(ros_gh_actions_croncheck(pkg3, TRUE))
  expect_message(ros_gh_actions_croncheck(pkg3, FALSE))

  expect_message(ros_badge_ropenspain(install = FALSE))
})
