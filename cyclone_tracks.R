
# PURPOSE: Generate hurricane track for Tropical Storm Barry.

# MODIFIED: 2021-03-12
  # 2021-03-12 | KR modified from template cyclone track provided by Zach Topor

# ---------

# Hurricane Track code
# packages -------
#"hurricaneexposure"
install.packages('hurricaneexposure')
devtools::install_github('eddelbuettel/drat', force = T)
library(drat)

# "huricaneexposure" only has storms up to 2018; trying a dependancy "noaastormevents"
library(noaastormevents)

install.packages('stormwindmodel')
addRepo("geanders")
install.packages("hurricaneexposuredata")
library(tidyverse)
library(stormwindmodel)
library(hurricaneexposuredata)
library(hurricaneexposure)

# -------------
# deprecated for storms in years 2019 and beyond
  # data('hurr_tracks')
  # ht <- hurr_tracks
  # hurricaneexposuredata::
#
  # if (requireNamespace("hurricaneexposuredata", quietly = TRUE)) {
  #
  #   map_tracks(storms = "Sandy-2012")
  #   map_tracks(storms = "Floyd-1999", plot_points = TRUE)
  #   map_tracks(storms = c("Sandy-2012", "Floyd-1999"))
  #   a <- map_tracks(storms = "Sandy-2012", color = "blue", alpha = 0.3)
  #   b <- map_tracks(storms = "Floyd-1999", plot_object = a)
  #   b
  # }

d <- download_storm_data("2019", file_type = "details")

#PLOT track -------
track = map_tracks(storms = 'Harvey-2017', plot_points = TRUE)
harvey_tracks = hurr_tracks %>% filter(storm_id == 'Harvey-2017')
racks(storms = "Harvey-2017", plot_points = TRUE)
add_storm_track(harvey_tracks, plot_object = map,
                plot_points = T, alpha = 0.5)