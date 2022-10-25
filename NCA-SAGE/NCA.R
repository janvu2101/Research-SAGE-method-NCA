library(rio)
library(NCA)
library(plotly)
df <- import("data/petopost.xlsx")
head(df)
dim(df)
str(df)
View(df)
unique(df$ownership)
df <- df[df$ownership=="Private Equity", ]

df_private <- df_private[ , c("ownership","zmanagement","ztargets","zpeople","zallops","zorg_inputs","zorg_demand")]
View(df_private)
dim(df_private)

#Scatter plot
plot(df$zallops, df$zmanagement, main="Scatter plot",   xlab="zallops", ylab="zmanagement", col = "red", pch = 19)
plot(df$zorg_inputs, df$zmanagement, main="Scatter plot",   xlab="zorg_inputs", ylab="zmanagement",col = "blue", pch = 19)
plot(df$zallops, df$zmanagement, type = "p", main="Scatter plot",   xlab="zallops", ylab="zmanagement", col = "red", pch = 19)
abline(a = 1.3 , b = 1.2, col="blue")
plot(df$zorg_inputs, df$zmanagement, main="Scatter plot",   xlab="zorg_inputs", ylab="zmanagement",col = "blue", pch = 19)
abline(a =2.4, b = 0.07, col="red")

plot(df$ztargets, df$zmanagement, main="Scatter plot",   xlab="ztargets", ylab="zmanagement",col = "blue", pch = 19)
abline(a =2.4, b = 0.07, col="red")

plot(df$zpeople, df$zmanagement, main="Scatter plot",   xlab="zpeople", ylab="zmanagement",col = "blue", pch = 19)
abline(a =2.4, b = 0.07, col="red")

#NCA
nca_zallops<-nca_analysis(df,"zallops", "zmanagement", ceilings=c("ce_fdh", "cr_fdh"), test.rep = 10000)
nca_output(nca_zallops, summaries = TRUE)
nca_output(nca_zallops, bottlenecks = TRUE, summaries = FALSE)
nca_zinputs<-nca_analysis(df,"zorg_inputs", "zmanagement", ceilings=c("ce_fdh", "cr_fdh"), test.rep = 10000)
nca_output(nca_zinputs, summaries = TRUE)
nca_output(nca_zinputs, bottlenecks = TRUE, summaries = FALSE)

nca_ztargets<-nca_analysis(df,"ztargets","zmanagement",ceilings = c("ce_fdh","cr_fdh"), test.rep = 10000)
nca_output(nca_ztargets, summaries = TRUE)

#Outliers:
nca_outliers(df, "zorg_inputs","zmanagement", plotly = TRUE)
nca_outliers(df, "zallops","zmanagement", plotly = TRUE)
