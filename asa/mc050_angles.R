#!/usr/local/bin/Rscript

################
### input output
################
outnames <- c("result050__bladder5.png")

w <- 4000
h <- 2250

c000 <- "./result040_angle_bladder5.csv"


################
### read the input data sets
################
df <- read.csv(c000, header = T)
#print(df[1:10, ]); q("no")


################
###
################
G000 <- ggplot(df, aes(length_to_base, angle_to_base)) + geom_point(
  aes(colour = Area)
) + theme_bw(
  ###
) + scale_colour_gradientn(
  colours = rainbow(14)
)
ggsave(plot = G000, file = outnames[1], width = w / 10, height = h / 10, unit = "mm")
print("plot saved")


###
