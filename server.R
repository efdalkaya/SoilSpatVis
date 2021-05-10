library(leaflet)
library(leaflet.extras)
library(leaflet.providers)
library(reactable)
library(plotly)
library(ggplot2)
library(raster)

function(input, output, session) {

# Home Page ---------------------------------------------------------------
  
  # Alert
  shinyalert(
    title = "WELCOME",
    text = "Welcome to our visualizations software.",
    size = "s", 
    closeOnEsc = TRUE,
    closeOnClickOutside = FALSE,
    html = FALSE,
    type = "success",
    showConfirmButton = TRUE,
    showCancelButton = FALSE,
    confirmButtonText = "OK",
    confirmButtonCol = "#AEDEF4",
    timer = 0,
    imageUrl = "",
    animation = TRUE
  )
  
  output$pointGraph <- renderPlotly({
    corr <- cor(select_if(dataDF, is.numeric))
    plot_ly(colors = "RdBu") %>%
      add_heatmap(x = rownames(corr), y = colnames(corr), z = corr) %>%
      colorbar(limits = c(-1, 1))
  })
  
  efCol <- colorNumeric(c("#feedde","#fdbe85","#fd8d3c","#e6550d","#a63603"), values(ef),na.color = "transparent")
  giCol <- colorNumeric(c("#edf8e9","#bae4b3","#74c476","#31a354","#006d2c"), values(gi),na.color = "transparent")
  cfCol <- colorNumeric(c("#f6eff7","#bdc9e1","#67a9cf","#1c9099","#016c59"), values(cf),na.color = "transparent")
  
  output$ef <- renderLeaflet({
    leaflet() %>%
      addTiles() %>%
      setView(lng = 29.255, lat = 39.305, zoom = 11) %>%
      addMiniMap(position = "bottomright") %>%
      addRasterImage(ef, opacity = 0.8) %>%
      addLegend(pal=efCol,values=values(ef),title="Enrichment Factor (EF) Risk", position = "topright") %>%
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
  
  output$gi <- renderLeaflet({
    leaflet() %>%
      addTiles() %>%
      setView(lng = 29.255, lat = 39.305, zoom = 11) %>%
      addMiniMap(position = "bottomright") %>%
      addRasterImage(gi, colors = giCol, opacity = 0.8) %>%
      addLegend(pal=giCol,values=values(gi),title="Geoaccumulation Index Risk", position = "topright") %>%
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
  
  output$cf <- renderLeaflet({
    leaflet() %>%
      addTiles() %>%
      setView(lng = 29.255, lat = 39.305, zoom = 11) %>%
      addMiniMap(position = "bottomright") %>%
      addRasterImage(cf, colors = cfCol, opacity = 0.8) %>%
      addLegend(pal=cfCol,values=values(cf),title="Contamination Factor (CF) Risk", position = "topright") %>%
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
  
  output$dataDFilter <- renderReactable({
    reactable(dataDF)
    }) 
}