rm(list = ls()) 


if (!require(testthat)) install.packages('testthat')
library(testthat)


if (file.exists("MapsThatChangedOurWorld_StoryMap_Data.csv")) {
  file.remove("MapsThatChangedOurWorld_StoryMap_Data.csv")
  cat("File deleted")
} else {
  cat("No file found")
}


test_that("MapsThatChangedOurWorld_StoryMap_Data.csv adlı dosya aktif dizinde mevcuttur", {
  expect_identical(file.exists("MapsThatChangedOurWorld_StoryMap_Data.csv"), T)
})

test_that("maps adlı değiken Global Workspace’de mevcuttur.", {
  expect_identical(exists("maps"), T)
})

test_that("maps nesnesi bir data.frame’dir.", {
  expect_identical(class(maps) == "data.frame", T)
})

test_that("maps adlı data.frame’in ilk sütunun adı “City” olmalıdır.", {
  expect_identical(colnames(maps)[1] == "City", T)
})

test_that("maps adlı data.frame’in 5. sütunun adında “Title” kelimesi ", {
  expect_identical(colnames(maps)[5] == "Title.of.Map.Being.Discussed", T)
})

test_that("Latitude adlı sütün numeric değerlerden oluşmalıdır.", {
  expect_identical(is.numeric(maps$Latitude), T)
})

test_that("Longitude adlı sütün numeric değerlerden oluşmalıdır.", {
  expect_identical(is.numeric(maps$Longitude), T)
})


test_that("idx nesnesi Global Workspace’de mevcuttur.", {
  expect_identical(exists("idx"), T)
})
test_that("idx nesnesinin tipi (class’ı) integer’dir.", {
  expect_identical(class(idx) == "integer", T)
})



test_that("Year adlı adlı sütün numeric değerlerden oluşmalıdır.", {
  expect_identical(all(maps$Longitude[idx] < 0, na.rm = TRUE), TRUE)
})



test_that("idx nesnesi Global Workspace’de mevcuttur.", {
  expect_identical(exists("finalResult"), ncol(finalResult) == 3, class(finalResult) == "data.frame", all(c("Longitude", "Latitude", "Year") == names(finalResult), rm.na=TRUE), T)
})


