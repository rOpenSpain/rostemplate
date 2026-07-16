test_that("workflow installers copy packaged yaml files", {
  pkg_branch <- withr::local_tempdir()
  expect_message(ros_actions_pkgdown_branch(pkg_branch), "Success!")
  expect_workflow_install(pkg_branch, "rostemplate-gh-pages.yaml")

  pkg_docs <- withr::local_tempdir()
  expect_message(ros_actions_pkgdown_docs(pkg_docs), "Success!")
  expect_workflow_install(pkg_docs, "rostemplate-docs.yaml")

  pkg_cron <- withr::local_tempdir()
  expect_message(ros_actions_check_cron(pkg_cron), "Success!")
  expect_workflow_install(pkg_cron, "roscron-check-standard.yaml")
})

test_that("workflow installers preserve existing files when requested", {
  expect_workflow_preserve(
    ros_actions_pkgdown_branch,
    "rostemplate-gh-pages.yaml"
  )
  expect_workflow_preserve(
    ros_actions_pkgdown_docs,
    "rostemplate-docs.yaml"
  )
  expect_workflow_preserve(
    ros_actions_check_cron,
    "roscron-check-standard.yaml"
  )
})

test_that("ros_build passes pkg to pkgdown", {
  pkg <- withr::local_tempdir()
  called_pkg <- NULL

  local_mocked_bindings(
    menu = function(...) 1,
    ros_pkgdown_build_site = function(pkg = ".", ...) {
      called_pkg <<- pkg
      invisible()
    }
  )

  expect_message(ros_build(pkg))
  expect_equal(called_pkg, pkg)
  expect_setequal(
    readLines(file.path(pkg, ".Rbuildignore")),
    c(
      "^docs$",
      "^_pkgdown\\.yml$",
      "^_pkgdown\\.yaml$",
      "^\\.github$",
      "^pkgdown$"
    )
  )
})

test_that("ros_badge_ropenspain can print markdown", {
  expect_message(ros_badge_ropenspain(install = FALSE))
})
