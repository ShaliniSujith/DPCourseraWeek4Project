library(shiny)
library(ggplot2)
library(dplyr)

bcl <- read.csv("bcl-data.csv", stringsAsFactors = FALSE)

ui <- fluidPage(
  titlePanel("BC Liquor Store prices"),
  sidebarLayout(
    sidebarPanel(
      #Input for price
      sliderInput("priceInput", "Price", min = 0, max = 100, value = c(25, 40), pre = "$"),

      #Input for product type
      radioButtons("typeInput", "Product type",
                   choices = c("BEER", "REFRESHMENT", "SPIRITS", "WINE"),
                   selected = "BEER"),

      #Input for country
      selectInput("countryInput", "Country",
                  choices = c("CANADA", "FRANCE", "ITALY"))
    ),
    mainPanel(plotOutput("coolplot"),
              br(),br(),
              tableOutput("results")
              )
  )
)
