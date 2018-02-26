library(dplyr)
tryCatch({
  setwd("./result/")
  data <- read.table("./X_Mean_Std.txt")
  NewTidyData <- data %>% group_by(V81, V80)%>% summarise_all(mean)
  write.table(NewTidyData, file= "./X_all_means.txt",
            sep = " ",
            row.names = FALSE,
            col.names = FALSE,
            quote = FALSE)
},finally={
  setwd("..")  
}
)
