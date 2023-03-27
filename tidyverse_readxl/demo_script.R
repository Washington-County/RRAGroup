# Goals:
#
# 1. Install/load packages
#   - library vs. require: same function but different return values (error vs. false)
# 2. Import excel document
#   - here package and working directories
# 3. Import a different worksheet
#   - sheet_names or using numbers
# 4. Viewing data
#   - View(), Environment pane, glimpse

# --- Did not get to steps 5-7

# 5. Mutating
#   - cleaning "dirty data" or the family of as.* functions
# 6. Summarizing
# 7. Joining


install.packages("readxl")
install.packages("tidyverse")
install.packages("here")

library(readxl) # primarily used
require(readxl) # similar to library() and used more in package development

fileLoc <- here::here("tidyverse_readxl","data", "AAGmediaSchoolsData.xlsx")

dfSchoolAgg <- read_xlsx(
  fileLoc,
  sheet = 1)

excel_sheets(fileLoc)

dfSchoolDisAgg <- read_xlsx(fileLoc, 2)

library(tidyverse)

library(dplyr)

dfSchoolAgg |> # |> is a pipe function, %>% is another kind of pipe
  mutate()
