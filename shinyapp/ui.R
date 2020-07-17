library(shiny)

shinyUI(fluidPage(
        
        # Application title
        titlePanel("Measure of Influence with Cook`s D Chart"),
        
        # Sidebar with a slider input for number of bins
        sidebarLayout(position = "right",
                sidebarPanel(
                        sliderInput("number","Number of observations:", min = 2, max = 100, value = 50),
                        sliderInput("xoutlier","Outlier x coordinates:", min = -100, max = 100, value = 50),
                        sliderInput("youtlier","Outlier x coordinates:", min = -100, max = 100, value = 50)        
                        
                ),
                
                # Show a plot of the generated distribution
                mainPanel(
                        plotOutput("p1"),
                        HTML("<br><br><br>"),
                        HTML("<br><br><br>"),
                        HTML("<br><br><br>"),
                        HTML("<br><br><br>"),
                        plotOutput("p2"),
                        HTML("<br><br><br>"),
                        HTML("<br><br><br>"),
                        HTML("<br><br><br>"),
                        HTML("<br><br><br>")
                        
                )
        )
))








                
