bs4DashPage(
  help = NULL,
  title = "SoilSpat 1.0",
  header = bs4DashNavbar(
    title = "SoilSpat 1.0",
    fixed = T,
    skin = "light",
    status = "white"
  ),
  sidebar = bs4DashSidebar(
    minified = F,
    skin = "light",
    status = "primary",
    bs4SidebarMenu(
      bs4SidebarMenuItem(tabName="home","Home",icon=icon("home")),
      bs4SidebarMenuItem(tabName="element","Elements Analysis",
                         icon=icon("elementor",lib = "font-awesome"),
                         bs4SidebarMenuSubItem(tabName = "arsenic","Arsenic",icon=icon("snowflake",lib = "font-awesome")),
                         bs4SidebarMenuSubItem(tabName = "mercury","Mercury",icon=icon("snowflake",lib = "font-awesome")),
                         bs4SidebarMenuSubItem(tabName = "lead","Lead",icon=icon("snowflake",lib = "font-awesome")),
                         bs4SidebarMenuSubItem(tabName = "cadmium","Cadmium",icon=icon("snowflake",lib = "font-awesome"))),
      bs4SidebarMenuItem(tabName="analysis","Classification",icon=icon("squarespace",lib = "font-awesome")),
      bs4SidebarMenuItem(tabName="about","About US",icon=icon("users"))
    )
  ),
  body = bs4DashBody(
    tabItems(
      # Home Page ---------------------------------------------------------------
      tabItem(
        tabName = "home",
        fluidPage(
          fluidRow(
            column(
              6,
              bs4ValueBox(
                width = 12,
                value = NULL,
                icon = icon("gear"),
                color = "success",
                subtitle = paste0("Researcher: 5")
                )
              ),
            column(
              6,
              bs4ValueBox(
                width = 12,
                value = NULL,
                icon = icon("gear"),
                color = "danger",
                subtitle = "Elements: 4"
                )
              )
            ),
          fluidRow(
            column(
              12,
              bs4Card(
                width=12,
                closable = F,
                collapsible = F,
                status = "primary",
                title = "",
                fluidPage(
                  fluidRow(
                    column(12,
                           HTML('<center><img src="logo.PNG" width="250"></center>')
                           )
                    )
                  )
                )
              )
            )
          )
        ),
      
      # Elements Analysis -------------------------------------------------------
      tabItem(
        tabName ="arsenic",
        fluidPage(
          fluidRow(
            column(6,
                   bs4Card(width=12,
                           elevation=4,
                           closable=F,
                           status="primary",
                           collapsible=T,
                           title="Enrichment Factor Map",
                           leafletOutput("as_ef"))),
            column(6,
                   bs4Card(width=12,
                           elevation=4,
                           closable=F,
                           status="primary",
                           collapsible=T,
                           title="Geoaccumulation Index Map",
                           leafletOutput("as_igeo")
                           ))
          ),
          fluidRow(
            column(4,
                   bs4Card(width=12,
                           elevation=4,
                           closable=F,
                           status="primary",
                           collapsible=T,
                           title="Data Correlation",
                           plotlyOutput("as_corr"))),
            column(8,
                   bs4Card(width=12,
                           elevation=4,
                           closable=F,
                           status="primary",
                           collapsible=T,
                           title="Arsenic Data",
                           reactableOutput("as_dataview")))
            )
          )
        ),
      tabItem(
        tabName ="mercury",
        fluidPage(
          fluidRow(
            column(6,
                   bs4Card(width=12,
                           elevation=4,
                           closable=F,
                           status="primary",
                           collapsible=T,
                           title="Enrichment Factor Map",
                           leafletOutput("cd_ef"))),
            column(6,
                   bs4Card(width=12,
                           elevation=4,
                           closable=F,
                           status="primary",
                           collapsible=T,
                           title="Geoaccumulation Index Map",
                           leafletOutput("cd_igeo")))
          ),
          fluidRow(
            column(4,
                   bs4Card(width=12,
                           elevation=4,
                           closable=F,
                           status="primary",
                           collapsible=T,
                           title="Mercury Data Correlation",
                           plotlyOutput("cd_corr"))),
            column(8,
                   bs4Card(width=12,
                           elevation=4,
                           closable=F,
                           status="primary",
                           collapsible=T,
                           title="Mercury Data",
                           reactableOutput("cd_dataview")))
          )
        )
        ),
      tabItem(
        tabName ="lead",
        fluidPage(
          fluidRow(
            column(6,
                   bs4Card(width=12,
                           elevation=4,
                           closable=F,
                           status="primary",
                           collapsible=T,
                           title="Enrichment Factor Map",
                           leafletOutput("hg_ef"))),
            column(6,
                   bs4Card(width=12,
                           elevation=4,
                           closable=F,
                           status="primary",
                           collapsible=T,
                           title="Geoaccumulation Index Map",
                           leafletOutput("hg_igeo")))
          ),
          fluidRow(
            column(4,
                   bs4Card(width=12,
                           elevation=4,
                           closable=F,
                           status="primary",
                           collapsible=T,
                           title="Lead Data Correlation",
                           plotlyOutput("hg_corr"))),
            column(8,
                   bs4Card(width=12,
                           elevation=4,
                           closable=F,
                           status="primary",
                           collapsible=T,
                           title="Lead Data",
                           reactableOutput("hg_dataview")))
          )
        )
        ),
      tabItem(
        tabName ="cadmium",
        fluidPage(
          fluidRow(
            column(6,
                   bs4Card(width=12,
                           elevation=4,
                           closable=F,
                           status="primary",
                           collapsible=T,
                           title="Enrichment Factor Map",
                           leafletOutput("pb_ef"))),
            column(6,
                   bs4Card(width=12,
                           elevation=4,
                           closable=F,
                           status="primary",
                           collapsible=T,
                           title="Geoaccumulation Index Map",
                           leafletOutput("pb_igeo")))
          ),
          fluidRow(
            column(4,
                   bs4Card(width=12,
                           elevation=4,
                           closable=F,
                           status="primary",
                           collapsible=T,
                           title="Cadmium Data Correlation",
                           plotlyOutput("pb_corr"))),
            column(8,
                   bs4Card(width=12,
                           elevation=4,
                           closable=F,
                           status="primary",
                           collapsible=T,
                           title="Cadmium Data",
                           reactableOutput("pb_dataview")))
          )
        )
        ),
      # Analysis Page -----------------------------------------------------------
      tabItem(
        tabName = "analysis",
        fluidPage(
          fluidRow(
            column(
              3,
              bs4Card(
                width=12,
                elevation=4,
                closable=F,
                status="primary",
                collapsible=T,
                title="Machine Learning Classification",
                selectInput("classify","Select a Classification Method:",choices=c("K-Means")),
                conditionalPanel(
                  condition="input.classify=='K-Means'",
                  selectInput('xcol','X Variable:',vars),
                  selectInput('ycol','Y Variable:',vars,selected=vars[[2]]),
                  numericInput('clusters','Cluster count:',3,min=1,max=9)
                )
              )),
            column(
              9,
              bs4Card(width=12,
                      elevation=4,
                      closable=F,
                      status="primary",
                      collapsible=T,
                      title="Classification Graphic",
                      plotOutput("classGraph")))
          ),
          fluidRow(
            column(
              12,
              bs4Card(width=12,
                      elevation=4,
                      closable=F,
                      status="primary",
                      collapsible=T,
                      title="Data View",
                      reactableOutput("data_kmeans",width = "auto", height = "auto", inline = FALSE)))
          )
        )
        ),
      
      # About Page --------------------------------------------------------------
      tabItem(
        tabName = "about",
        fluidPage(
          fluidRow(
            bs4Card(
              width = 12,
              title = "OUR TEAM",
              status = "primary",
              fluidRow(
                column(
                  4,
                  userBox(
                    width = 12,
                    title = userDescription(
                      title = "Efdal KAYA",
                      subtitle = "Dr.",
                      type = 2,
                      image = "ek.png",
                    ),
                    status = "primary",
                    gradient = F,
                    background = "white",
                    boxToolSize = "xl",
                    footer = tags$div(tags$a(href="https://iste.edu.tr/person/efdal-kaya", "More Details!"))
                  )
                  ),
                column(
                  4,
                  userBox(
                    width = 12,
                    title = userDescription(
                      title = "Erman ŞENTÜRK",
                      subtitle = "Assoc. Prof.",
                      type = 2,
                      image = "es.png",
                    ),
                    status = "primary",
                    gradient = F,
                    background = "white",
                    boxToolSize = "xl",
                    footer = tags$div(tags$a(href="https://avesis.kocaeli.edu.tr/erman.senturk/", "More Details!"))
                  )
                ),
                column(
                  4,
                  userBox(
                    width = 12,
                    title = userDescription(
                      title = "Arzu ERENER",
                      subtitle = "Prof. Dr.",
                      type = 2,
                      image = "ae.jpg",
                    ),
                    status = "primary",
                    gradient = F,
                    background = "white",
                    boxToolSize = "xl",
                    footer = tags$div(tags$a(href="https://avesis.kocaeli.edu.tr/arzu.erener", "More Details!"))
                  ))
                ),
              fluidRow(
                column(
                  4,
                  userBox(
                    width = 12,
                    title = userDescription(
                      title = "Nihat Hakan AKYOL",
                      subtitle = "Prof. Dr.",
                      type = 2,
                      image = "nha.JPG",
                    ),
                    status = "primary",
                    gradient = F,
                    background = "white",
                    boxToolSize = "xl",
                    footer = tags$div(tags$a(href="https://avesis.kocaeli.edu.tr/hakan.akyol", "More Details!"))
                  )),
                column(
                  4,
                  userBox(
                    width = 12,
                    title = userDescription(
                      title = "Cafer ÖZKUL",
                      subtitle = "Prof. Dr.",
                      type = 2,
                      image = "co.jpeg",
                    ),
                    status = "primary",
                    gradient = F,
                    background = "white",
                    boxToolSize = "xl",
                    footer = tags$div(tags$a(href="https://portal.dpu.edu.tr/cafer.ozkul/cv", "More Details!"))
                    )
                  )
                )
              )
            )
          )
        )
      )
    ),

  # Footer Page -------------------------------------------------------------
  footer = bs4DashFooter(left = "Developed by GIS Team", right = "Copyright@2023")
)