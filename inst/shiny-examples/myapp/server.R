server <- function(input, output, session) {



  # Define server logic to show elapsed time, update every second ----

  initialtime <- Sys.time()


  output$Elapsedtime <- renderText({
    invalidateLater(1000, session)
    paste("The elapsed time", round(difftime(Sys.time(),initialtime,units = "secs")),"seconds")
  })

  ## set ractive value

  rv <- reactiveValues(lines = data.frame(), n = 0, marketing_level = 1, piggy_bank = 1000, Price = 1, saled_mojito = 0, numberofserver=1,totalcost = 0,lemonstock = 10, mintstock = 30, sugarstock=20, rhumstock=10, mojitonumber = 0, ambiance = 1,x=data.frame())



  ## do something when add marketing is clicked
  observeEvent(input$addmarketing, {
    if(rv$marketing_level < 10 ){
      if(rv$piggy_bank >= 250){
        rv$marketing_level <- rv$marketing_level + 1     # if the add button is clicked, increment the value by 1 and update it
        rv$piggy_bank <- rv$piggy_bank - 250
      } else {rv$marketing_level <- rv$marketing_level}}else {rv$marketing_level <- rv$marketing_level}
  })


  ## do someething when add a 1000$ is push

  observeEvent(input$add1000, rv$piggy_bank <- rv$piggy_bank + 1000)


  ##add lemon when click on button

  observeEvent(input$addlemon,
               {

                 if(rv$piggy_bank>=5){
                   rv$piggy_bank <- rv$piggy_bank - 5
                   rv$lemonstock <- rv$lemonstock + 10}
               })

  ##add mint when click on button

  observeEvent(input$addmint,
               {

                 if(rv$piggy_bank>=5){
                   rv$piggy_bank <- rv$piggy_bank - 5
                   rv$mintstock <- rv$mintstock + 20}
               })
  ##add mint when click on button

  observeEvent(input$addsugar,
               {

                 if(rv$piggy_bank>=5){
                   rv$piggy_bank <- rv$piggy_bank - 5
                   rv$sugarstock <- rv$sugarstock + 30}
               })

  ##add mint when click on button

  observeEvent(input$addrhum,
               {

                 if(rv$piggy_bank>=10){
                   rv$piggy_bank <- rv$piggy_bank - 10
                   rv$rhumstock <- rv$rhumstock + 10}
               })

  # increase or deacrease price button handled..

  observeEvent(input$increaseprice, if (rv$Price<20)rv$Price <- rv$Price + 1)
  observeEvent(input$decreaseprice, if(rv$Price > 1){rv$Price <-rv$Price - 1})

  # increase or deacrease server button handled..

  observeEvent(input$addserver, rv$numberofserver <- rv$numberofserver + 1)
  observeEvent(input$lessserver, if(rv$numberofserver > 1){rv$numberofserver <-rv$numberofserver - 1})

  ## plot dataframe when refresh (at time of refresh)

  observeEvent(input$refresh, rv$x <- rv$lines)

  # specify the output

  output$marketinglevel <- renderText(paste("your level is :", rv$marketing_level))
  output$piggy <- renderText(paste("your balance is :", rv$piggy_bank,"$"))
  output$mojitosupplylevel <- renderText(rv$mojito_stock_level)
  output$Price <- renderText(paste(rv$Price,"$"))
  output$profit <- renderText({paste("Your gross profit is", rv$lines[rv$n,12] ,"in dollar")})
  output$saled_mojito <- renderText(rv$saled_mojito)
  output$numberofserver <- renderText(paste("you have :", rv$numberofserver,"server"))
  output$totalcost <- renderText(paste( rv$totalcost,"$"))
  output$lemonstock <- renderText(paste( rv$lemonstock,"lemon"))
  output$mintstock <- renderText(paste( rv$mintstock,"mint"))
  output$sugarstock <- renderText(paste( rv$sugarstock,"sugar"))
  output$rhumstock <- renderText(paste( rv$rhumstock,"rhum"))
  output$mojitonumber <- renderText(paste( rv$mojitonumber,"mojito"))




  ## define how much customer arrives each lambda second

  customer <- function(x) {
    if ( 0 < x && x <= ((2^1/1) * exp(-2)) ){ nb <- 0 }
    if ( ((2^1/1) * exp(-2)) < x  && x <= ((2^2/2) * exp(-2)) ){ nb <- 1 }
    if ( ((2^2/2) * exp(-2)) < x  && x <= ((2^3/3) * exp(-2)) ){ nb <- 2 }
    if ( ((2^3/3) * exp(-2)) < x  && x <= ((2^4/4) * exp(-2)) ){ nb <- 3 }
    if ( ((2^4/4) * exp(-2)) < x  && x <= ((2^5/5) * exp(-2)) ){ nb <- 4 }
    if ( ((2^5/5) * exp(-2)) < x  && x <= ((2^6/6) * exp(-2)) ){ nb <- 5 }
    if ( ((2^6/6) * exp(-2)) < x  && x <= ((2^7/7) * exp(-2)) ){ nb <- 6 }
    nb
  }


  observe({

    ## display the number of mojito we are able to do with this stock..

    rv$mojitonumber <- min(rv$rhumstock%/%1,rv$mintstock%/%2,rv$lemonstock%/%2,rv$sugarstock%/%3)

    ## set ambiance as a multiplier for further fct : classic = 1, electro = 2, jazz = 3, house =4

    rv$ambiance <- if(input$ambiance=="classic"){
      rv$ambiance=1}else{if(input$ambiance=="electro"){
        rv$ambiance=2}else{if(input$ambiance=="jazz"){rv$ambiance=3}else{if(input$ambiance=="house"){rv$ambiance=4}
        }
        }
      }
  })




  ## create dataframe for sale..
  observe({

    ## set lambda
    isolate({ lambda <- (10000*rv$Price)/(rv$marketing_level*rv$ambiance)})

    invalidateLater(lambda, session)

    isolate({


      rv$n <- rv$n + 1
      rv$lines[rv$n, 1] <- rv$n                                                              ## counter n
      rv$lines[rv$n, 2] <- customer( runif(1, min = 0, max = 1) )                            ## how much customer  "enter"
      rv$lines[rv$n, 3] <- if ( rv$numberofserver>rv$lines[rv$n, 2]) {rv$lines[rv$n, 2]} else {rv$numberofserver} ##number of customer serve depending on server capacity
      rv$lines[rv$n, 4] <- if (rv$Price<=6){rv$lines[rv$n, 3]}else{if(6<rv$Price & rv$Price<8){round(rv$lines[rv$n, 3]*0.8)}else{if(8<=rv$Price & rv$Price<10){round(rv$lines[rv$n, 3]*0.6)}else{if(10<=rv$Price & rv$Price<15){round(rv$lines[rv$n, 3]*0.3)}else{if(15<=rv$Price ){round(rv$lines[rv$n, 3]*0.1)}}}}} ## number of customer served in regard to the price
      rv$lines[rv$n, 5] <- min(rv$lines[rv$n, 4],rv$mojitonumber)
      rv$lines[rv$n, 6] <- rv$Price * rv$lines[rv$n, 5]                         ## save a value of how much we earn from this sales
      rv$piggy_bank <- rv$piggy_bank + rv$Price * rv$lines[rv$n, 5]          ## impact that in piggy bank
      ## handle stock
      rv$lemonstock <- rv$lemonstock - 2*rv$lines[rv$n, 5]
      rv$lines[rv$n, 7] <- rv$lemonstock ##lemon stock after sale
      rv$mintstock <- rv$mintstock - 2*rv$lines[rv$n, 5]
      rv$lines[rv$n, 8] <- rv$mintstock ##mint stock after sale
      rv$sugarstock <- rv$sugarstock - 3*rv$lines[rv$n, 5]
      rv$lines[rv$n, 9] <- rv$sugarstock ##sugar stock after sale
      rv$rhumstock <- rv$rhumstock - 1*rv$lines[rv$n, 5]
      rv$lines[rv$n, 10] <- rv$rhumstock ##rhum stock after sale
      rv$lines[rv$n, 11] <- round(difftime(Sys.time(),initialtime,units = "secs"))                ## store the elapsed time when customer arrive
      rv$lines[rv$n, 12] <- sum( rv$lines[, 6])                                             ## store profit over time
      rv$lines[rv$n, 13] <- sum( rv$lines[, 5]) ## cumulative sale of mojito
      rv$saled_mojito <- rv$lines[rv$n, 13]
      ##set name for dataframe column

      colnames(rv$lines) <- c("counter", "nbr of cust entering","cust serve in regard to server","served in regard of Price","real sale depending on stock","gain of sale nbr#","lemon stock","mint stock","sugar stock","rhum stock","time in sec","cumulative profit","sold mojito")
    })

  })


  ## cost of runing your business for now just 2$ by server each 5 sec (maybe add cost for storage..)
  observe({

    ## input cost for each server

    invalidateLater(10000)
    isolate({rv$piggy_bank <- rv$piggy_bank - 2*rv$numberofserver
    rv$totalcost <- 2*rv$numberofserver})

  })

  ## see the data frame
  output$loc <- renderDataTable({

    rv$x

  })

  ##graph output
  output$myPlot <- renderPlot({
    switch(input$type,
           Profit = ggplot() + geom_line(aes(x = rv$lines[,11], y = rv$lines[,12])) ,
           Number_of_mojito_sold = ggplot() + geom_line(aes(x = rv$lines[,11], y = rv$lines[,13]))  )

  })

  ## end of game :
  observe({
    if(rv$lines[rv$n,12]>1000){
      # Show a modal when the button is pressed
      shinyalert("Yeah !!!", "You won the game making more than an 1000$ profit.
                 Click ok to close the game",
                 type = "success",
                 callbackR = function(x) { stopApp(returnValue = invisible()) })
    }

    if(rv$piggy_bank<5 & rv$mojitonumber<1){
      # Show a modal when the button is pressed
      shinyalert("Nope !!!", "You lost the game you have no more money nor mojito to sale.
                 Click ok to close the game",
                 type = "error",
                 callbackR = function(x) { stopApp(returnValue = invisible()) })
    }
  })

}
