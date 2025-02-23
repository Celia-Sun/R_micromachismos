library(dplyr)
library(wordcloud2)
library(tm)

#--Crear grupos y subgrupos--#

menores <- Respuestas %>% filter(Edad >= 18 & Edad <= 30)
mayores <- Respuestas %>% filter(Edad > 50)

#Crear subgrupos#

menores_si <- menores %>% filter(P1 == "Sí")
menores_no <- menores %>% filter(P1 == "No")

mayores_si <- mayores %>% filter(P1 == "Sí")
mayores_no <- mayores %>% filter(P1 == "No")

#--Limpiar texto y crear nubes de palabras--#

crear_nube <- function(texto, max_palabras = 100) { 
  corpus <- Corpus(VectorSource(texto))
  
  #Preprocesar el texto
  
  corpus <- corpus |>
    tm_map(content_transformer(tolower)) |>   # Convertir a minúsculas
    tm_map(removePunctuation) |>              # Eliminar puntuación
    tm_map(removeNumbers) |>                  # Eliminar números
    tm_map(removeWords, stopwords("spanish")) # Eliminar palabras vacías
  
  #Matriz de términos
  
  tdm <- TermDocumentMatrix(corpus)
  m <- as.matrix(tdm)
  palabras <- sort(rowSums(m), decreasing = TRUE)  # Ordenar por frecuencia
  palabras_df <- data.frame(palabra = names(palabras), freq = palabras)
  
  #Eliminar varias palabras
  
  palabras_eliminar <- c("irina", "félix", "felix", "dos",
                         "echa", "además", "parte", "disculsion")
  palabras_df <- palabras_df |>
    filter(!palabra %in% palabras_eliminar)
  
  #Limitar a las 'max_palabras' más frecuentes
  
  palabras_df <- palabras_df |>
    slice_max(order_by = freq, n = max_palabras)
  
  #Generar la nube de palabras
  
  wordcloud2(palabras_df, size = 0.5, color = "random-light", backgroundColor = "white")
}

#--Crear nubes de palabras para cada subgrupo--#

#Nubes para "menores"

crear_nube(menores_si$R1)
crear_nube(menores_no$R1)

#Nubes para "mayores"

crear_nube(mayores_si$R1)
crear_nube(mayores_no$R1)
