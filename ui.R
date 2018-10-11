
header <- dashboardHeader(
  title = "Stream do Twitter @ComuNICbr",
  titleWidth = 320
)

sidebar <- dashboardSidebar(

)


body <- dashboardBody(
  
  fluidRow(
    box(
      DT::dataTableOutput("streamBox", height = 800)
      ),
    box(
      plotOutput("timeSeries"),
      plotOutput("wordcloud")
    )
  )
)

dashboardPage(skin = "black", header, sidebar, body)
