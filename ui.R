
header <- dashboardHeader(
  title = "Stream do Twitter @ComuNICbr",
  titleWidth = 320
)

sidebar <- dashboardSidebar(
  sidebarMenu(
    menuItem(
      selectInput(inputId = "x",
                  label = "Eixo x",
                  choices = c("NumPessoasFam", "IdadeAnos", "RendTrabPrinc",
                              "RendTrabDemais", "RendOutrasFontes", "RendMensal",      
                              "RendTrab", "pesoRendTrab"),
                  selected = "NumPessoasFam")
      ),
    
    menuItem(
      submitButton("Aplicar mudanças")
      )
    )
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
