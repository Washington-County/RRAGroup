# An Introduction to the `dplyr`  

Following on the work from last session where we imported the Excel file, in this live session we went through the basics of how to view, subset, and change your data set.   

## Topics
As always, I have linked (where applicable) to the relevant documentation for the functions we used in the `demo_script.R` file.    

- `glimpse()` - a function that returns information of the object, e.g. for a data frame it will tell you how many columns and rows and list the column names, their data types, and the first few rows. Below are some similar functions:   
    - `help()` displays documentation of the dataset
    - `dim()` shows the dimensions of the dataset
    - `summary()` shows a summary measures of the dataset
    - `str()` displays the internal structure of the dataset   
- `select()` - like a SQL select, reduces the data set to whatever columns you provided   
- `mutate()` - the bread-and-butter of any data manipulation starts here (even if it doesn't end here)   

Recommended reading if all of these functions were new to you is [Introduction to dplyr]( https://dplyr.tidyverse.org/articles/dplyr.html).

I also rewrote the code with piping, which I have mentioned before but now you can see the difference. It is also discussed [here](https://style.tidyverse.org/pipes.html).
