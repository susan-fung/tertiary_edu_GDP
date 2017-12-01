# Prove that I can load the dataset into R
# Usage in terminal: Rscript read_write_csv.R
edu<-read.csv("../data/tertiary.csv", strip.white=TRUE)
write.table(head(edu),"tertiary_head.csv",sep = ",",row.names = FALSE, col.names = TRUE)

