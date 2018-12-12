library(shinyalert)
library(shinyjs)
library(shinyWidgets)
ui <- fluidPage( includeCSS("www/bootstrap.css"), 
                 navbarPage(h1("THE MOJITO GAME",
                               style = "font-family: 'Neucha', cursive;
                               font-weight: 500; line-height: 1.1; font-size : 60px;
                               color: #28a745;"),
                            
                            tabPanel(
                              h1("Rules of the game", 
                                 style = "font-family: 'Neucha', cursive;
                                 font-weight: 500; line-height: 1.1; 
                                 color: #28a745;"),
                              tags$body("Welcome to our game ! 
                                        Here you will be the manager of a Mojito Stand.

                                        note that you can only go to negative 200$ meaning you cannot loan more money
                                        i also changed marketing to 100$ dollar instead on 250$ 
                                        also each 10 seconds you lose stock ammount*0.1$ and 1$ per server
                                        ")),
                            
                            tabPanel(h1("The Game", 
                                        style = "font-family: 'Neucha', cursive;
                                        font-weight: 500; line-height: 1.1; 
                                        color: #28a745;"), 
                                     
                                     useShinyalert(),
                                     useShinyjs(),
                                     column(10, offset=4, titlePanel("Welcome to the Mojito Game!"),style="padding-bottom: 20px;padding-top: 20px;"),
                                     tags$style(HTML(".tabbable > .nav > li > a {margin-top:300px;}")),
                                     
                                     div(id="startbutton",
                                         
                                         actionBttn(
                                       inputId = "start",
                                       label = "start",
                                       color = "primary",
                                       size = "lg",
                                       style = "unite"),
                                       
                                       style="padding-left: 550px;padding-top: 20px;"
                                       ),
                                     
                                     
                                     hidden( div(  id="game",
                                                   
                                     fluidRow(style="border: 4px double black;",
                                              
                                              column(12,h3(textOutput("Elapsedtime"),style = "padding-bottom: 10px;padding-top: 10px;")),  
                                              column(2,tags$h3("Number of sold Mojitos :",style = "padding-bottom: 10px")),
                                              column(1,h3(textOutput("saled_mojito")))
                                              
                                              
                                     ),
                                     
                                     fluidRow(style="border: 4px double black;",
                                              tags$h2("Cost Parameter",style = "padding-top: 10px;padding-left: 10px;"),
                                              column(12,
                                                     tags$h4("Marketing Level (max 10)"),
                                                     column(2,verbatimTextOutput("marketinglevel")),
                                                     column(1, 
                                                            actionButton(
                                                              inputId = "addmarketing",
                                                              label = icon("plus"),
                                                              class = "btn btn-success" 
                                                            )),
                                                     column(12),
                                                     column(2, tags$h5("Upgrade Marketing for 100$",style = "padding-bottom: 10px"))
                                                     
                                              ),
                                              
                                              column(5,
                                                     tags$h4("Number of Waiters:"),
                                                     column(1,
                                                            actionButton(
                                                              inputId = "lessserver",
                                                              label = icon("minus"),
                                                              class = "btn btn-danger" )),
                                                     column(4,verbatimTextOutput("numberofserver")),
                                                     column(2,
                                                            actionButton(
                                                              inputId = "addserver",
                                                              label = icon("plus"),
                                                              class = "btn btn-success"
                                                            )),
                                                     column(12),
                                                     column(6,tags$h5("Each waiter costs 1$ per 10 seconds",style = "padding-bottom: 10px;")) 
                                              ),
                                              column(2,tags$h4("Total costs per 10 seconds are:"),
                                                     verbatimTextOutput("totalcost")
                                                     ,style="padding-bottom: 10px;"
                                              )
                                              
                                     ),
                                     
                                     fluidRow(style="border: 4px double black;",
                                              tags$h2("Supply Parameter",style = "padding-top: 10px;padding-left: 10px;"),
                                              
                                              column(12,
                                                     column(6,tags$h4("Lemon Stock"),
                                                            column(5,verbatimTextOutput("lemonstock")),
                                                            column(2,
                                                                   actionButton(
                                                                     inputId = "addlemon",
                                                                     label = icon("plus"),
                                                                     class = "btn btn-success")),
                                                            tags$h5("Buy 10 units of lemon for 5$",style="padding-top: 7px;")
                                                     ),
                                                     
                                                     column(6,tags$h4("Mint Stock"),
                                                            column(5,verbatimTextOutput("mintstock")),
                                                            column(2,
                                                                   actionButton(
                                                                     inputId = "addmint",
                                                                     label = icon("plus"),
                                                                     class = "btn btn-success")),
                                                            tags$h5("Buy 20 units of mint for 5$",style="padding-top: 7px;")
                                                            
                                                            
                                                            
                                                     ),
                                                     column(6,tags$h4("Sugar Stock"),
                                                            column(5,verbatimTextOutput("sugarstock")),
                                                            column(2,
                                                                   actionButton(
                                                                     inputId = "addsugar",
                                                                     label = icon("plus"),
                                                                     class = "btn btn-success")),
                                                            tags$h5("Buy 30 units of sugar for 5$",style="padding-top: 7px;")
                                                            
                                                            
                                                     ),
                                                     
                                                     column(6,tags$h4("Rhum Stock"),
                                                            column(5,verbatimTextOutput("rhumstock")),
                                                            column(2,
                                                                   actionButton(
                                                                     inputId = "addrhum",
                                                                     label = icon("plus"),
                                                                     class = "btn btn-success")),
                                                            tags$h5("Buy 10 units of rhum for 10$",style="padding-top: 7px;")
                                                            
                                                     )
                                              ),
                                              
                                              column(4,
                                                     tags$h4("Number of Mojitos that we could make with this stock:",style = "padding-top: 10px;"),
                                                     verbatimTextOutput("mojitonumber"),style = "padding-bottom: 10px;"
                                              )),
                                     
                                     fluidRow(style="border: 4px double black;",
                                              
                                              tags$h2("Price and Ambiance Setting",style = "padding-top: 10px;padding-left: 10px;"),
                                              column(12,
                                                     tags$h4("Price Setting"),
                                                     column(5, 
                                                            column(1,
                                                                   actionButton(
                                                                     inputId = "decreaseprice",
                                                                     label = icon("minus"),
                                                                     class = "btn btn-danger")
                                                                   
                                                            ),
                                                            column(2,
                                                                   
                                                                   verbatimTextOutput("Price")
                                                            ),
                                                            column(1,
                                                                   
                                                                   actionButton(
                                                                     inputId = "increaseprice",
                                                                     label = icon("plus"),
                                                                     class = "btn btn-success")
                                                                   
                                                            ))
                                              ),
                                              column(6,
                                                     tags$h4("Ambiance Setting"),
                                                     selectInput(inputId = "ambiance", width = '50%', label = "ambiance", choices = c("Classic","Electro","House","Jazz")
                                                     )
                                                     ,style = "padding-bottom: 10px;")
                                              
                                              
                                     ),
                                     
                                     fluidRow(style="border: 4px double black;",
                                              column(12,tags$h2("Money Output",style = "padding-top: 10px;"),
                                                     column(4,
                                                            tags$h4("Piggy Bank"),
                                                            verbatimTextOutput("piggy")
                                                            
                                                            
                                                     ), 
                                                     column(12),
                                                     column(4,tags$h4("Gross Profit over time"),
                                                            verbatimTextOutput("profit")
                                                            ,style = "padding-bottom: 10px;")
                                                     
                                              )),
                                     
                                     fluidRow(style="border: 4px double black;",
                                              column(12,  tags$h2("Graphics",style = "padding-top: 10px;padding-bottom: 10px;"), 
                                                     column(5,
                                                            
                                                            radioButtons("type", "Choose a plot type:",
                                                                         choiceValues =  list("Profit", "Number_of_mojito_sold"),
                                                                         choiceNames = list("Profit", "Number of Mojitos sold")),
                                                            div(style="padding-bottom: 10px;"),
                                                            plotOutput("myPlot")
                                                     ),
                                                     
                                                     column(5,tags$h4("Dataframe of what has happened:",style="padding-bottom: 10px;"),
                                                            actionBttn(
                                                              inputId = "refresh",
                                                              label = "refresh",
                                                              color = "primary",
                                                              style = "pill"),
                                                            div(style="padding-bottom: 20px;"),
                                                            dataTableOutput('loc'))
                                                     
                                              )))
                            )
                 
                 
                              )))