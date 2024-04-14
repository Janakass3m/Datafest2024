media <- read.csv('media_views.csv')
media <- drop_na(media)
boots <- c()
for (i in 1:1000){
  samp <- sample(media$proportion_video,100,replace=TRUE)
  boots <- c(boots, mean(samp))
}


hist(boots)

confint(boots,level=0.95)
