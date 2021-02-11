library(shiny) 
library(shinydashboard) 
library(shinydashboardPlus) 
library(dplyr)
library(leaflet)
library(leaflet.extras)
library(leaflet.providers)
library(DT)
library(plotly)
library(ggplot2)

function(input, output, session) {

# Home Page ---------------------------------------------------------------

  output$map <- renderLeaflet({
    leaflet() %>%
      addTiles() %>%
      addProviderTiles(input$basemap) %>%
      setView(lng = 29.240, lat = 39.3075, zoom = 12) %>%
      addCircles(data=dataDF,lng = ~dataDF$Longitude, lat = ~dataDF$Latitude) %>%
      addPolygons(data = studyArea) %>%
      addMiniMap(position = "bottomright") %>%
      addMeasure(
        position = "topleft",
        activeColor ="#3D535D",
        completedColor = "#7D4479",
        primaryLengthUnit = "meters",
        primaryAreaUnit = "hectares",
        localization = "en") %>%
      addScaleBar(
        position = "bottomleft"
      ) %>%
      addGraticule(
        interval = 6,
        style = list(color = "#333", weight = 1.5),
        options = pathOptions(pointerEvents = "none", clickable = T)) %>%
      addEasyButton(
        easyButton(
          icon="fa-crosshairs", title="ME",
          onClick=JS("function(btn, map){ map.locate({setView: true}); }")))
  })
  
  output$plotIndexData <- renderPlotly({})
  
  output$info <- renderPlot({
    plot(dataDF$Cu, dataDF$Pb)
  })
  
  output$plotIndexData <- renderText({
    xy_str <- function(e) {
      if(is.null(e)) return("NULL\n")
      paste0("x=", round(e$x, 1), " y=", round(e$y, 1), "\n")
    }
    xy_range_str <- function(e) {
      if(is.null(e)) return("NULL\n")
      paste0("xmin=", round(e$xmin, 1), " xmax=", round(e$xmax, 1), 
             " ymin=", round(e$ymin, 1), " ymax=", round(e$ymax, 1))
    }
    paste0(
      "click: ", xy_str(input$plot_click),
      "dblclick: ", xy_str(input$plot_dblclick),
      "hover: ", xy_str(input$plot_hover),
      "brush: ", xy_range_str(input$plot_brush)
    )
  })

# Analysis Page -----------------------------------------------------------

  selectedData <- reactive({
    dataDF[, c(input$xcol, input$ycol)]
    
  })
  clusters <- reactive({
    kmeans(selectedData(), input$clusters)
  })
  output$classGraph <- renderPlot({

    palette(c("#E41A1C", "#377EB8", "#4DAF4A", "#984EA3",
              "#FF7F00", "#FFFF33", "#A65628", "#F781BF", "#999999"))
    
    par(mar = c(5.1, 4.1, 0, 1))
    plot(selectedData(),
         col = clusters()$cluster,
         pch = 20, cex = 3)
    points(clusters()$centers, pch = 4, cex = 4, lwd = 4)
  })
  
  output$dataDFilter <-DT::renderDataTable(
    DT::datatable({dataDF},
                  options = list(lengthMenu=list(c(5,15,20),c('5','15','20')),pageLength=5,
                                 initComplete = JS(
                                   "function(settings, json) {",
                                   "$(this.api().table().header()).css({'background-color': 'moccasin', 'color': '1c1b1b'});",
                                   "}"),
                                 columnDefs=list(list(className='dt-center',targets="_all"))
                  ),
                  filter = "top",selection = 'multiple',style = 'bootstrap',class = 'cell-border stripe',rownames = T,
                  colnames = c("Latitude","Longitude","Point Number","Cu","Pb","Zn","Ni","As","Cd","Cr","Hg")
    ))  
}