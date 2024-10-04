#1. Setup

# Sets pseudo random number generator seed to fixed value for reproducibility
set.seed(1)

options(pkgType = "binary")

renv::restore()

# Increase timeout for downloading packages in case of slow download speed
options(timeout = 300)

# Load all required packages and update to ensure compatibility
pacman::p_load(
  here,
  dplyr,
  tidyr,
  psych
)

options(scipen = 999) # Remove scientific notations

#2. Import Data
data <- read.csv(here("data",
              "screen2024.csv"))

#3. Exploration

describe(data)

#4. Duplicates

data$unique <- duplicated(data) | duplicated(data, fromLast = TRUE)

data <- tibble::rowid_to_column(data, "ID")

data_duplicate <- data %>% 
  filter(unique == TRUE) %>% 
  arrange(mvn1)

data_unique <- data %>%
  select(-c(ID,
            unique)) %>% 
  distinct()

#5. Assigning unique IDs

data_unique <- data_unique %>% 
  tibble::rowid_to_column("ID")

#6. Final Sample Size = 2,589?

# no, lost 10 duplicate cases, final N = 2,579

write.csv(data_unique,
          here("data", "screen2024_clean.csv"))
