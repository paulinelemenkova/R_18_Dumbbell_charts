library(reshape2)

df <- read.csv("Degraded_mountain.csv")
head(df)

#df1<- melt(df, value.name = "Value", id.vars = "Item")
# the variable column contains what were previously column names (A and B) and the Value column contains the corresponding elements.
#df1 <- df1[order(df1$value), ]

library(RColorBrewer)
p2<- ggplot(df) +
    geom_segment(aes(x = Value, xend = Value,
                   y = Item, yend = Item)) +
    geom_line(aes(x = Value, y = Item, group = Item), size = 0.5) +
    geom_point(aes(x = Value, y = Item, color = Year), size = 3) +
    geom_point(aes(x = Value, y = Item, color = Year), size = 3) +
    ggtitle("Area of degraded mountain land in Italy (km2) from 2015 to 2021") +
    xlab("Area (km2)") +
    ylab("Land types") +
    theme(legend.position = "right") +
    scale_fill_brewer(palette = "Set1", direction = -1) +
    theme_grey()
p2
