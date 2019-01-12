#!/usr/local/bin/Rscript

### input output
f000 <- "./bladder_basement5.txt"
outnames <- c("result010_bladder5_basement.png")

w <- 4000
h <- 2250


df <- read.table(f000, header = F, sep = "\t")
colnames(df) <- c("x", "y")
df$ind <- 1:length(df[[1]])

#print(head(df))
print(str(df))

G000 <- ggplot(df, aes(x, y)) + geom_point(
  ###
  aes(colour = ind)
) + theme_bw(
  ###
) + xlim(
  0, w
) + ylim(
  0, h
) + scale_colour_gradientn(
  ###
  colours = rainbow(14)
)
ggsave(plot = G000, file = outnames[1], width = w / 10, height = h / 10, unit = "mm")




###
