complete <- function(directory, id = 1:332) {
  the_files <- list.files(directory, pattern="*.csv", full.names = TRUE)
  output_df <- NULL
  #nobs <- NULL
  tmp_df <- lapply(the_files[id],read.csv, header = TRUE)
  output_df <- cbind(output_df, tmp_df)
  newfunction <- function(x) {
    nrow(subset(x,subset = rowSums(is.na(x[,2:3]))==0))
  }
  nobs <- lapply(output_df,newfunction)
  ## remember that a matrix will return numbered lines
  return(as.data.frame(cbind(id,nobs)))
}
complete("specdata", 1)
complete("specdata", c(2, 4, 8, 10, 12))
complete("specdata", 30:25)
complete("specdata", 3)