
library(shiny)
#library(ggplot2)

# Define server logic required to draw a histogram
shinyServer(
        function(input, output, session) {
                
                output$p1 <- renderPlot({
                        library(ggplot2)
                        n <- as.numeric(input$number)
                        xo <- as.numeric(input$xoutlier)
                        yo <- as.numeric(input$youtlier)
                        x1 <- rnorm(n,mean=0,sd=20)
                        y1 <- rnorm(n,mean=10,sd=1)
                        df1 <- data.frame(x1=x1, y1=y1, cat=as.factor("normal"))
                        df11 <- split(df1,1:2)
                        outliers <- data.frame(x1=xo, y1=yo,cat=as.factor("outlier"))
                        df2 <- rbind(df11$`1`, outliers,df11$`2`)
                        reg1<-lm(y1 ~ x1, data = df1)
                        reg2<-lm(y1 ~ x1, data = df2)
                        p11 <- ggplot(df2, aes(x=x1, y=y1)) +
                                geom_point(aes(colour=cat, shape=cat,size=cat), alpha=0.5)+
                                scale_color_manual(values=c("blue", "red"))+
                                scale_shape_manual(values=c(19,8))+
                                scale_size_manual(values=c(3,8)) +
                                geom_abline(intercept = reg1$coefficients[1], slope = reg1$coefficients[2], color="blue", linetype="solid", size=1)+
                                geom_abline(intercept = reg2$coefficients[1], slope = reg2$coefficients[2], color="red", linetype="solid", size=1)+
                                xlim(-100, 100)+
                                ylim(-100,100)+
                                theme(aspect.ratio = 1)+
                                ggtitle("Scatter plots and lines of linear regression", subtitle ="blue without outlier, red with the effect of the outlier")
                        p11
                }, height = 600, width = 600)
  
  
                output$p2 <- renderPlot({
                  library(olsrr)
                  n <- as.numeric(input$number)
                  xo <- as.numeric(input$xoutlier)
                  yo <- as.numeric(input$youtlier)
                  n <- as.numeric(input$number)
                  xo <- as.numeric(input$xoutlier)
                  yo <- as.numeric(input$youtlier)
                  x1 <- rnorm(n,mean=0,sd=20)
                  y1 <- rnorm(n,mean=10,sd=1)
                  df1 <- data.frame(x1=x1, y1=y1, cat=as.factor("normal"))
                  df11 <- split(df1,1:2)
                  outliers <- data.frame(x1=xo, y1=yo,cat=as.factor("outlier"))
                  df2 <- rbind(df11$`1`, outliers,df11$`2`)
                  reg2<-lm(y1 ~ x1, data = df2)
                  p2 <- ols_plot_cooksd_chart(reg2)
                  p2
                })                
                
                
            
                
                
                
        }
  
  
  
)
