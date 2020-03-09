# Lab08
# Make the discrete-time logistic growth model from lab04 into a function
# that takes r,k,starting abundance, and generations as arguments
# Make that function produce a plot
# Make the function save abundance and generations in a file of the working directory


GrowthModel <- function(r, K, generations, startingabundance){
  n <- seq(1,generations,1) 
  generations <- seq(from = 1, to = generations, by = 1)
  n[1] <- startingabundance
  for(t in 2:length(n)){
    n[t] = n[t-1] + ( r * n[t-1] * (K - n[t-1])/K )
   
  }
  plot(generations, n, xlab = "Generations", ylab = "Abundance", cex = 0.8, pch = 19, col = 2)
  lines(generations,n, col = 2, lwd = 2)
  GrowthResults <- cbind(generations,n)
  colnames(GrowthResults)[1] <- "Generations"
  colnames(GrowthResults)[2] <- "Abundance"
  write.csv(x = GrowthResults, file = "GrowthModel.csv", row.names = FALSE) 
}

# Test call
GrowthModel(0.8,10000,12,2500)
