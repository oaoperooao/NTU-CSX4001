install.packages("wordcloud") # word-cloud generator 
install.packages("RColorBrewer") # color palettes
# Load
library("wordcloud")
library("RColorBrewer")
install.packages("rtweet")
install.packages("tidytext")
install.packages("dplyr")
install.packages("stringr")
require(devtools)
install_github("lchiffon/wordcloud2")

library(tidytext)
library(dplyr)
library(stringr)
library(rtweet)
library(wordcloud2)

#Grab tweets - note: reduce to 1000 if it's slow

create_token(
  app = "CSX4001",
  consumer_key = "os9BSEDDSzZKaa79hWbXeAUmm",
  consumer_secret = "K6KcZy4ZhQYpFoMWKKgZjVTXKSP4gAvTc760meWwmlQLJEWsAg",
  access_token = "3301954536-dvRxov51hUw3tU8yrJJnIDGHfhL0gVimjGX92u6",
  access_secret = "4Y7uewr8SyVmdAXuFBp2jXKskaLVuasmtPoizyR2Fx2x5",
)

#Grab tweets - note: reduce to 1000 if it's slow
hmt <- search_tweets(
  "#undertale", n = 2000, include_rts = FALSE
)

hmt$text

#Unnest the words - code via Tidy Text
hmtTable <- hmt %>% 
  unnest_tokens(word, text)

#remove stop words - aka typically very common words such as "the", "of" etc
data(stop_words)
hmtTable <- hmtTable %>%
  anti_join(stop_words)

#do a word count
hmtTable <- hmtTable %>%
  count(word, sort = TRUE) 
hmtTable 
#Remove other nonsense words
hmtTable <-hmtTable %>%
  filter(!word %in% c('t.co', 'https', 'undertale', "art", "it's", 'el', 'en', 'tv','に','た','が','て','の','と','は',
                     'で','を','って','い','な','っ','し','した','たい','アンダー','テール','繋がり','さん','ない','か','です',
                     'だ','2','も','れ','描','<U+307E>','<U+307E><U+3059>','<U+307F>','3','<U+304B><U+3089>',"ます",'や','もう','ちゃん',
                     'かな','けど','しま','ま','よ'))
wordcloud(words = hmtTable$word, freq = hmtTable$n, min.freq = 21,
          random.order=FALSE, 
          colors=brewer.pal(8, "Dark2"))

