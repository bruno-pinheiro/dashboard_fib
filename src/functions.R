# para raspar os dados e incrementar a base iterativamente
get_tweets <- function(df, q, n = 100, arquivo) {
  
  if (!file.exists(arquivo)) {
    tl <- search_tweets2(q = q, n)
    return(tl)
    
  } else {
    
    df <- readRDS(arquivo)
    
    ultimo_id <- df %>% 
      filter(query == tail(tags, 1)) %>% 
      slice(1) %>% pull(status_id)
    
    tl <- search_tweets2(q = q, n, max_id = ultimo_id)
    
    tl <- rbind(df, tl) %>%
      filter(!duplicated(.))

    saveRDS(tl, file = arquivo)
    
    return(tl)
    
  }
}

# Função para criar links na tabela de tweets
criarlinks <- function(x) {
  if(is.na(x)){
    return("")
  }else{
    sprintf(paste0('<a href="', URLdecode(x),'" target="_blank">', 
                   substr(x, 1, 25) ,'</a>'))
  }
}


