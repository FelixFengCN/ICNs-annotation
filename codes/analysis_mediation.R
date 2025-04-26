library(bruceR)
library(R.matlab)
library(stringr)
ic_names <- c('m','x','y')
for (i in 1:53) {
data <- readMat(paste0('f_neurotransmitter_ic_',as.character(i),'_t3.mat'))
df_ic1 <- as.data.frame(dats$ic)
df_ic2 <- as.data.frame(data$neurotransmitter)
df_ic3 <- as.data.frame(data$y)
data_df <- cbind(df_ic1, df_ic2, df_ic3)
colnames(data_df) <- ic_names
  medianresult1 <- PROCESS(
    data = data_df,
    y = ic_names[3],
    x = ic_names[2],
    meds = ic_names[1],
    seed = 1234,
    ci = "boot",
    nsim = 1000
  )
}




