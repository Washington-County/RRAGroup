# An Introduction to the Tidyverse and Readxl Packages

In this live session, we will be using the `tidyverse` and `readxl` to **import** and **wrangle** data from an **Excel file** with **two worksheets** to answer some questions. But before we get into that I want to talk a little bit about what these data are.

The **Oregon Department of Education (ODE)** allows public access ("media" access) to their **At-A-Glance School and District Profile** data via [this link](https://www.ode.state.or.us/data/reportcard/media.aspx). The data we are working with are for the 2021-2022 school year. More information on these data can be found [here](https://www.oregon.gov/ode/schools-and-districts/reportcards/reportcards/Pages/default.aspx).

## Topics   
Phew, wow. We covered a lot of topics! I have linked (where applicable) to the relevant documentation for the functions we used in the `demo_script.R` file.

- `install.packages()` - used to (you guessed it!) install packages (aka libraries by some) to your machine
- `here::here()` - we did not cover this in class but it will create a path to the dataset discussed above, which lives in the `/data/` folder
- `readxl::read_xlsx()` - used to (I'll give you one guess) read in an xlsx file - help documentation [link](https://readxl.tidyverse.org/reference/read_excel.html)
- `readxl::excel_sheets` - returns the name(s) of the worksheets in the Excel file

You can see that we used the `readxl` package quite a bit. Here is a [link](https://readxl.tidyverse.org/index.html) to its package website. While not every package has a site like this a lot of the ones we cover will. I also recommend looking at the [cheatsheet](https://github.com/rstudio/cheatsheets/blob/main/data-import.pdf). A similar package is `readr`. You can look at it [here](https://readr.tidyverse.org/index.html).

We also briefly discussed the pipe `|>`. [Here](https://r4ds.had.co.nz/pipes.html) is the relevant chapter from R for Data Science. I will try not to use it in our live sessions but (inevitably), I will forget.
