
#data inladen

#df inladen
df_ruw <- read.csv("C:\\Users\\Matth\\OneDrive\\Documenten\\Traineeship\\JenVdatalab\\DGM sprint 4\\data\\eurostat_gdelt_gekoppeld_NL.csv")

df_1 <- df_ruw %>%
  select(citizen, attribute)

df_2 <- df_ruw %>%
  select(-c(X, citizen, attribute))


#loop om data anders te presenteren
df_2_n <- NULL

for(i in 1:148){
  col_row_name <- colnames(df_2)[i]
  col_row_name <-  as.numeric(gsub("M", "", gsub("X", "", col_row_name)))
  col <- df_2[,i]
  tussen<-merge(col_row_name, col)
  # 
  df_2_n <- rbind(df_2_n, tussen)
  
}

df_n <- cbind(df_1, df_2_n)
colnames(df_n) <- c("citizen","attribute","yearmonth","number")

rm(df_1, df_2, df_2_n, tussen)

df <- df_n %>%
  filter(citizen %in% c("Albania", "Uganda", "Syria", "Tunisia", "Afghanistan")) %>%
  mutate(attribute = trimws(attribute)) %>%
  filter(attribute %in% c("migrants",
                         "Use conventional military force, not specified below",
                         "Host a visit",
                         "Accuse of crime, corruption",
                         "Abduct, hijack, or take hostage")) %>%
filter(yearmonth >= 201701)

eventlist <- df %>%
             select(attribute) %>%
             filter(attribute != "migrants") %>%
             distinct()
