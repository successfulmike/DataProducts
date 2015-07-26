library(shiny)
library(UsingR)
library(ggplot2)
data(diamond)

# fit <- lm(price ~ carat, data = diamond)
# fit2 <- lm(price ~ I(carat - mean(carat)), data = diamond)
# fit3 <- lm(price ~ I(carat * 10), data = diamond)
# newx <- c(0.16, 0.27, 0.34)
# predict(fit, newdata = data.frame(carat = newx))

# > plot(diamond$carat, diamond$price, xlab = "Mass (carats)", ylab = "Price (SIN $)",
#        +      bg = "lightblue", col = "black", cex = 1.1, pch = 21,frame = FALSE)
# > abline(fit, lwd = 2)
# > points(diamond$carat, predict(fit), pch = 19, col = "red")
# > lines(c(0.16, 0.16, 0.12), c(200, coef(fit)[1] + coef(fit)[2] * 0.16,
#                                +                              coef(fit)[1] + coef(fit)[2] * 0.16))
# > lines(c(0.27, 0.27, 0.12), c(200, coef(fit)[1] + coef(fit)[2] * 0.27,
#                                +                              coef(fit)[1] + coef(fit)[2] * 0.27))
# > lines(c(0.34, 0.34, 0.12), c(200, coef(fit)[1] + coef(fit)[2] * 0.34,
#                                +                              coef(fit)[1] + coef(fit)[2] * 0.34))
# > text(newx+c(0.03, 0, 0), rep(250, 3), labels = newx, pos = 2)

shinyServer(function(input,output) {
    
    output$distPlot <- renderPlot({
        fit <- lm(price ~ carat, data = diamond)
        fit2 <- lm(price ~ I(carat - mean(carat)), data = diamond)
        fit3 <- lm(price ~ I(carat * 10), data = diamond)
        newx <- c(0.16, 0.27, 0.34)
        predict(fit, newdata = data.frame(carat = newx))

        plot(diamond$carat, diamond$price, xlab = "Mass (carats)", ylab = "Price (SIN $)",bg = "lightblue", col = "black", cex = 1.1, pch = 21,frame = FALSE)
        abline(fit, lwd = 2)
        points(diamond$carat, predict(fit), pch = 19, col = "red")

lineType <- reactive({
    switch(input$cwt,
           "0.16" = lines(c(0.16, 0.16, 0.12), c(200, coef(fit)[1] + coef(fit)[2] * 0.16,coef(fit)[1] + coef(fit)[2] * 0.16)),
           "0.27" = lines(c(0.27, 0.27, 0.12), c(200, coef(fit)[1] + coef(fit)[2] * 0.27,coef(fit)[1] + coef(fit)[2] * 0.27)),
           "0.34" = lines(c(0.34, 0.34, 0.12), c(200, coef(fit)[1] + coef(fit)[2] * 0.34,coef(fit)[1] + coef(fit)[2] * 0.34)))
})

        lineType
#         lines(c(0.16, 0.16, 0.12), c(200, coef(fit)[1] + coef(fit)[2] * 0.16,coef(fit)[1] + coef(fit)[2] * 0.16))
#         lines(c(0.27, 0.27, 0.12), c(200, coef(fit)[1] + coef(fit)[2] * 0.27,coef(fit)[1] + coef(fit)[2] * 0.27))
#         lines(c(0.34, 0.34, 0.12), c(200, coef(fit)[1] + coef(fit)[2] * 0.34,coef(fit)[1] + coef(fit)[2] * 0.34))
        text(newx+c(0.03, 0, 0), rep(250, 3), labels = newx, pos = 2)


    })
    output$radiosel <- renderText(input$cwt)
    
})