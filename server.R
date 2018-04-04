# server.R
source("helpers.R")
counties <- readRDS("data/counties.rds")
library(maps)
library(mapproj)

shinyServer(
  function(input, output) {
    
    output$map <- renderPlot({
      
      mapVariables <- switch(input$var, "Percent White" = "white", "Percent Black" = "black", "Percent Hispanic" = "hispanic", "Percent Asian" = "asian" )
      mapColors <- switch(input$var, "Percent White" = "blue", "Percent Black" = "red", "Percent Hispanic" = "yellow", "Percent Asian" = "purple")
      
      percent_map( counties[ ,mapVariables], color = mapColors, legend.title = input$var, input$range[1], input$range[2] )
      
    })
      
  }
)
    