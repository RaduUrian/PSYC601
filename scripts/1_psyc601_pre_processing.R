#1. Setup

#1. Setup

# Sets pseudo random number generator seed to fixed value for reproducibility
set.seed(1)

options(pkgType = "binary")

# Check if package 'here' is installed; if not, install. 
if (!require("here")) install.packages("here")

# Load 'here' package
library(here)

# Check if renv file exists in project directory
if (file.exists(here("renv.lock")))
  
{
  
  if (!require("renv")) {
    
    install.packages("renv")
    renv::init(project = here())
    here()
  }
  
  else {
    # If renv file exists, restore stored packages
    renv::restore(project = here(),
                  clean = TRUE,
                  prompt = FALSE)
    
  }  
  
} else {
  
  # If renv file doesn't exist, check if pacman is not installed;
  # if yes, install & load, if not, just load.
  if (!require("pacman")) install.packages("pacman")
  library(pacman)
  
}

# Increase timeout for downloading packages in case of slow download speed
options(timeout = 300)

# Load all required packages and update to ensure compatibility
pacman::p_load(
  here,
  dplyr,
  tidyr
)

options(scipen = 999) # Remove scientific notations

#2. Import Data
data <- read.csv(here("data",
              "screen2024.csv"))

#3. Exploration

#4. Duplicates

#5. Assigning unique IDs

#6. Final Sample Size = 2,589?
