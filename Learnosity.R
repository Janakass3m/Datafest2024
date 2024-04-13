library(dplyr)
library(tidyr)
library(ggplot2)
items <- read.csv('items.csv')

# Chap1
new_chap1 <- items %>%
  filter(chapter == 'Chapter 1 - Welcome to Statistics: A Modeling Approach' & item_type != 'code') 

chap_1 <- prop.table(table(new_chap1$item_type, new_chap1$lrn_type))
chap_1 <- as.data.frame(chap_1)

#Chap2
new_chap2 <- items %>%
  filter(chapter == 'Chapter 2 - Understanding Data' & item_type != 'code') 

chap_2 <- prop.table(table(new_chap2$item_type, new_chap2$lrn_type))
chap_2 <- as.data.frame(chap_2)

#Chap3
new_chap3 <- items %>%
  filter(chapter == 'Chapter 3 - Examining Distributions' & item_type != 'code') 

chap_3 <- prop.table(table(new_chap3$item_type, new_chap3$lrn_type))
chap_3 <- as.data.frame(chap_3)

#Chap4
new_chap4 <- items %>%
  filter(chapter == 'Chapter 4 - Explaining Variation' & item_type != 'code') 

chap_4 <- prop.table(table(new_chap4$item_type, new_chap4$lrn_type))
chap_4 <- as.data.frame(chap_4)

# Chap5
new_chap5 <- items %>%
  filter(chapter == 'Chapter 5 - A Simple Model' & item_type != 'code') 

chap_5 <- prop.table(table(new_chap5$item_type, new_chap5$lrn_type))
chap_5 <- as.data.frame(chap_5)

#Chap6
new_chap6 <- items %>%
  filter(chapter == 'Chapter 6 - Quantifying Error' & item_type != 'code') 

chap_6 <- prop.table(table(new_chap6$item_type, new_chap6$lrn_type))
chap_6 <- as.data.frame(chap_6)

#Chap7
new_chap7 <- items %>%
  filter(chapter == 'Chapter 7 - Adding an Explanatory Variable to the Model' & item_type != 'code') 

chap_7 <- prop.table(table(new_chap7$item_type, new_chap7$lrn_type))
chap_7 <- as.data.frame(chap_7)

#Chap8
new_chap8 <- items %>%
  filter(chapter == 'Chapter 8 - Digging Deeper into Group Models' & item_type != 'code') 

chap_8 <- prop.table(table(new_chap8$item_type, new_chap8$lrn_type))
chap_8 <- as.data.frame(chap_8)

#Chap9
new_chap9 <- items %>%
  filter(chapter == 'Chapter 9 - Models with a Quantitative Explanatory Variable' & item_type != 'code') 

chap_9 <- prop.table(table(new_chap9$item_type, new_chap9$lrn_type))
chap_9 <- as.data.frame(chap_9)

#Chap10
new_chap10 <- items %>%
  filter(chapter == 'Chapter 10 - The Logic of Inference' & item_type != 'code') 

chap_10 <- prop.table(table(new_chap10$item_type, new_chap10$lrn_type))
chap_10 <- as.data.frame(chap_10)

#Chap11
new_chap11 <- items %>%
  filter(chapter == 'Chapter 11 - Model Comparison with F' & item_type != 'code') 

chap_11 <- prop.table(table(new_chap11$item_type, new_chap11$lrn_type))
chap_11 <- as.data.frame(chap_11)

#Chap12
new_chap12 <- items %>%
  filter(chapter == 'Chapter 12 - Parameter Estimation and Confidence Intervals' & item_type != 'code') 

chap_12 <- prop.table(table(new_chap12$item_type, new_chap12$lrn_type))
chap_12 <- as.data.frame(chap_12)


  

