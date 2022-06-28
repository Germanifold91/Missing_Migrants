#Installation and loading of required packages:
if (!require("pacman")) install.packages("pacman")
pacman::p_load(tidyverse, readr)

#Loading of Datasets:
 #MissingMigrants-Global-2019-12-31_correct.csv
MM_V1 <- read_csv(file.choose())
 #MM_14_21.csv
MM_V2 <- read_csv(file.choose())

#Upon first look of the two data frames we see that there are a difference in the number and name of columns. In order to perform an exploratory data analysis as we wish
# it is preferred to concatenate this two data sets. This will require that both DF's share a common structure and formats in their columns. Among them the date format is 
# different between the two of them. We will change the format in both scenarios so that they follow the YYYY-mm-dd format. 

#Before dealing with dates and formats lets standardize the name of the columns in both DF's so that no spaces and capital letters are present
colnames(MM_V1) <- str_to_lower(colnames(MM_V1))
colnames(MM_V1) <- str_replace_all(colnames(MM_V1), " ", "_")

colnames(MM_V2) <- str_to_lower(colnames(MM_V2))
colnames(MM_V2) <- str_replace_all(colnames(MM_V2), " ", "_")

#Date Transformations MM_V2

MM_V2 <- MM_V2 %>% mutate(`Incident Date` = str_extract(`Incident Date`, "[0-9]{2}/[0-9]{2}/[0-9]{4}"))
MM_V2$`Incident Date` <-  lubridate::mdy(MM_V2$`Incident Date`)
