library(shiny)

shinyUI(fluidPage(
    
    titlePanel("Shiny Diamond Prediction App"),
    
    sidebarLayout(
        sidebarPanel(
            radioButtons("cwt", label = "Available Diamonds/cwt",
                         choices = list("0.16" = 0.16, "0.27" = 0.27,
                                        "0.34" = 0.34),selected = 0.16)
            ),
        mainPanel(
            plotOutput("distPlot"),
            textOutput("radiosel"),
            textOutput("price")
            )
        )
    )
)