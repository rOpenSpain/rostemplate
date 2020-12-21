library(tinytest)

pkg <- tempdir()

expect_silent(ros_gh_actions_branch(pkg, TRUE))
expect_silent(ros_gh_actions_branch(pkg, FALSE))

pkg2 <- file.path(pkg, "a")

expect_silent(ros_gh_actions_docs_folder(pkg2, TRUE))
expect_silent(ros_gh_actions_docs_folder(pkg2, FALSE))

