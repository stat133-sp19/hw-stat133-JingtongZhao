# Example discussed in lecture April-08-2019

library(shiny)
library(ggplot2)

# Define UI for application that draws a histogram
ui <- fluidPage(
  
  # Application title
  titlePanel("Saving Simulations"),
  
  # Sidebar with a slider input for number of bins 
  fluidRow(
    column(4,
      sliderInput("initial",
                  "Initial amount",
                  min = 0,
                  max = 10000,
                  step = 500,
                  value = 1000),
      sliderInput("annual",
                  "Annual Contribution",
                  min = 0,
                  max = 50000,
                  step = 500,
                  value = 2000)
      ),
      column(4,
             sliderInput("return",
                  "Return Rate (in %)",
                  min = 0,
                  max = 20,
                  step = 0.1,
                  value = 5),
      sliderInput("growth",
                  "Growth Rate (%)",
                  min = 0,
                  max = 20,
                  step = 0.1,
                  value = 2)
      ),
    column(4,
      sliderInput("years",
                  "Years",
                  min = 0,
                  max = 50,
                  step = 1,
                  value = 20),
      selectInput("facet", "Facet", c("yes"=TRUE,"no"=FALSE),selected = FALSE)
      )
    ),
      
      
      
        h4('Timelines'),
        plotOutput("returns"),
        

        h4('Balances'),
        verbatimTextOutput("table")
        )
      
    
  

# Define server logic required to draw a histogram
server <- function(input, output) {
  
  dat = reactive({
  FV = rep(0,input$years)
  FVA = rep(0,input$years)
  FVGA = rep(0,input$years)
  year = 0:input$years
  
 for (i in 0:length(year)){
   
    FV[i] = input$initial * (1 + input$return*0.01) ^ year[i]
    FVA[i] = input$annual * ((1 + input$return*0.01) ^ year[i] - 1)/ (input$return*0.01)
    FVGA[i] = input$annual * ((1 + input$return*0.01) ^ year[i] - (1 + input$growth*0.01) ^ year[i])/ (input$return*0.01 - input$growth*0.01)
 }

  dat <- data.frame(
    year = 0:input$years,
    no_contrib = FV,
    fixed_contrib = FV + FVA,
    growing_contrib = FV + FVGA
  )
  return(dat)
 })
  output$returns <- renderPlot({
    if (input$facet==FALSE){
  ggplot(data = dat(), aes(x=year)) + 
    geom_line(aes(y=no_contrib,color='no_contrib')) + 
    geom_point(aes(y=no_contrib,color='no_contrib')) + 
    geom_line(aes(y=fixed_contrib,color='fixed_contrib')) + 
    geom_point(aes(y=fixed_contrib,color='fixed_contrib')) + 
    geom_line(aes(y=growing_contrib,color='growing_contrib')) + 
    geom_point(aes(y=growing_contrib,color='growing_contrib')) + 
    labs(title = 'Three modes of investing', x = 'Years', y = 'Future Value ($)') + 
    scale_colour_manual("modality",breaks = c('no_contrib','fixed_contrib','growing_contrib'),values = c('no_contrib'='red','fixed_contrib'='green','growing_contrib'='blue'))
    }
    else {
    modes = rep(c('no_contrib','fixed_contrib','grow_contrib'), each= input$years+1)
    year = rep(0:input$years,3)
    value = c(dat()$no_contrib,dat()$fixed_contrib,dat()$growing_contrib)
    dat2 = data.frame(modes = factor(modes,levels = c('no_contrib','fixed_contrib','grow_contrib')),
                      year = year,
                      value = value)
    #mycols = rep(c("#FF0000","yellow","green"),each =21)
    ggplot(data = dat2, aes(x = year, y = value, colour = modes)) + 
      geom_point() +
      geom_line(aes(colour = modes)) +
      labs(title = 'Three modes of investing', x = 'year', y = 'value') +
      facet_wrap(~ modes) +
      geom_area(aes(fill = modes), alpha = 0.5) +
      scale_colour_brewer(palette = "Set1",
                          name = "variable") +
      scale_fill_brewer(palette = "Set1",
                          name = "variable") + theme_bw()
    
 
      
 }
       })
  
  output$table <- renderPrint({
    dat()
  })
}

# Run the application 
shinyApp(ui = ui, server = server)
