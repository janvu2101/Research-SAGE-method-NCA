library(rio)
df <- import("data/petopost.xlsx")
head(df)
dim(df)
str(df)
View(df)
unique(df$ownership)
df_private <- df[df$ownership=="Private Equity", ]
df_private <- df_private[ , c("ownership","zmanagement","ztargets","zpeople","zallops","zorg_inputs","zorg_demand")]
View(df_private)
dim(df_private)

#Scatter plot
plot(df$zallops, df$zmanagement, main="Scatter plot",   xlab="zallops", ylab="zmanagement", col = "red", pch = 19)
