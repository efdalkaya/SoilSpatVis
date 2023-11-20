function(input,output,session) {
  # as Elements -------------------------------------------------------------
  as_data <- reactive({
    select(data_emet,"lat","lon","NN","As(mg/kg)","Cd(mg/kg)","Hg(mg/kg)","Pb(mg/kg)","Mn(mg/kg)","as_ef","as_igeo" )
  })
  
  output$as_ef <- renderLeaflet({
    leaflet() %>%
      setView(lng = 29.3, lat = 39.295, zoom = 11) %>%
      addTiles() %>%
      addRasterImage(as_ef,colors = col_as_ef, opacity = 0.8) %>%
      addLegend(pal=col_as_ef,
                values=values(as_ef),
                title="Enrichment Factor Risk Value", 
                position = "topright"
                ) %>%
      addMarkers(data = Locations,lat = ~lat, lng = ~long, popup = Locations$name) %>%
      addMeasure(primaryAreaUnit = "hectares",primaryLengthUnit = "meters",position = "topleft") %>%
      addScaleBar(position = "bottomleft") %>%
      addGraticule(
        interval = 0.5,
        style = list(color = "#333", weight = 1),
        options = pathOptions(pointerEvents = "none", clickable = T)) %>%
      addMiniMap() %>%
      addEasyButton(
        easyButton(
          icon="fa-crosshairs", title="MY LOCATION",
          onClick=JS("function(btn, map){ map.locate({setView: true}); }")))
  })
  
  output$as_igeo <- renderLeaflet({
    leaflet() %>%
      setView(lng = 29.3, lat = 39.295, zoom = 11) %>%
      addTiles() %>%
      addRasterImage(as_igeo,colors = col_as_igeo, opacity = 0.8) %>%
      addLegend(pal=col_as_igeo,
                values=values(as_igeo),
                title="Geoaccumulation Index Risk Value", 
                position = "topright"
      ) %>%
      addMarkers(data = Locations,lat = ~lat, lng = ~long, popup = Locations$name) %>%
      addMeasure(primaryAreaUnit = "hectares",primaryLengthUnit = "meters",position = "topleft") %>%
      addScaleBar(position = "bottomleft") %>%
      addGraticule(
        interval = 0.5,
        style = list(color = "#333", weight = 1),
        options = pathOptions(pointerEvents = "none", clickable = T)) %>%
      addMiniMap() %>%
      addEasyButton(
        easyButton(
          icon="fa-crosshairs", title="MY LOCATION",
          onClick=JS("function(btn, map){ map.locate({setView: true}); }")))
  })
  
  output$as_corr <- renderPlotly({
    corr <- cor(select_if(as_data(), is.numeric))
    plot_ly(colors = "RdBu") %>%
      add_heatmap(x = rownames(corr), y = colnames(corr), z = corr) %>%
      colorbar(limits = c(-1, 1))
  })
  
  output$as_dataview <- renderReactable({
    reactable(
      data = as_data(),
      defaultPageSize = 5,
      showPageSizeOptions = TRUE,
      pageSizeOptions = c(5, 10, 20),
      filterable = TRUE,
      bordered = TRUE,
      highlight = TRUE
    )
  })
  # cd Elements -------------------------------------------------------------
  cd_data <- reactive({
    select(data_emet,"lat","lon","NN","As(mg/kg)","Cd(mg/kg)","Hg(mg/kg)","Pb(mg/kg)","Mn(mg/kg)","cd_ef","cd_igeo" )
  })
  
  output$cd_ef <- renderLeaflet({
    leaflet() %>%
      setView(lng = 29.3, lat = 39.295, zoom = 11) %>%
      addTiles() %>%
      addRasterImage(cd_ef,colors = col_cd_ef, opacity = 0.8) %>%
      addLegend(pal=col_cd_ef,
                values=values(cd_ef),
                title="Enrichment Factor Risk Value", 
                position = "topright"
      ) %>%
      addMarkers(data = Locations,lat = ~lat, lng = ~long, popup = Locations$name) %>%
      addMeasure(primaryAreaUnit = "hectares",primaryLengthUnit = "meters",position = "topleft") %>%
      addScaleBar(position = "bottomleft") %>%
      addGraticule(
        interval = 0.5,
        style = list(color = "#333", weight = 1),
        options = pathOptions(pointerEvents = "none", clickable = T)) %>%
      addMiniMap() %>%
      addEasyButton(
        easyButton(
          icon="fa-crosshairs", title="MY LOCATION",
          onClick=JS("function(btn, map){ map.locate({setView: true}); }")))
  })
  
  output$cd_igeo <- renderLeaflet({
    leaflet() %>%
      setView(lng = 29.3, lat = 39.295, zoom = 11) %>%
      addTiles() %>%
      addRasterImage(cd_igeo,colors = col_cd_igeo, opacity = 0.8) %>%
      addLegend(pal=col_cd_igeo,
                values=values(cd_igeo),
                title="Geoaccumulation Index Risk Value", 
                position = "topright"
      ) %>%
      addMarkers(data = Locations,lat = ~lat, lng = ~long, popup = Locations$name) %>%
      addMeasure(primaryAreaUnit = "hectares",primaryLengthUnit = "meters",position = "topleft") %>%
      addScaleBar(position = "bottomleft") %>%
      addGraticule(
        interval = 0.5,
        style = list(color = "#333", weight = 1),
        options = pathOptions(pointerEvents = "none", clickable = T)) %>%
      addMiniMap() %>%
      addEasyButton(
        easyButton(
          icon="fa-crosshairs", title="MY LOCATION",
          onClick=JS("function(btn, map){ map.locate({setView: true}); }")))
  })
  
  output$cd_corr <- renderPlotly({
    corr <- cor(select_if(cd_data(), is.numeric))
    plot_ly(colors = "RdBu") %>%
      add_heatmap(x = rownames(corr), y = colnames(corr), z = corr) %>%
      colorbar(limits = c(-1, 1))
  })
  
  output$cd_dataview <- renderReactable({
    reactable(
      data = as_data(),
      defaultPageSize = 5,
      showPageSizeOptions = TRUE,
      pageSizeOptions = c(5, 10, 20),
      filterable = TRUE,
      bordered = TRUE,
      highlight = TRUE
    )
  })
  # hg Elements -------------------------------------------------------------
  hg_data <- reactive({
    select(data_emet,"lat","lon","NN","As(mg/kg)","Cd(mg/kg)","Hg(mg/kg)","Pb(mg/kg)","Mn(mg/kg)","hg_ef","hg_igeo" )
  })
  
  output$hg_ef <- renderLeaflet({
    leaflet() %>%
      setView(lng = 29.3, lat = 39.295, zoom = 11) %>%
      addTiles() %>%
      addRasterImage(hg_ef,colors = col_cd_ef, opacity = 0.8) %>%
      addLegend(pal=col_hg_ef,
                values=values(hg_ef),
                title="Enrichment Factor Risk Value", 
                position = "topright"
      ) %>%
      addMarkers(data = Locations,lat = ~lat, lng = ~long, popup = Locations$name) %>%
      addMeasure(primaryAreaUnit = "hectares",primaryLengthUnit = "meters",position = "topleft") %>%
      addScaleBar(position = "bottomleft") %>%
      addGraticule(
        interval = 0.5,
        style = list(color = "#333", weight = 1),
        options = pathOptions(pointerEvents = "none", clickable = T)) %>%
      addMiniMap() %>%
      addEasyButton(
        easyButton(
          icon="fa-crosshairs", title="MY LOCATION",
          onClick=JS("function(btn, map){ map.locate({setView: true}); }")))
  })
  
  output$hg_igeo <- renderLeaflet({
    leaflet() %>%
      setView(lng = 29.3, lat = 39.295, zoom = 11) %>%
      addTiles() %>%
      addRasterImage(hg_igeo,colors = col_hg_igeo, opacity = 0.8) %>%
      addLegend(pal=col_hg_igeo,
                values=values(hg_igeo),
                title="Geoaccumulation Index Risk Value", 
                position = "topright"
      ) %>%
      addMarkers(data = Locations,lat = ~lat, lng = ~long, popup = Locations$name) %>%
      addMeasure(primaryAreaUnit = "hectares",primaryLengthUnit = "meters",position = "topleft") %>%
      addScaleBar(position = "bottomleft") %>%
      addGraticule(
        interval = 0.5,
        style = list(color = "#333", weight = 1),
        options = pathOptions(pointerEvents = "none", clickable = T)) %>%
      addMiniMap() %>%
      addEasyButton(
        easyButton(
          icon="fa-crosshairs", title="MY LOCATION",
          onClick=JS("function(btn, map){ map.locate({setView: true}); }")))
  })
  
  output$hg_corr <- renderPlotly({
    corr <- cor(select_if(hg_data(), is.numeric))
    plot_ly(colors = "RdBu") %>%
      add_heatmap(x = rownames(corr), y = colnames(corr), z = corr) %>%
      colorbar(limits = c(-1, 1))
  })
  
  output$hg_dataview <- renderReactable({
    reactable(
      data = as_data(),
      defaultPageSize = 5,
      showPageSizeOptions = TRUE,
      pageSizeOptions = c(5, 10, 20),
      filterable = TRUE,
      bordered = TRUE,
      highlight = TRUE
    )
  })
  # pb Elements -------------------------------------------------------------
  pb_data <- reactive({
    select(data_emet,"lat","lon","NN","As(mg/kg)","Cd(mg/kg)","Hg(mg/kg)","Pb(mg/kg)","Mn(mg/kg)","pb_ef","pb_igeo" )
  })
  
  output$pb_ef <- renderLeaflet({
    leaflet() %>%
      setView(lng = 29.3, lat = 39.295, zoom = 11) %>%
      addTiles() %>%
      addRasterImage(pb_ef,colors = col_pb_ef, opacity = 0.8) %>%
      addLegend(pal=col_pb_ef,
                values=values(pb_ef),
                title="Enrichment Factor Risk Value", 
                position = "topright"
      ) %>%
      addMarkers(data = Locations,lat = ~lat, lng = ~long, popup = Locations$name) %>%
      addMeasure(primaryAreaUnit = "hectares",primaryLengthUnit = "meters",position = "topleft") %>%
      addScaleBar(position = "bottomleft") %>%
      addGraticule(
        interval = 0.5,
        style = list(color = "#333", weight = 1),
        options = pathOptions(pointerEvents = "none", clickable = T)) %>%
      addMiniMap() %>%
      addEasyButton(
        easyButton(
          icon="fa-crosshairs", title="MY LOCATION",
          onClick=JS("function(btn, map){ map.locate({setView: true}); }")))
  })
  
  output$pb_igeo <- renderLeaflet({
    leaflet() %>%
      setView(lng = 29.3, lat = 39.295, zoom = 11) %>%
      addTiles() %>%
      addRasterImage(pb_igeo,colors = col_pb_igeo, opacity = 0.8) %>%
      addLegend(pal=col_pb_igeo,
                values=values(pb_igeo),
                title="Geoaccumulation Index Risk Value", 
                position = "topright"
      ) %>%
      addMarkers(data = Locations,lat = ~lat, lng = ~long, popup = Locations$name) %>%
      addMeasure(primaryAreaUnit = "hectares",primaryLengthUnit = "meters",position = "topleft") %>%
      addScaleBar(position = "bottomleft") %>%
      addGraticule(
        interval = 0.5,
        style = list(color = "#333", weight = 1),
        options = pathOptions(pointerEvents = "none", clickable = T)) %>%
      addMiniMap() %>%
      addEasyButton(
        easyButton(
          icon="fa-crosshairs", title="MY LOCATION",
          onClick=JS("function(btn, map){ map.locate({setView: true}); }")))
  })
  
  output$pb_corr <- renderPlotly({
    corr <- cor(select_if(pb_data(), is.numeric))
    plot_ly(colors = "RdBu") %>%
      add_heatmap(x = rownames(corr), y = colnames(corr), z = corr) %>%
      colorbar(limits = c(-1, 1))
  })
  
  output$pb_dataview <- renderReactable({
    reactable(
      data = as_data(),
      defaultPageSize = 5,
      showPageSizeOptions = TRUE,
      pageSizeOptions = c(5, 10, 20),
      filterable = TRUE,
      bordered = TRUE,
      highlight = TRUE
    )
  })
  
  # Analysis Page -----------------------------------------------------------
  selectedData <- reactive({
    data_emet[, c(input$xcol, input$ycol)]
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
  
  output$data_kmeans <- renderReactable({
    reactable(
      data = data_emet,
      defaultPageSize = 3,
      showPageSizeOptions = TRUE,
      pageSizeOptions = c(5, 10, 20),
      filterable = TRUE,
      bordered = TRUE,
      highlight = TRUE)
    })
}