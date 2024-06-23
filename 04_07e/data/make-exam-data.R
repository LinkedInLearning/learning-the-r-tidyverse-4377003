
library("tidyverse")

make_exam_data <- function(subjects = c("music", "maths", "science", "literature"),
                           years = 1:4,
                           students = paste0("student_", 1:10),
                           seed = set.seed(87)){
  
  student_id <- rep(students, each = length(years), times = length(subjects)) 
  
  subject <- rep(subjects, each = length(students), times = length(years))
  
  year_group <- rep(rep(years, each = length(year), times = length(students)), length(subjects))
  
  tibble(
    student_id = student_id,
    subject = subject,
    year_group = year_group,
    result = round(rlnorm(length(year_group), meanlog = 3.4, sdlog = .7))
  ) %>%
    mutate(result = if_else(result > 100, 100, result))
  
  
}

make_exam_data(subjects = c("music", "maths", "science"),
               years = paste0("Year ",1:4),
               students = paste0("student_", 1:5)) %>% 
  pivot_wider(names_from = subject,
              values_from = result,
              names_prefix = "score_") %>% 
  write_csv("data/exam-data.csv")

