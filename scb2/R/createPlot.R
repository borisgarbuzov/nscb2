createPlot <- function(arrayPlot,
                       name,
                       nameMain,
                       type = 'p',
                       sub = '',
                       xlab = 'n',
                       ylab = ''){
     #creare folder
  path <- paste0("../output/",name)
  Namefile = paste0(name)

   #name image
  saveJpg(fileName = Namefile, path = path)


  #build grafic
  switch (
    type,
    'm' = plot(arrayPlot,
               xlab = xlab,
               ylab = ylab),
    'p' =  plot(1:length(arrayPlot),
                arrayPlot,
                xlab = xlab,
                ylab = ylab),
    'h' = hist(arrayPlot,
               xlab = xlab,
               ylab = ylab),
    stop()
  )
  title(main = nameMain,
    sub = sub)

  graphics.off()


}
