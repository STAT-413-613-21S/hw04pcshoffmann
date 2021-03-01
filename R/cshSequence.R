cshSequence <- function(x, n) {
  stopifnot(is.numeric(x), # vector x must be of numbers
            length(x) == 3, # vector x must be length 3
            is.numeric(n), # n must be a number
            n > 0) # n must be positive

  lastElement <- x[n] # the final output value and its default is x[n]
  if(n >=1 & n <=3){
    return(lastElement)
  }
  else{
    for(i in 4:n){
      x[i] = x[i-1] + (x[i-3] - x[i-2])/i
    }
    lastElement <- x[n]
  }
  return(lastElement)
}
