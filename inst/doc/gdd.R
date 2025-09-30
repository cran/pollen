## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup, message=FALSE-----------------------------------------------------
library(pollen)
library(ggplot2)
library(tidyr)

## -----------------------------------------------------------------------------
data("gdd_data", package = "pollen")
head(gdd_data)

## -----------------------------------------------------------------------------
df_plot1 <- pivot_longer(gdd_data, tmax:tmin)
p1 <- ggplot(df_plot1) +
  geom_line(aes(day, value, color = name))
p1

## -----------------------------------------------------------------------------
gdd_data$type_b <- gdd(tmax = gdd_data$tmax, tmin = gdd_data$tmin, 
                       tbase = 5, type = "B")
gdd_data$type_c <- gdd(tmax = gdd_data$tmax, tmin = gdd_data$tmin, 
                       tbase = 5, tbase_max = 20, type = "C")
gdd_data$type_d <- gdd(tmax = gdd_data$tmax, tmin = gdd_data$tmin, 
                       tbase = 5, tbase_max = 20, type = "D")
head(gdd_data)

## -----------------------------------------------------------------------------
df_plot2 <- pivot_longer(gdd_data, type_b:type_d)
p2 <- ggplot(df_plot2) +
  geom_line(aes(day, value, color = name))
p2

