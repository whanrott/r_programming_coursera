pollutantmean <- function(directory, pollutant, id = 1:332) {
  the_files <- list.files(directory, pattern="*.csv", full.names = TRUE)
  output_df <- NULL
  for (i in id) {
    tmp_df <- read.csv(the_files[i], header = TRUE)
    output_df <- rbind(output_df, tmp_df)
  }
  the_mean <- round(mean(output_df[,pollutant],na.rm = TRUE),3)
  print(the_mean)
}
pollutantmean(directory = "specdata", pollutant = "sulfate",1:10)
pollutantmean(directory = "specdata", pollutant = "nitrate", 70:72)
pollutantmean(directory = "specdata", pollutant = "nitrate", 23)