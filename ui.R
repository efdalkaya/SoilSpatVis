library(shiny)
library(shinyalert)
library(shinyWidgets)
library(bs4Dash)
library(leaflet)
library(reactable)
library(plotly)
library(bsplus)

bs4DashPage(
  useShinyalert(),
  navbar=bs4DashNavbar(skin="dark",status="danger",border=T,sidebarIcon="bars",controlbarIcon="th",fixed=T),
  sidebar=bs4DashSidebar(skin="light",status="danger",brandColor="danger",title="SoilSpatVis 1.0",elevation=1,
                         bs4SidebarMenu(
                           bs4SidebarMenuItem("Home",tabName = "homepage",icon = "home"),
                           bs4SidebarMenuItem("Analysis",tabName = "analysispage",icon = "bar-chart-o"),
                           bs4SidebarMenuItem("About",tabName = "aboutpage", icon = "info"))),
  body=bs4DashBody(
    bs4TabItems(
      bs4TabItem(
        tabName="homepage",
        fluidPage(
          fluidRow(
            column(6,
                   bs4Card(width=12,title="Data Graphic",elevation=4,closable=F,status="danger",solidHeader=T,collapsible=T,plotlyOutput("pointGraph",height="325px"))),
            column(6,
                   bs4Card(width=12,title="Enrichment Factor Map",elevation=4,closable=F,status="danger",solidHeader=T,collapsible=T,leafletOutput("ef",height="325px")))),
          fluidRow(
            column(6,
                   bs4Card(width=12,title="Geoaccumulation Index Map",elevation=4,closable=F,status="danger",solidHeader=T,collapsible=T,leafletOutput("gi",height="320px"))),
            column(6,
                   bs4Card(width=12,title="Contamination Factor",elevation=4,closable=F,status="danger",solidHeader=T,collapsible=T,leafletOutput("cf",height="320px")))))),
      bs4TabItem(
        tabName="analysispage",
        fluidPage(
          fluidRow(
            column(3,
                   bs4Card(
                     width=12,elevation=4,closable=F,status="danger",solidHeader=T,collapsible=T,title="Machine Learning Classification",
                     selectInput("classify","Select a Classification Method:",choices=c("K-Means")),
                     conditionalPanel(
                       condition="input.classify=='K-Means'",
                       selectInput('xcol','X Variable:',vars),
                       selectInput('ycol','Y Variable:',vars,
                                   selected=vars[[2]]),
                       numericInput('clusters','Cluster count:',3,min=1,max=9)))),
            column(9,
                   bs4Card(width=12,elevation=4,closable=F,status="danger",solidHeader=T,collapsible=T,title="Classification Graphic",
                           plotOutput("classGraph")))),
          fluidRow(
            column(12, 
                   bs4Card(width=12,elevation=4,closable=F,status="danger",solidHeader=T,collapsible=T,title="Data View",
                           reactableOutput("dataDFilter",width = "auto", height = "auto", inline = FALSE))))
        )),
      bs4TabItem(
        tabName="aboutpage",
        fluidPage(
          fluidRow(
            bs4Box(
              width = 12,
              title = "OUR TEAM",
              fluidRow(
                column(4,
                       bs4UserCard(title="Efdal KAYA",subtitle="PHD Student",type=NULL,width=12,src="ek.png",status="danger",
                                   closable=TRUE,
                                   fluidPage(
                                     tags$div(
                                       h6("Iskenderun Techical University"),
                                       tags$img(src="iste.png", height=50, width=50),
                                       tags$br(),
                                       tags$a(href="https://iste.edu.tr/person/efdal-kaya", "More Details!")
                                     )))),
                column(4,
                       bs4UserCard(title="Erman SENTURK",subtitle="Doctor",type=NULL,width=12,src="es.png",status="danger",
                                   closable=TRUE,
                                   fluidPage(
                                     tags$div(
                                       h6("Kocaeli University"),
                                       tags$img(src="kou.png", height=50, width=50),
                                       tags$br(),
                                       tags$a(href="https://avesis.kocaeli.edu.tr/erman.senturk/", "More Details!")
                                   )))),
                column(4,
                       bs4UserCard(title="Arzu ERENER",subtitle="Professor Doctor",type=NULL,width=12,src="ae.jpg",status="danger",
                                   closable = TRUE,
                                   fluidPage(
                                     tags$div(
                                       h6("Kocaeli University"),
                                       tags$img(src="kou.png", height=50, width=50),
                                       tags$br(),
                                       tags$a(href="https://avesis.kocaeli.edu.tr/arzu.erener", "More Details!")
                                     ))))
              ),
              fluidRow(
                column(4,
                       bs4UserCard(title="Nihat Hakan AKYOL",subtitle="Associate Professor",type=NULL,width=12,src="nha.JPG",status="danger",
                                   closable = TRUE,
                                   fluidPage(
                                     tags$div(
                                       h6("Kocaeli University"),
                                       tags$img(src="kou.png", height=50, width=50),
                                       tags$br(),
                                       tags$a(href="https://avesis.kocaeli.edu.tr/hakan.akyol", "More Details!")
                                   )))),
                column(4,
                       bs4UserCard(title="Cafer OZKUL",subtitle="Associate Professor",type=NULL,width=12,src="co.jpeg",status="danger",
                                   closable = TRUE,
                                   fluidPage(
                                     tags$div(
                                       h6("Kutahya Dumlupinar University"),
                                       tags$img(src="dpu.png", height=50, width=50),
                                       tags$br(),
                                       tags$a(href="https://portal.dpu.edu.tr/cafer.ozkul/cv", "More Details!", target="_blank")))))))))))),
  footer=bs4DashFooter("Developed by GIS Team", right_text = Sys.time()),
  sidebar_mini=T,
  sidebar_collapsed=T,
  #enable_preloader = T,
  #loading_duration = 1,
  #loading_background = "#f1f1f1"
)