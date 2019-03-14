########################################################
## title: shots chart
## description: making charts about shot positions of players from GSW
## input(s): shots-data.csv
## output(s): andre-iguodala-shot-chart.pdf: draymond-green-shot-chart.pdf,kevin-durant-shot-chart.pdf
## klay-thompson-shot-chart.pdf, stephen-curry-shot-chart.pdf,gsw-shot-charts.pdf
## gsw-shot-charts.png
########################################################


allplayers = read.csv("../data/shots-data.csv", stringsAsFactors = FALSE)
kt = allplayers[allplayers$names == 'Klay Thompson',]
dg = allplayers[allplayers$names == 'Draymond Green',]
ai = allplayers[allplayers$names == 'Andre Iguodala',]
kd = allplayers[allplayers$names == 'Kevin Durant',]
curry = allplayers[allplayers$names == 'Stephen Curry',]
#4) Shot Charts
# scatterplot

library(ggplot2)
klay_scatterplot <- ggplot(data = kt) +
  geom_point(aes(x = x, y = y, color = shot_made_flag))
klay_scatterplot


library(jpeg)
library(grid)
# court image (to be used as background of plot)
court_file = "workout01/images/nba-court.jpg"
# create raste object
court_image <- rasterGrob(
  readJPEG(court_file),
  width = unit(1, "npc"),
  height = unit(1, "npc"))

# shot chart with court background
klay_shot_chart <- ggplot(data = kt) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Klay Thompson (2016 season)') +
  theme_minimal()
klay_shot_chart

# 4.1) Shot charts of each player
# Write code in the R script make-shot-charts-script.R to create shot charts (with court
# backgrounds) for each player, and save the plots in PDF format, with dimensions width =
# 6.5 and height = 5 inches, inside the folder images/:
pdf(file = "../images/andre-iguodala-shot-chart.pdf",width = 6.5, height = 5)
ggplot(data = ai) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Andre Iguodala (2016 season)') +
  theme_minimal()
dev.off()

pdf(file = "../images/draymond-green-shot-chart.pdf",width = 6.5, height = 5)
ggplot(data = dg) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Draymond Green (2016 season)') +
  theme_minimal()
dev.off()

pdf(file = "../images/kevin-durant-shot-chart.pdf",width = 6.5, height = 5)
ggplot(data = kd) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Kevin Durant (2016 season)') +
  theme_minimal()
dev.off()

pdf(file = "../images/klay-thompson-shot-chart.pdf",width = 6.5, height = 5)
ggplot(data = kt) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Klay Thompso (2016 season)') +
  theme_minimal()
dev.off()

pdf(file = "../images/stephen-curry-shot-chart.pdf",width = 6.5, height = 5)
ggplot(data = curry) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Stephen Curry(2016 season)') +
  theme_minimal()
dev.off()


# 4.2) Facetted Shot Chart
# Create one graph, using facetting, to show all the shot charts in one image. A hypothetical
# facetted graphic is shown below.
# Save this image in PDF format as gsw-shot-charts.pdf, inside the folder images/. Specify
# image dimensions width = 8 and height = 7 inches.
pdf(file = "../images/gsw-shot-charts.pdf",width = 8, height = 7)
ggplot(data = bind) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: GSW(2016 season)') +
  theme_minimal() +
  facet_wrap(~name)

dev.off()

# Likewise, save this image in PNG format as gsw-shot-charts.png, inside the folder images/.
# Specify image dimensions width = 8 and height = 7 inches.
png(file = "../images/gsw-shot-charts.png",width = 8, height = 7, units = "in",res = 480)
ggplot(data = bind) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: GSW(2016 season)') +
  theme_minimal() + 
  facet_wrap(~name)
dev.off()
