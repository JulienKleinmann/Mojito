

library(shinyWidgets)
library(shinyalert)
library(shinyjs)

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
                              
                              tags$body(h2("Welcome to our game !",
                                           style = "font-family: 'Neucha', cursive;
                                           font-weight: 500; padding-top: 20px;
                                           padding-bottom: 20px;
                                           line-height: 1.1; font-size : 40px;
                                           margin-top:30px; text-align: center"),
                                        h3 (em("What is Mojito bro?"),
                                            style = "font-family: 'Neucha', cursive;
                                            line-height: 1.1; font-size : 30px; 
                                            padding-bottom: 20px"),
                                        p("Here you will be the MANAGER of a Mojito Stand",
                                          style = "line-height: 1.1; font-size : 18px"),
                                        br(),
                                        h3 (em("What do you need to do?"),
                                            style = "font-family: 'Neucha', cursive;
                                            line-height: 1.1; font-size : 30px; 
                                            padding-bottom: 20px;"),
                                        p("Cost Parameter",
                                          style = "line-height: 1.1; font-size : 18px;
                                          color:  #17a2b8"),
                                        tags$ol (tags$li("You will choose a marketing level",
                                                         tags$img(src = "https://png.pngtree.com/element_our/md/20180304/md_5a9bfb1dc16b8.png",
                                                                  width = "30px", height = "30px"), 
                                                         tags$img(src = "https://i0.wp.com/www.waldo.be/wp-content/uploads/2014/04/warning-sign1.jpg",
                                                                  width = "20px", height = "20px"),
                                                         "Be careful once you increase it you cannot decrease it
                                                         Any increase will lead to a cost of 100 $"),
                                                 tags$li("You have to choose the number", 
                                                         "of servers",
                                                         tags$img(src = "https://png.pngtree.com/element_our/md/20180304/md_5a9bfb1dc16b8.png",
                                                                  width = "30px", height = "30px"),
                                                         "each server costs 1$ by 10 seconds"),
                                                 tags$li("Don???t worry you will have a box indicating how much are your costs!!"),
                                                 style = "line-height: 2; font-size : 18px;
                                                 margin-left: 5%"
                                        ),
                                        p("Supply Parameter",
                                          style = "line-height: 1.1; font-size : 18px;
                                          color:  #17a2b8"),
                                        p("To produce Mojitos you need raw materials.",
                                          "For that you had to negotiate with many suppliers",
                                          "and you could finally get these agreements",
                                          "for each ingredient:",
                                          style = "line-height: 2; 
                                          font-size : 18px; margin-left: 4%"),
                                        tags$ol(
                                          tags$li("Lemon",
                                                  tags$img(src = "https://www.dictionary.com/e/wp-content/uploads/2018/09/lemon.png",
                                                           width = "20px", height = "20px"),
                                                  ": Your supplier can give",
                                                  " you at least a 10 lemon stock for 5$"),
                                          tags$li("Sugar",
                                                  tags$img(src = "http://eboxmart.com/media/catalog/product/cache/1/image/9df78eab33525d08d6e5fb8d27136e95/s/u/sugar_s_1_kg_1100_1.jpg",
                                                           width = "20px", height = "20px"),
                                                  ": Your supplier can  sell to ",
                                                  "you at least a 30 sugar stock for 5$"),
                                          tags$li("Mint",
                                                  tags$img(src = "http://icons.iconarchive.com/icons/robinweatherall/chocolate/256/mint-leaf-icon.png",
                                                           width = "20px", height = "20px"),
                                                  ": you can buy at least",
                                                  "a 20 mint stock for 5$"),
                                          tags$li("Rhum ",
                                                  tags$img(src = "https://privatewhiskysociety.com/wp-content/uploads/2018/01/Rhum-Cadenhead-Boutique.jpg",
                                                           width = "25px", height = "25px"),
                                                  ": you can buy at least",
                                                  "a 10 Rhum stock for 5$"),
                                          style = "line-height: 2; 
                                          font-size : 18px; margin-left: 5%"
                                        ),
                                        p("Again you will have a box indicating",
                                          " how many mojitos you can produce with",
                                          " your available stocks",
                                          tags$img(src = "https://i.pinimg.com/originals/ea/d9/86/ead9860697d01fc09c7c7d8c3dc61dee.jpg",
                                                   width = "20px", height = "20px"),
                                          br(),
                                          tags$img(src = "https://i0.wp.com/www.waldo.be/wp-content/uploads/2014/04/warning-sign1.jpg",
                                                   width = "20px", height = "20px"),
                                          "Be careful you will have to pay some",
                                          " costs for your stocks: For each ingredient",
                                          " you have in stock you will pay 0.1$",
                                          br(),
                                          "To produce a Mojito you need:",
                                          tags$ol(tags$ul( "2 Lemon"),
                                                  tags$ul("2 Mint"),
                                                  tags$ul("3 Sugar"),
                                                  tags$ul("1 Rhume"),
                                                  style = "line-height: 2; 
                                                  font-size : 18px; 
                                                  margin-left: 5%"),
                                          style = "line-height: 2; 
                                          font-size : 18px; margin-left: 5%"),
                                        p("Price and ambiance set up",
                                          style = "line-height: 1.1; font-size : 18px;
                                          color:  #17a2b8"),
                                        tags$ol(
                                          tags$li("You have to fix your selling price:",
                                                  "Remember your pricing strategy classes",
                                                  tags$img(src = "https://i1.wp.com/www.papertraildesign.com/wp-content/uploads/2017/06/emoji-nerd-glasses.png",
                                                           width = "20px", height = "20px"),
                                                  style = "line-height: 2; font-size : 18px"),
                                          tags$li("Select your ambiance:",
                                                  "Your challenge is to find which ambiance your client prefer"),
                                          style = "line-height: 2; 
                                          font-size : 18px; margin-left: 5%"
                                        ),
                                        h3 (em("When do you win?"),
                                            style = "font-family: 'Neucha', cursive;
                                            line-height: 1.1; font-size : 30px; 
                                            padding-bottom: 20px"),
                                        p("When you achieve a profit of 1000$",
                                          tags$img(src = "https://dejpknyizje2n.cloudfront.net/svgcustom/clipart/preview/6a24a9edae1246739dd6b8c06293bc18.png",
                                                   width = "30px", height = "30px"),
                                          style = "line-height: 2; font-size : 18px;
                                          margin-left: 5%"),
                                        p("Gross profit is not your piggy bank",
                                          tags$img(src = "https://i0.wp.com/www.waldo.be/wp-content/uploads/2014/04/warning-sign1.jpg",
                                                   width = "30px", height = "30px"),
                                          style = "line-height: 2; font-size : 18px;
                                          margin-left: 5%"),
                                        p("Remember your accounting classes",
                                          tags$img(src = "https://i1.wp.com/www.papertraildesign.com/wp-content/uploads/2017/06/emoji-nerd-glasses.png",
                                                   width = "25px", height = "25px"),
                                          style = "line-height: 2; font-size : 18px;
                                          margin-left: 5%"),
                                        h3 (em("When do you lose?"),
                                            style = "font-family: 'Neucha', cursive;
                                            line-height: 1.1; font-size : 30px; 
                                            padding-bottom: 20px"),
                                        p("Your piggy bank can go to negative 200$",
                                          tags$img(src = "https://www.ahundredmonkeys.com/wp-content/uploads/2015/03/EMOmoney-300x260.jpeg",
                                                   width = "30px", height = "30px"),
                                          br(),
                                          tags$img(src = "https://png.pngtree.com/element_our/md/20180304/md_5a9bfb1dc16b8.png",
                                                   width = "30px", height = "30px"),
                                          "if you have a negative sold of 200",
                                          " and you couldn't make money any more",
                                          " you will have to announce bankruptcy",
                                          style = "line-height: 2; font-size : 18px;
                                          margin-left: 5%",
                                          br(),
                                          "Or you have less than 5$ in your bank ",
                                          "and you cannot make any more mojitos",
                                          " (no available stock)"
                                        ),
                                        h2("Good Luck !",
                                           br(),
                                           style = "font-family: 'Neucha', cursive;
                                           font-weight: 500; padding-top: 20px;
                                           padding-bottom: 20px;
                                           line-height: 1.1; font-size : 40px;
                                           margin-top:30px; text-align: center")
                                        )),
                            
                            tabPanel(h1("The Game", 
                                        style = "font-family: 'Neucha', cursive;
                                        font-weight: 500; line-height: 1.1; 
                                        color: #28a745;"), 
                                     
                                     useShinyalert(),
                                     useShinyjs(),
                                     column(10, offset=4, titlePanel("Welcome to the Mojito Game!"),style="padding-bottom: 20px;padding-top: 20px;"),
                                     tags$style(HTML(".tabbable > .nav > li > a {margin-top:300px;}")),
                                     
                                     div(id="startbutton",
                                         
                                         actionButton(
                                           inputId = "start",
                                           label = "START",
                                           style = 'padding:50px; font-size:250%',
                                           class = "btn btn-success" 
                                         ),
                                         
                                         
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
                                                                          actionButton(
                                                                            inputId = "refresh",
                                                                            label = icon("refresh"),
                                                                            style = 'padding:20px; font-size:100%',
                                                                            class = "btn btn-success" 
                                                                          ),
                                                                          div(style="padding-bottom: 20px;"),
                                                                          dataTableOutput('loc'))
                                                                   
                                                            )))
                                     )
                                     
                                     
                            )))