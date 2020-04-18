# this script utilizes the Bradley-Terry model to rank websites on their aesthetics 
# by using comparison-based data that was collected via the Calista Crowdsourcing App

rm(list=ls())

# libraries
library('BradleyTerry2')
library('scales')


input_file <- "data/comparisons.csv"
output_file <- "website_scores.csv"

n = 100 # number of websites

data <- read.csv(file=input_file, header = TRUE, sep = ",")

comparisons <- matrix(0, n, n)

rownames(comparisons) <- paste(c(0:(n-1)))
colnames(comparisons) <- paste(c(0:(n-1)))

for (i in 1:nrow(data)) {
  im1 <- paste(data[i, "im1"])
  im2 <- paste(data[i, "im2"])
  w1 <- data[i, "w1"]
  w2 <- data[i, "w2"]
  
  comparisons[im1, im2] <- w1
  comparisons[im2, im1] <- w2
}

comparisons <- countsToBinomial(comparisons)

names(comparisons)[1:2] <- c("image1", "image2")

BT_model <- BTm(cbind(win1, win2), image1, image2, ~ image, id = "image", data = comparisons)

abilities <- BT_model$coefficients

abilities <- c(0, abilities)

names(abilities)[1] <- "image0"
which.max(abilities)
which.min(abilities)

sorted_abilities <- sort(abilities)

scaled_sorted_abilities <- rescale(sorted_abilities, to=c(1,10))

ranks <- data.frame(names(scaled_sorted_abilities), scaled_sorted_abilities)
colnames(ranks) <- c("website", "score")

write.csv(ranks, file = output_file, row.names = FALSE)