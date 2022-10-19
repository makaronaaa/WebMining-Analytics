getwd()
df<-read.csv("C:/Users/maka/OneDrive/Desktop/CS688/cs688_hw1_Makharashvili/data/geoMap.csv", header = FALSE, sep = ',')
df
#Q1: Which are the states where GG is smaller than 1?
#Find those and replace them with zero.
colnames(df) <- c("Area", "GB", "GG")

df$GG <- gsub('<1', '0', df$GG)
df

df$GB <- as.numeric(df$GB)
df$GG <- as.numeric(df$GG)

#Q2: For How Many States GB > GG?
df$GB <- as.numeric(as.character(df$GB))
df$GG <- as.numeric(as.character(df$GG))
table(df$GB > df$GG)

#Q3: Find any states where GG+10 > GB

df[(df$GG + 10) > df$GB, 1]

#Q4: What is the % of states for which GG+10 > GB?

n = 0
for (i in 1:length(df$Area)){
  if (df$GB[i] < as.numeric(df$GG[i]) + 10){
    n = n + 1
  }
}
cat((n/length(df$Area))*100, "%")

#Q5: What is the ratio GG/GB for the state of New Hampshire?

i = length(which(df$Area == "New Hampshire"))
print(df$GG[i]/df$GB[i])

#Q6: Create a Bar Plot of GG & GB values for each state.

library(ggplot2)
library(reshape2)
df_bar <- melt(df, id.vars = "Area")
head(df_bar)
ggplot(df_bar, aes(x = Area, y = value, fill = variable)) +
  geom_bar(stat='identity', position='dodge') + coord_flip()

