# Load all the needed (and more) packages and libraries ----

source(here::here("tidyverse_readxl", "utilities.R"))

# Read Excel file using two methods ----

public_schools_char_source <- read_xlsx(here::here("tidyverse_readxl/data", "Public_School_Characteristics.xlsx"),
  sheet = 1)

public_schools_char_source2 <- read_xlsx("K:/R/R Trainings/Intro to R and R Basics/RRAGroup-master/RRAGroup-master/tidyverse_readxl/data/Public_School_Characteristics.xlsx",
                                    sheet = 1)

# Review your data ----

## View dataframe ----

View(public_schools_char_source)

## Look at the dimensions of the df ----

dim(public_schools_char_source)

## Look at your columns names ----

colnames(public_schools_char_source)


# Basic commands to do data wrangling ----

## Select only the variables needed ----

public_schools_char_df <- public_schools_char_source %>%
  select(STABR, SCH_NAME, LCITY, PK, Kindergardent_students, starts_with("G"), TOTAL, AmericanIndian,
         Hispanic, Black, White, HawaiianPI, students_twoormore_races, total_teachers, NMCNTY, SCHOOL_TYPE_TEXT,
         SCHOOL_LEVEL)

## Or deselect the variables needed ----

public_schools_char_df2 <- public_schools_char_source %>%
  select(-LEA_NAME, -LSTREET1, -LZIP, -LZIP4, -PHONE)

## Get data for just Oregon ----

public_schools_oregon <- public_schools_char_df %>%
  filter(STABR == "OR")

View(public_schools_oregon)

## Summary tables ----

number_schools_by_county <- public_schools_oregon %>%
  group_by(NMCNTY) %>%
  summarise(n_schools = n_distinct(SCH_NAME)) %>%
  arrange(n_schools) %>%
  adorn_totals()

View(number_schools_by_county)
class(number_schools_by_county)


number_students_by_county <- public_schools_oregon %>%
  group_by(NMCNTY) %>%
  summarise(n_students = sum(TOTAL, na.rm = TRUE)) %>%
  adorn_totals()

View(number_students_by_county)
class(number_students_by_county)

# Join two dataframes ----

number_schools_students_county <- number_schools_by_county %>%
  left_join(number_students_by_county, by = "NMCNTY")

View(number_schools_students_county)

# Summary table with two summary statistics ----

number_students_firstandsecondgrade_county <- public_schools_oregon %>%
  group_by(NMCNTY) %>%
  summarise(n_students_first = sum(G01, na.rm = TRUE),
            n_students_second = sum(G02, na.rm = TRUE))

View(number_students_firstandsecondgrade_county)

# Summary table with two grouping variables and two summary statistics ----

number_students_schooltype_county <- public_schools_oregon %>%
  group_by(NMCNTY, SCHOOL_TYPE_TEXT) %>%
  summarise(n_students_first = sum(G01, na.rm = TRUE),
            n_students_second = sum(G02, na.rm = TRUE))

View(number_students_schooltype_county)
  

# Create function to automate getting summary tables ----

get_county_counts_function <- function(variable){
  
  variable <- enquo(variable)
  
  county_summary_table <- public_schools_oregon %>%
    group_by(NMCNTY) %>%
    summarise(n_students = sum(!!variable, na.rm = TRUE))
  
  return(county_summary_table)}


hispanic_students_county <- get_county_counts_function(Hispanic)

black_students_county <- get_county_counts_function(Black)

total_teachers_county <- get_county_counts_function(total_teachers)
  



