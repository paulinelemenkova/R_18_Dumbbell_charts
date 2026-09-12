# ============================================================================
# Dumbbell charts of Mariana Trench morphology in R (ggplot2 + ggalt)
#
# This script produced figures in the peer-reviewed article:
#   Lemenkova, P. (2019). Statistical Analysis of the Mariana Trench
#   Geomorphology Using R Programming Language.
#   Geodesy and Cartography, 45(2), 57-84.
#   DOI:      https://doi.org/10.3846/gac.2019.3785
#   figshare: https://doi.org/10.6084/m9.figshare.9762860
#   HAL:      https://hal.science/hal-02277500
#   Zenodo:   https://zenodo.org/record/3385005
#   SSRN:     http://ssrn.com/abstract=3447481
#
# Author: Polina Lemenkova  |  ORCID: 0000-0002-5759-1089
# ============================================================================

library(ggplot2) # используем данные библиотеки
library(ggalt) # используем данные библиотеки

# ЧАСТЬ-1. формируем исходный датафрейм. 
	# шаг-1. вчитываем таблицу. делаем из нее исходный датафрейм.
MorDF <- read.csv("Morphology.csv", header=TRUE, sep = ",")
head(MorDF)
summary(MorDF)

# ЧАСТЬ-2. строим график Дамббелла
theme_set(theme_classic())
	# шаг-2. устанавливаем факторное значение (здесь: номера профилей 1:25)
profile<- factor(MorDF$profile, levels=as.character(MorDF$profile))  # for right ordering of the dumbells

	# шаг-3. сравниваем распределение точек по паре "Тихоокеанская vs Филиппинская плиты"
PacPhil <- ggplot(MorDF, aes(x = plate_phill, xend = plate_pacif, y = profile, group = profile)) + 
        geom_dumbbell(color = "thistle4", size=0.3, colour_xend = "deeppink", size_xend = 1.5, colour_x = "darkviolet", size_x = 1.5, show.legend = T) + 
        labs(x = "Observation Points", 
             y = "Profiles", 
             title="马里亚纳海沟。剖面1-25。Dumbbell Chart \nMariana Trench, Profiles Nr.1-25.", 
             subtitle="Value Change: Observation Points; Philippine Plate vs Pacific Plate", 
             caption="海洋大学， 青岛市2018. \nStatistics Processing and Graphs: R Programming. Data Source: QGIS") +
            scale_x_continuous(breaks = c(seq(0, 500, by = 100)), minor_breaks = c(seq(0, 500, by = 50))) + # насечки оси X через 1, от -3 до 3.
			scale_y_continuous(breaks = c(seq(1, 25, by = 1))) +
       		theme(
       		#plot.background=element_rect(fill="#f7f7f7"),
        	plot.title = element_text(margin = margin(t = 0, r = 20, b = 5, l = 0), family = "Kai", face = "bold", size = 12),
        	plot.subtitle = element_text(margin = margin(t = 0, r = 20, b = 4, l = 0), family = "Hei", face = "bold", size = 8),
        	plot.caption = element_text(margin = margin(t = 20, r = 10, b = 4, l = 0), family = "Kai", face = "bold", size = 8), 
        	plot.background=element_rect(fill = "white"),
			axis.text.x = element_text(face = 3, color = "gray24", size = 6),
			axis.text.y = element_text(face = 3, color = "gray24", size = 6),
			axis.title.y = element_text(size = 8),
			axis.title.x = element_text(size = 8),
			axis.ticks=element_blank(),
			legend.position="top",
			panel.background=element_rect(fill = "grey95", colour = "grey95"),
			panel.grid.major = element_line("white", size = 0.4),
		    panel.grid.minor = element_line("white", size = 0.4, linetype = "dotted"),
			panel.border=element_blank())
PacPhil

	# шаг-4. сравниваем распределение точек по паре "Марианская vs Каролинская плиты"
MarCar <- ggplot(MorDF, aes(x = plate_maria, xend = plate_carol, y = profile, group = profile)) + 
        geom_dumbbell(color = "thistle4", size=0.3, colour_xend = "orange", size_xend = 1.5, colour_x = "navy", size_x = 1.5, show.legend = T) + 
        labs(x = "Observation Points", 
             y = "Profiles", 
             title="马里亚纳海沟。剖面1-25。Dumbbell Chart \nMariana Trench, Profiles Nr.1-25.", 
             subtitle="Value Change: Observation Points; Mariana Plate vs Caroline Plate", 
             caption="海洋大学， 青岛市2018. \nStatistics Processing and Graphs: R Programming. Data Source: QGIS") +
            scale_x_continuous(breaks = c(seq(0, 500, by = 100)), minor_breaks = c(seq(0, 500, by = 50))) + # насечки оси X через 1, от -3 до 3.
			scale_y_continuous(breaks = c(seq(1, 25, by = 1))) +
       		theme(
       		#plot.background=element_rect(fill="#f7f7f7"),
        	plot.title = element_text(margin = margin(t = 0, r = 20, b = 5, l = 0), family = "Kai", face = "bold", size = 12),
        	plot.subtitle = element_text(margin = margin(t = 0, r = 20, b = 4, l = 0), family = "Hei", face = "bold", size = 8),
        	plot.caption = element_text(margin = margin(t = 20, r = 10, b = 4, l = 0), family = "Kai", face = "bold", size = 8), 
        	plot.background=element_rect(fill = "white"),
			axis.text.x = element_text(face = 3, color = "gray24", size = 6),
			axis.text.y = element_text(face = 3, color = "gray24", size = 6),
			axis.title.y = element_text(size = 8),
			axis.title.x = element_text(size = 8),
			axis.ticks=element_blank(),
			legend.position="top",
			panel.background=element_rect(fill = "grey95", colour = "grey95"),
			panel.grid.major = element_line("white", size = 0.4),
		    panel.grid.minor = element_line("white", size = 0.4, linetype = "dotted"),
			panel.border=element_blank())
MarCar

	# шаг-5. размещаем оба графика на один лист. 
figure <-plot_grid(MarCar, PacPhil, labels = c("1", "2"), ncol = 2, nrow = 1)