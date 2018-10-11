# CARREGAR PACOTES ------------------------------------------------------------
library(rtweet)
library(dplyr)
library(tidyr)
library(wordcloud)

# CARREGAR FUNÇÕES CUSTOMIZADAS ----------------------------------------------
  source("src/functions.R")

# AUTENTICAR NA API DO TWITTER -----------------------------------------------

# Nome do App
appname <- "MinerarNoR"

## API key
key <- "tuManxxt0ykYzuQrQiCPV4eU2"

## API secret
secret <- "EBue6muPSgcHXRuZ8KvkkIBNCO0b9IzRUJIYaZMMFJZigIN5tX"

# Criar token de acesso
twitter_token <- create_token(
  app = appname,
  consumer_key = key,
  consumer_secret = secret)

# OBTER TWEETS ----------------------------------------------------------------

###############################################################################
# Do jeito como está até agora, a função realiza a busca por N tweets
# para N termos, mas não faz recursivamente. Para continuar pegando os dados é
# preciso rodar novamente a função, que vai automaticamente incluir os novos
# tweets na base já existente. As pesquisas que fiz indicar duas soluções
# possíveis: agendar a execução do código de busca (com o pacote later,
# por exemplo), ou então agendar a execução do script como um todo (precisa
# reorganizar o script), ou a função.
# O resultado de cada consulta é agregado aos dados e salvo em
# "data/tweets.rds"
##############################################################################

## Definir keywords de busca
keywords <- c("internet", "opendata")

## Rapar os dados
tweets <- get_tweets(df = "tweets", q = keywords, n = 100, "data/tweets.rds")

## Segunda rodada de raspagem
tweets <- get_tweets(df = "tweets", q = keywords, n = 100, "data/tweets.rds")

## ...