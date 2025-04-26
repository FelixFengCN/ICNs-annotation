library(tidyverse)
library(relaimpo)
library(R.matlab)

for (i in 1:53){
  data = readMat(paste0('f_mitochondrion_ic_',as.character(i),'_t3.mat'));
  mitochondrion <- data$mitochondrion
  ic_data <- cbind(data$ic, data$ic.null)
  current_y <- ic_data[, 1]
  model <- lm(current_y ~ ., data = as.data.frame(mitochondrion))
  importance <- calc.relimp(model, type = "lmg", rela = TRUE, boot = TRUE)
  weis[1,] <- importance@lmg
  for (j in 1:1000){
    current_y <- ic_data[, j+1]
    model <- lm(current_y ~ ., data = as.data.frame(mitochondrion))
    importance <- calc.relimp(model, type = "lmg", rela = TRUE, boot = TRUE)
  }
}


