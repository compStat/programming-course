## Funktionen Recap

someFunction <- function(x) {
  if (missing(x)) stop("x is missing")
  names(x) <- "x"
  x
}

dump <- someFunction()

extract <- function(df, i, j) {
  rowInd <- if (missing(i)) 1:nrow(df) else i
  colInd <- if (missing(j)) 1:ncol(df) else j
  df[rowInd, colInd, drop = FALSE]
}

constructInd <- function(df) {
  ">"(df$x, 5)
}

df <- data.frame(x = 1:10)
df <- extract(df, constructInd(df))

## Generic Funcitons

numericVector <- c(1, 3, 6, 4, 9)
mean(numericVector)

characterVector <- c("ja", "mehr", "wörter")

meanCharacter <- function(x) mean(nchar(x))
meanCharacter(characterVector)
mean(characterVector)

mean <- function(x, ...) {
  if (is.numeric(x) || is.logical(x)) {
    base::mean(x, ...)
  } else if (is.character(x)) {
    mean(nchar(x), ...)
  } else {
    stop("...")
  }
}

mean(characterVector)

mean <- function(x, ...) UseMethod("mean")

mean.default <- function(x, ...) {
  sum(x) / length(x)
}

mean.character <- function(x, ...) {
  mean(nchar(x), ...)
}

mean.logical <- function(x, ...) {
  stop("Fehler")
}

mean(1:10)
mean(TRUE)
mean("a")


## S3 Classes

# see package

## Debugging

f <- function(x) {
  x - g(x)
}
g <- function(y) {
  y * h(y)
}
h <- function(z, verbose = TRUE) {
  if (verbose) futile.logger::flog.info(z)
  r <- log(abs(z))
  solve(crossprod(matrix(rnorm(10e6), nrow = 1000, ncol = 1000)))
  if (verbose) futile.logger::flog.error(r)
  if (r < 10) r^2
  else r^3
}

Rprof(tmp <- tempfile())
testOut <- f(10)
Rprof()
profileSummary <- summaryRprof(tmp)
unlink(tmp)

profileSummary$by.total


















