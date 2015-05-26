> library("ggplot2")
> genres <- read.delim("van_gogh_genres.txt")
> colnames(genres)


#Van Gogh's paintings by Season, by Place
> table(genres$Season)
> table(genres$Season, genres$Label_Place)
> seasonsPlaces <- table(genres$Season, genres$Label_Place)
> barplot(seasonsPlaces, main="Van Gogh Paintings by Season, by Place",
+   xlab="Places", col=c("darkblue","lightblue", "yellow", "green"), ylab= "Number of Paintings",
+   legend = rownames(seasonsPlaces), names.arg=c("Early", "Paris", "Arles", "St. Remy", "Auvers sur Oise"), beside=TRUE)

#Images by proportion, brightness
>qplot(x=genres$image_proportion, y=genres$brightness_median, main = "Images by Proportion and Brightness", data = genres, geom="hex", xlab = "Image Proportion", ylab = "Median Brightness")

#same thing in ggplot, though it is not much more useful
> ggplot(genres,aes(x = genres$image_proportion, y = genres$brightness_median)) +
+   geom_point()

#VanGogh's genres by frequency by year
> ggplot(data = genres, aes(x=Year,)) + geom_freqpoly(binwidth = 1) + facet_wrap(~ Genre_gen) + ylab("Count") + ggtitle("Frequency of Genres by Year") 

# Brightness vs Hue Across Genres
> ggplot(data = genres, aes(x=brightness_median,hue_median)) + geom_point() + facet_wrap(~Genre_gen) + xlab("Median Brightness") + ylab("Median Hue") + ggtitle("Brightness vs Hue Across Genres")

#Brightness vs Hue By Season
> ggplot(data = genres, aes(x=brightness_median,hue_median)) + geom_point() + facet_wrap(~Season) + xlab("Median Brightness") + ylab("Median Hue") + ggtitle("Brightness vs Hue By Season")

#Frequency of Paintings by Season, by Year
> ggplot(data = genres, aes(x=Year,)) + geom_freqpoly(binwidth = 1) + facet_wrap(~ Season) + ylab("Count") + ggtitle("Frequency of Paintings by Season, by Year")


