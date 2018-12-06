library(shinyalert)
library(shinythemes)
library(shinyWidgets)
library(ggplot2)
ui <- fluidPage(theme = shinytheme("simplex"),
                useShinyalert(),
                tags$h1(id="big-heading","Welcome to the mojito game"),

                fluidRow(
                  column(6,h3(textOutput("Elapsedtime"))),
                  column(3,tags$h3("You have sold : ")),
                  column(1,h3(textOutput("saled_mojito"))),
                  column(1,tags$h3(id="big-heading","Mojito "))
                ),

                fluidRow(
                  tags$h2("Cost Parameter"),
                  column(4,tags$h4(id="big-heading","Marketing level (max 10)"),
                         column(5,verbatimTextOutput("marketinglevel")),
                         column(2,
                                actionBttn(
                                  inputId = "addmarketing",
                                  label = "+",
                                  color = "warning",
                                  style = "simple")),
                         tags$h5("Upgrade marketing for 250$")
                  ),
                  column(5,tags$h4("Number of server :"),
                         column(1,
                                actionBttn(
                                  inputId = "lessserver",
                                  label = "-",
                                  color = "warning",
                                  style = "simple")),
                         column(6,verbatimTextOutput("numberofserver")),
                         column(2,
                                actionBttn(
                                  inputId = "addserver",
                                  label = "+",
                                  color = "warning",
                                  style = "simple")),
                         tags$h5("Each server cost 2$ by 10 sec")
                  ),
                  column(2,tags$h4("Total cost by 10 second are :"),
                         verbatimTextOutput("totalcost")

                  )

                ),

                fluidRow(
                  tags$h2("Supply Parameter"),

                  column(7,
                         column(6,tags$h4("Lemon Stock"),
                                column(5,verbatimTextOutput("lemonstock")),
                                column(2,
                                       actionBttn(
                                         inputId = "addlemon",
                                         label = "+",
                                         color = "warning",
                                         style = "simple")),
                                tags$h5("buy 10 lemon stock for 5$")
                         ),

                         column(6,tags$h4("Mint Stock"),
                                column(5,verbatimTextOutput("mintstock")),
                                column(2,
                                       actionBttn(
                                         inputId = "addmint",
                                         label = "+",
                                         color = "warning",
                                         style = "simple")),
                                tags$h5("buy 20 mint stock for 5$")



                         ),
                         column(6,tags$h4("Sugar Stock"),
                                column(5,verbatimTextOutput("sugarstock")),
                                column(2,
                                       actionBttn(
                                         inputId = "addsugar",
                                         label = "+",
                                         color = "warning",
                                         style = "simple")),
                                tags$h5("buy 30 sugar stock for 5$")


                         ),

                         column(6,tags$h4("Rhum Stock"),
                                column(5,verbatimTextOutput("rhumstock")),
                                column(2,
                                       actionBttn(
                                         inputId = "addrhum",
                                         label = "+",
                                         color = "warning",
                                         style = "simple")),
                                tags$h5("buy 10 rhum stock for 10$")


                         )

                  ),
                  column(3,offset = 1,tags$h4("number of mojito that we could make with this stock :"),
                         verbatimTextOutput("mojitonumber")
                  )


                ),

                fluidRow(
                  tags$h2("Price and ambiance set up"),
                  column(5,tags$h4("Price Setting"),
                         column(4,

                                tags$h6(id="big-heading","The price is set at :")
                         ),
                         column(1,

                                actionBttn(
                                  inputId = "decreaseprice",
                                  label = "-",
                                  color = "warning",
                                  style = "simple")

                         ),
                         column(2,

                                verbatimTextOutput("Price")
                         ),
                         column(1,

                                actionBttn(
                                  inputId = "increaseprice",
                                  label = "+",
                                  color = "warning",
                                  style = "simple")

                         )
                  ),
                  column(5,tags$h4("Ambiance Setting"),
                         selectInput(inputId = "ambiance",label = "ambiance", choices = c("classic","electro","house","jazz")
                         )
                  )


                ),

                fluidRow(
                  tags$h2("Money output"),
                  column(5,tags$h4("Piggy Bank"),
                         verbatimTextOutput("piggy")#,
                         # actionBttn(
                         #   inputId = "add1000",
                         #   label = "+",
                         #   color = "warning",
                         #   style = "simple"),
                         # tags$h6("add a 1000$")
                  ),
                  column(5,tags$h4("Gross Profit over time"),
                         verbatimTextOutput("profit")
                  )

                ),

                fluidRow(tags$h2("Graphics"),
                         column(5,tags$h4("where the plot happen"),
                                radioButtons("type", "Choose plot type:",
                                             list("Profit", "Number_of_mojito_sold")),
                                plotOutput("myPlot")
                         ),

                         column(5,tags$h4("dataframe of what happend"),
                                actionBttn(
                                  inputId = "refresh",
                                  label = "refresh",
                                  color = "warning",
                                  style = "pill"),

                                dataTableOutput('loc'))

                )
)
