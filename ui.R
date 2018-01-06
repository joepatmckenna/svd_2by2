library(shiny)

shinyUI(fluidPage(

  withMathJax(),
  titlePanel('Singular Value Decomposition of 2 by 2 Matrix'),
  h3('Enter a matrix of the form \\(\\begin{pmatrix}x_{11}&x_{12}\\\\x_{21}&x_{22}\\end{pmatrix}\\)'),
  
  sidebarLayout(
    sidebarPanel(
      numericInput('x11', '\\(x_{11}\\)', value=1, min=-1000, max=1000, step=1),
      numericInput('x12', '\\(x_{12}\\)', value=-2, min=-1000, max=1000, step=1),
      numericInput('x21', '\\(x_{21}\\)', value=-2, min=-1000, max=1000, step=1),
      numericInput('x22', '\\(x_{22}\\)', value=1, min=-1000, max=1000, step=1)
    ),
    
    mainPanel(
      plotOutput('plot1'),
      textOutput('sv')
    )
  )
))