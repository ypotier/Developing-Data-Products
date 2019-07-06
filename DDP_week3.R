# Week 3 Developer product exercise 
# Create a web page presentation using R Markdown that features a plot created with Plotly. 
# Host your webpage on either GitHub Pages, RPubs, or NeoCities. Your webpage must contain the date that you created the document, 
# and it must contain a plot created with Plotly. 
# We would love to see you show off your creativity!

# https://stat.ethz.ch/R-manual/R-devel/library/boot/html/melanoma.html 
# 
# time
# Survival time in days since the operation, possibly censored.
# 
# status
# The patients status at the end of the study. 1 indicates that they had died from melanoma, 2 indicates that they were still alive and 3 indicates that they had died from causes unrelated to their melanoma.
# 
# sex
# The patients sex; 1=male, 0=female.
# 
# age
# Age in years at the time of the operation.
# 
# year
# Year of operation.
# 
# thickness
# Tumour thickness in mm.
# 
# ulcer
# Indicator of ulceration; 1=present, 0=absent.

library(plotly)
data("Melanoma")
save(Melanoma, file="Melanoma.RData")

time<-Melanoma$time
status<-Melanoma$status

status<-as.factor(status) 

age<-Melanoma$age
thickness<-Melanoma$thickness
ulcer<-Melanoma$ulcer

model<-glm(ulcer~time+thickness,
           family = binomial(link = "logit"), data = Melanoma)
summary(model) #summarizes the model

f <- list(
  family = "Arial, monospace",
  size = 18,
  color = "#7f7f7f"
)

x <- list(
  title = "Time",
  titlefont = f
)
y <- list(
  title = "Prediction of ulcer based on time and tickness",
  titlefont = f
)

Melanoma$sex <- factor(Melanoma$sex,
                    levels = c(0,1),
                    labels = c("female", "male"))


plot_ly(Melanoma, x = ~time, y = ~model, type = "scatter", mode = "lines", color = ~factor(sex)) %>%
  layout(xaxis = x, yaxis = y)



