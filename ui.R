shinyUI(
    pageWithSidebar(
        # Application title
        headerPanel("Cab Driver Reported Tip%, \nNYC, 2013"),
        sidebarPanel(
            numericInput('count', 'How many fares do you pick up last month?', 457, min = 1, max = 1001, step = 1),
            numericInput('fares', 'What is your gross monthly income?', 5332, min = 0, max = 5000, step = 100),
            checkboxGroupInput("id2", "Do you want to know about Crash or Credit transactions? Keep in mind that you should only have one box checked at one time", 
                               c("Cash" = "1",
                                 "Credit" = "0"), 0),
            submitButton('Submit')
        ),
        mainPanel(
            h3('Results of prediction'),
            h4('OK, so you picked up these many people in your cab:'),
            verbatimTextOutput("inputValue"),
            h4('Your Gross Monthly Income is'),
            verbatimTextOutput("fares"),
            h4('Assume your client is paying by:'),
            verbatimTextOutput("oid"), 
            h4('Then we can Predict your average tip percent as:'),
            verbatimTextOutput("prediction")
            #h4('text 3'),
            #verbatimTextOutput("text3")
        )
   ) )