library(shiny) 
library(shinydashboard) 
library(shinydashboardPlus) 
library(leaflet) 
library(DT) 
library(plotly)
library(ggplot2)

dashboardPagePlus(
  skin = "black", #loading_duration=1, #enable_preloader=T,
  dashboardHeaderPlus(title = "SoilSpatVis"),
  dashboardSidebar(
    sidebarMenu(
      menuItem("Home", tabName = "home", icon = icon("home")),
      menuItem("Analysis", tabName = "analysis", icon = icon("bar-chart-o")),
      menuItem("About", tabName = "about", icon = icon("info")),
      menuItem("Github Code Page", icon = icon("github"), href = "https://github.com/efdalkaya"))),
  dashboardBody(
    tabItems(
      tabItem(tabName = "home",
              fluidRow(
                column(2,boxPlus(title = "Properties",
                                 width = 12,
                                 status = "warning",
                                 solidHeader = F,
                                 selectInput("basemap","Select a Basemap",choices = basemaps),
                                 selectInput("evaluteMethods",
                                             "Select a Evalute Method",
                                             choices = c("Enrichment Factor (EF)",
                                                         "Geoaccumulation Index (Igeo)",
                                                         "Contamination Factor (CF)",
                                                         "Pollution Load Index (PLI)")))),
                column(5,
                       boxPlus(
                         title = "Spatial Data",
                         width=12,
                         status="warning",
                         solidHeader=F,
                         leafletOutput("map",width="100%",height="525px"))),
                column(5,
                       boxPlus(
                         title = "Graphic",
                         width=12,
                         status="warning",
                         solidHeader=F,
                         plotOutput("info",
                                    height="525px",
                                    click = "plot_click",
                                    dblclick = "plot_dblclick",
                                    hover = "plot_hover",
                                    brush = "plot_brush")))),
              fluidRow(
                column(12,
                       boxPlus(
                         title = "Information",
                         width=12,
                         status="warning",
                         solidHeader=F,
                         plotlyOutput("plotIndexData",width="100%",height="100%"))))),
      tabItem(tabName = "analysis",
              fluidPage(
                column(3,boxPlus(width=12,
                                 status="warning",
                                 solidHeader=T,
                                 selectInput("classify","Select a Classification Method:",choices=c("K-Means")),
                                 conditionalPanel(
                                   condition="input.classify=='K-Means'",
                                   selectInput('xcol','X Variable:',vars),
                                   selectInput('ycol','Y Variable:',vars,
                                               selected=vars[[2]]),
                                   numericInput('clusters','Cluster count:',3,min=1,max=9)))),
                column(9,boxPlus(width=12,status="warning",solidHeader = T,plotOutput("classGraph"))),
                column(12,boxPlus(width=12,status="warning",solidHeader = T,DT::dataTableOutput("dataDFilter"))))),
      tabItem(tabName = "about",
              fluidPage(
                boxPlus(width = 12,
                        solidHeader = T,
                        title = h4("OUR TEAM"),
                        fluidRow(
                          column(6,
                                 widgetUserBox(
                                   title = "Efdal KAYA",
                                   subtitle = "PHD Student",
                                   type = NULL,
                                   width = 12,
                                   src = "ek.png",
                                   color = "orange-active",
                                   closable = TRUE,"Some text here!",
                                   footer = "The footer here!")),
                          column(6,
                                 widgetUserBox(
                                   title = "Erman ŞENTÜRK",
                                   subtitle = "Doctor",
                                   type = NULL, 
                                   width = 12,
                                   src = "ek.png",
                                   color = "navy-active",
                                   closable = TRUE,"Some text here!",
                                   footer = "The footer here!"))),
                        fluidRow(
                          column(6,
                                 widgetUserBox(
                                   title = "Arzu ERENER",
                                   subtitle = "Professor Doctor",
                                   type = NULL,
                                   width = 12,
                                   src = "ek.png",
                                   color = "maroon",
                                   closable = TRUE,"Some text here!",
                                   footer = "The footer here!")),
                          column(6,
                                 widgetUserBox(
                                   title = "Nihat Hakan AKYOL",
                                   subtitle = "Associate Professor",
                                   type = NULL,
                                   width = 12, 
                                   src = "ek.png",
                                   color = "success",
                                   closable = TRUE,"Some text here!",
                                   footer = "The footer here!"))),
                        fluidRow(
                          column(6,
                                 widgetUserBox(
                                   title = "Cafer ÖZKUL",
                                   subtitle = "Associate Professor",
                                   type = NULL,
                                   width = 12,
                                   src = "ek.png",
                                   color = "danger",
                                   closable = TRUE,"Some text here!",
                                   footer = "The footer here!")))))))),
  
  dashboardFooter(left_text = "Develop by GIS Team", right_text = Sys.time()))