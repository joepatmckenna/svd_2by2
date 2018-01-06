library(shiny)

shinyServer(function(input, output) {
  
  x_svd <- reactive({
    x <- rbind(c(input$x11, input$x12), c(input$x21, input$x22))
    s <- svd(x)
  })
  
  output$plot1 <- renderPlot({
    s <- x_svd()
    
    par(mfrow=c(1,2), pty='s')
    
    lim <- max(abs(s$u))
    plot(c(0, s$u[1,1]), c(0, s$u[2,1]),
         xlim=c(-lim,lim), ylim=c(-lim,lim),
         xlab='u1', ylab='u2', main='left singular vectors',
         type='l')
    lines(c(0, s$u[1,2]), c(0, s$u[2,2]))
    
    lim <- max(abs(s$v))
    plot(c(0, s$v[1,1]), c(0, s$v[2,1]),
         xlim=c(-lim,lim), ylim=c(-lim,lim),
         xlab='v1', ylab='v2', main='right singular vectors',
         type='l')
    lines(c(0, s$v[1,2]), c(0, s$v[2,2]))
    
  })
  
  output$sv <- renderText({
    s <- x_svd()
    c('singular values:', round(s$d[1], 2), ',', round(s$d[1], 2))
  })
  
})