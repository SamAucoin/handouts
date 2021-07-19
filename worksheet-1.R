## Editor

vals <- seq(1,100)

vals <- seq(from = 1,
  to = 100)

## Load Data

storm <- read.csv('data/StormEvents.csv')

storm <- read.csv('data/StormEvents.csv',
  na.strings = c('NA','UNKNOWN'))

## Data Structures

## Lists

x <- list('abc', 1:3, sin)

## Vectors

c(...)

## Data Types

## Factors

education <- factor(
  c('college', 'highschool', 'college', 'middle', 'middle'),
  levels = c('middle', 'highschool', 'college'))

## Data Frames

income <- c(32000, 28000, 89000, 0, 0)
df <- data.frame(education,income)

## Parts and Subsets

## Names

names(df) <- c('ed', 'inc')

## Subsetting 

days <- c(
  'Sunday', 'Monday', 'Tuesday',
  'Wednesday', 'Thursday', 'Friday',
  'Saturday')

weekdays <- days[2:6]

weekend <- days[c(1,7)]

## Functions

first <- function(a) {
       result <- a[1,]
       return(result)
       }

## Flow Control

if (df$ed[1] == "college") {
  print(df$inc[1])
} else {
  print("No college education")
}


first <- function(dat) {
  if (is.vector(dat)) {
    result <- dat[[1]]}
    else if (is.matrix(dat)) {
      result <- dat[[1,1]]
    
  } else {
    result <- dat[1, ]
  }
  return(result)
}

## Distributions and Statistics

rnorm(n = 10)

x <- rnorm(n = 100, mean = 15, sd = 7)
y <- rbinom(n = 100, size = 20, prob = .85)



