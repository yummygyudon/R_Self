library(readxl)
read_excel("C:/JDG(SelfStudy)/Do it_R/excel_exam.xlsx")
df_exam <- read_excel("C:/JDG(SelfStudy)/Do it_R/excel_exam.xlsx")
mean(df_exam$english)
mean(df_exam$science)
df_exam_novar <- read_excel("excel_exam_novar.xlsx")
df_exam_novar
df_exam_novar <- read_excel("excel_exam_novar.xlsx", col_names = F)
df_exam_novar
df_exam_sheet <- read_excel("excel_exam_sheet.xlsx", sheet = 3)
df_csv_exam <- read.csv("csv_exam.csv")
write.csv(df_exam,file = "csv_exam.csv")
