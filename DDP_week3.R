# Week 3 Developer product exercise 
# Create a web page presentation using R Markdown that features a plot created with Plotly. 
# Host your webpage on either GitHub Pages, RPubs, or NeoCities. Your webpage must contain the date that you created the document, 
# and it must contain a plot created with Plotly. 
# We would love to see you show off your creativity!

library(plotly)
#library(MASS)
data("Melanoma")

plot_ly(Melanoma, x = ~time, y = ~thickness, z = ~status, type = "scatter3d", color = ~factor(sex))
