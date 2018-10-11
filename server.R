
# Define server logic required to draw a histogram
server <- function(input, output) {
  
  output$streamBox <- DT::renderDataTable({
    # Criar a tabela
    my_table <- DT::datatable(
      tweets %>% select(created_at2, screen_name, text, urls),
      options = list(scrollX = TRUE, autoWidth = TRUE,
                     columnDefs = list(list(
                       width = '100%',
                       targets = c(2)))),
      rownames = FALSE,
      fillContainer = TRUE,
      width = "100%",
      colnames = c("Data", "Conta", "Texto", "URL"))

    my_table

  })

  output$timeSeries <- renderPlot({
    ts_plot(tweets, "5 minutes") +
      hrbrthemes::theme_ipsum_tw() +
      theme(plot.title = element_text(face = "bold")) +
      labs(
        x = NULL, y = NULL,
        title = "Frequência de status do Twitter sobre #internet e #opendata",
        subtitle = "Status agregados em intervalos de 5 minutos",
        caption = "\nFonte: Dados coletados da REST API do Twitter via rtweet"
      )
  })
  
  output$wordcloud <- renderPlot({
    # contar hastags
    hash <- unnest(tweets, hashtags) %>%
      filter(query == "opendata") %>% 
      count(hashtags, sort = TRUE) %>% 
      filter(!is.na(hashtags))
    
    # Criar nuvem de palavras
    wordcloud(words = hash$hashtags, freq = hash$n, min.freq = 1, scale = c(4, 1),
              max.words=100, random.order=FALSE, rot.per=0.3, 
              colors=brewer.pal(8, "Dark2"))
  })
}
