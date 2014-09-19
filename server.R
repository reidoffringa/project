library(shiny)

#tipamount <- function(x, y, z) 0.2029+(-0.203*x)+(0.000009061*y)+(-0.000000791*z)
tipamount2 <- function(x, y, z) 0.2019+
    (-0.2019*x)+
    (0.00001634*y)+
    (-0.0000006741*z)+
    (-0.000005104*x*y)+
    (-0.00000000122*x*z)


shinyServer(
    function(input, output) {
        output$inputValue <- renderPrint({input$count})
        output$fares <- renderPrint({input$fares})
        #output$oid2 <- renderPrint({input$id2})
        output$oid <- renderText({
            if (input$id2 == 0) "Credit!" 
            else if (input$id2 == 1) "Cash and no one reports cash tips, I guess"
        })
        #    output$text3 <- renderText({as.numeric(
        #        if (input$id2 == 0) 0
        #        else if (input$id2 == 1) 1
        #    )})
        #isolate(paste(input$text1, input$text2))
        
        output$prediction <- renderPrint({tipamount2({as.numeric(input$id2)}, 
                                                    (input$count/2), 
                                                    (input$fares/2))*100})
})