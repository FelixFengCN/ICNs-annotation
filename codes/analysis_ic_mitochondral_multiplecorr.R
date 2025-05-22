library(tidyverse)
library(relaimpo)
library(R.matlab)
library(stats)

n_perm <- 1000
n_files <- 53

weis <- matrix(NA, n_files, ncol = 1)
r2 <- matrix(NA, n_files, 1)         
r2_null <- matrix(NA, n_files, n_perm)  
p_vals <- rep(NA, n_files)         

for (i in 1:n_files) {
  data <- readMat(paste0('f_mitochondrion_ic_', i, '_t3.mat'))
  mitochondrion <- data$mitochondrion
  ic_data <- cbind(data$ic, data$ic.null)
  
  # real model
  current_y <- ic_data[, 1]
  model <- lm(current_y ~ ., data = as.data.frame(mitochondrion))
  importance <- calc.relimp(model, type = "lmg", rela = TRUE, boot = TRUE)
  weis[i, 1] <- importance@lmg
  r2[i, 1] <- summary(model)$adj.r.squared
  
  for (j in 1:n_perm) {
    current_y <- ic_data[, j + 1]
    model <- lm(current_y ~ ., data = as.data.frame(mitochondrion))
    r2_null[i, j] <- summary(model)$adj.r.squared
  }
  
  p_vals[i] <- mean(r2_null[i, ] >= r2[i])
}

# FDR（Benjamini-Hochberg）
p_adj <- p.adjust(p_vals, method = "fdr")

results <- data.frame(
  File = 1:n_files,
  R2 = r2,
  Wei = weis,
  P_perm = p_vals,
  P_fdr = p_adj
)

print(results)

