#!/usr/local/bin/Rscript

################
### input output
################
outnames <- c("result030_alongbase_bladder5.png", "result030_hist_bladder5.png", "result030_vertical_bladder5.png", "result030_length_bladder5.png")
outcsv   <- "result030_stats_bladder5.csv"

w <- 4000
h <- 2250

c000 <- "./result020_baselabeled_bladder5.csv"
c010 <- "./bladder5_measure.csv"


################
### read the input data sets
################
df000 <- read.csv(c000, header = T)
df010 <- read.csv(c010, header = T)

df000$Cell_Index <- as.integer(df000$Cell_Index)
colnames(df010)[1] <- "Cell_Index"

### merge
df <- dplyr::left_join(df000, df010)

for(j in 1:length(df[[1]])){
  if(df$Base_ID[j] == -1){
    df$Base_ID[j] <- NA
    df$Base_dx[j] <- NA
    df$Base_dy[j] <- NA
    df$length_to_base[j] <- NA
  }
}
### output merged
write.csv(df, file = outcsv, quote = F, row.names = F)

################
### graphs to check if the classification worked well
################
### along base
G000 <- ggplot(df, aes(X, Y)) + geom_point(
  ###
  aes(colour = Base_ID)
) + theme_bw(
  ###
) + xlim(
  0, w
) + ylim(
  0, h
) + theme(
  ###
) + scale_colour_gradientn(
  ###
  colours = rainbow(14)
)
ggsave(plot = G000, file = outnames[1], width = w / 10, height = h / 10, unit = "mm")
print("plot saved")


### histogram along base
H000 <- ggplot(df, aes(Base_ID)) + geom_histogram(
  ###
  binwidth = 5
) + theme_bw(
  ###
)
ggsave(plot = H000, file = outnames[2], width = w / 10, height = h / 10, unit = "mm")
print("hist saved")


### is the point along with vertical to x or y axis of the image?
df$vert <- df$Base_dx * df$Base_dy == 0
V000 <- ggplot(df, aes(X, Y)) + geom_point(
  ###
  aes(colour = vert)
) + theme_bw(
  ###
) + xlim(
  0, w
) + ylim(
  0, h
) + theme(
  ###
)
#ggsave(plot = V000, file = outnames[3], width = w / 10, height = h / 10, unit = "mm")
#print("plot saved")


### length to base
L000 <- ggplot(df, aes(X, Y)) + geom_point(
  ###
  aes(colour = length_to_base)
) + theme_bw(
  ###
) + xlim(
  0, w
) + ylim(
  0, h
) + theme(
  ###
) + scale_colour_gradientn(
  ###
  colours = rainbow(14)
)
ggsave(plot = L000, file = outnames[4], width = w / 10, height = h / 10, unit = "mm")
print("plot saved")


###
