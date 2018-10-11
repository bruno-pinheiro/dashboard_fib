# CARREGAR PACOTES ------------------------------------------------------------
library(rtweet)
library(dplyr)
library(tidyr)
library(stringr)
library(lubridate)
library(DT)
library(shiny)
library(shinydashboard)
library(widgetframe)
library(wordcloud)

# CARREGAR FUNÇÕES ------------------------------------------------------------
source("src/functions.R")

# IMPORTAR DADOS --------------------------------------------------------------
tweets <- readRDS("data/tweets.rds")

# PREPARAR OS DADOS -----------------------------------------------------------
tweets <- tweets %>% 
  select(created_at, screen_name, text, hashtags, urls_expanded_url, query) %>% 
  mutate(created_at2 = format(ymd_hms(created_at), "%d/%m/%Y\n%H:%M"),
         urls = lapply(urls_expanded_url,
                       function(x) sapply(x, criarlinks)))
