# Goals:
#
# Session 1
# 1. Install/load packages
#   - library vs. require: same function but different return values (error vs. false)
# 2. Import excel document
#   - here package and working directories
# 3. Import a different worksheet
#   - sheet_names or using numbers
# 4. Viewing data
#   - View(), Environment pane, glimpse

# --- Did not get to steps 5-7
#
# Session 2
# 5. Mutating
#   - cleaning "dirty data" or the family of as.* functions
# 6. Summarizing
# 7. Joining


install.packages("readxl")
install.packages("tidyverse")
install.packages("here")

library(readxl) # primarily used
require(readxl) # similar to library() and used more in package development

fileLoc <- here::here("tidyverse_dplyr","data", "AAGmediaSchoolsData.xlsx")

dfSchoolAgg <- read_xlsx(
  fileLoc,
  sheet = 1)

excel_sheets(fileLoc) # We could use the sheet names instead of just the number but we bein easy

dfSchoolDisAgg <- read_xlsx(fileLoc, 2)

library(tidyverse)

library(dplyr)

# End of Session 1

# Session 2 - Cleaning Data with mutate

dfSchoolAgg |> # |> is a pipe function, %>% is another kind of pipe
  mutate()

# glimpse() - a quick overview of your dataset
glimpse(dfSchoolAgg)

# select()
dfSchoolAggSub <- select(dfSchoolAgg, `District ID`, `Ever English Learners`, `Students with Disabilities`)

# mutate()
mutate(
  dfSchoolAggSub,
  `Ever English Learners New` = ifelse(`Ever English Learners` == "<5%", .01, as.numeric(`Ever English Learners`)),
  `Students with Disabilities New` = ifelse(`Students with Disabilities` == "<5%", .01, as.numeric(`Students with Disabilities`))
  )

dfSchoolClean <- mutate(
  dfSchoolAgg,
  across(10:38 & where(is.character), ~ ifelse(.x == "<5%", .01, as.numeric(.x)))
)
           
# What is this code doing?
dfSchoolAgg %>% 
  filter(if_any(everything(), ~ ifelse(.x == "*", T, F)))
