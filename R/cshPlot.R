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
