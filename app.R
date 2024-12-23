library("shiny")
library(ggplot2)
library(readr)
trees <- read_csv("~/Downloads/2015_Street_Tree_Census_-_Tree_Data (1) (1).csv")
View(trees)
l
shinyUI<-(fluidPage(
    titlePanel("Newyork State trees survey"),
    sidebarLayout(
        sidebarPanel(
            sliderInput (inputId ="bins",
                         label = "Number of bins:",
                         min = 1,
                         max = 10,
                         value = 5
                         
                         )
            ),
        mainPanel(
            plotOutput(outputId = "Histplot")
        )            
        ),
      
    
)
)
    
    server<- function(input, output) {
        output$Histplot <- renderPlot({
            x<-trees$st_senate
            bins<- seq(min(x), max(x), length.out =input$bins+ 1)
            
            hist(x, breaks = bins, col = "light pink", border= "black",
                 xlab = "Geo codes", 
                 main ='NY STATE SENATE DISTRICT ')
        })
        
    }
shinyApp(shinyUI, server )







