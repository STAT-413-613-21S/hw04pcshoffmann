#' Produces plot of a sequence's elements and value
#'
#' This function takes a data frame of four columns. The first three act as columns act as the first three
#' numbers of a sequence and the final column is the target nth element of the sequence. The function will then
#' find the value of all n elements in the sequence, and produce a line plot of its value against element n.
#'
#' @param df a data frame consisting of four columns: first three as elements in a sequence and the
#' fourth as the final element n.
#'
#' @return a line plot of each element in a recursive sequence and its respective value
#' @export cshPlot
#'
#' @examples my_data <- tibble::tribble(
#' ~x, ~y, ~z, ~n,
#' 2,4,3,3,
#' 2,4,3,4,
#' 2,4,3,5,
#' 2,4,3,6,
#' 2,4,3,7,
#' 2,4,3,8,
#' 2,4,3,9,
#' 2,4,3,10,
#' 2,4,3,12)
#'
#' cshPlot(my_data)
cshPlot <- function(df){
  stopifnot(length(df) == 4) # data frame must have 4 columns

  rows <- nrow(df) # number of rows in the data frame
  outVec <- vector(mode = "numeric", length = rows) # initialize output vector

  for(i in 1:rows){
    inVec <- as.numeric(df[i, 1:3]) # input vector of three variables (x)
    inNum <- as.numeric(df[i, 4]) # input integer of final sequence index (n)
    outVec[i] <- cshSequence(inVec, inNum)
  }
  plotDf <- data.frame(outVec, df[4]) # creating data frame of two cols outVec and n

  ggplot2::ggplot(data = plotDf, ggplot2::aes(x = `n`, y = outVec)) +
    ggplot2::geom_line() +
    ggplot2::labs(title = "My Sequence: c(3, 2.5, 2.7, 2.783, 2.755, 2.744, 2.748, 2.749, 2.748)",
                  y = "output") -> finalPlot

  return(finalPlot)
}
