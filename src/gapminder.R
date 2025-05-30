# Exploring the Gapminder data set

# Load gapminder data
gapminder = read.csv("data/gapminder_data.csv")
dim(gapminder)
names(gapminder)
str(gapminder)

# Data summary
summary(gapminder)


# Subsetting data
mean(gapminder$lifeExp)

# Subsetting by numbers
gap = head(gapminder)
gap$year[5] # Pull out single value
gap$year[2:3] # Sets of values
gap$year[c(5,3,2,2,1,3,4,5,6,2)] # Sets of values
gap$year[99]
gap$year[-4]
gap$year[-(1:3)]
gap$year[c(TRUE, FALSE, FALSE, TRUE, TRUE, FALSE)]
gap$year[gap$year > 1960] # Logical vector

# Combining logical statements
gap$year > 1960
gap$year < 1975
gap$year > 1960 & gap$year < 1975
gap$year > 1960 | gap$year < 1975
gap$year < 1960 | gap$year > 1975 | gap$year==1967
gap$year %in% c(1950:1960)
gap$country %in% c("China", "Japan")

# Subset a data frame
gap[c(1,2,3,2,2,1,2,3,5),]
gap[,c(3,2,4)]
gap[gap$year==1962, 4]
gap[gap$year==1962, c("country", "pop", "continent")]


# Calculate mean gdp for Africa & Asia in 1970s
practice = gapminder[
  (gapminder$continent == "Asia" | 
    gapminder$continent == "Africa") &
    gapminder$year %in% 1970:1979,]
mean(practice$gdpPercap)

practice2 = gapminder[gapminder$continent %in% c("Asia", "Africa") &
            gapminder$year %in% 1970:1979,]


# Minor cleanups
# Indices start at 1, not 0
gap$country[1]
# Single and double & and |
#   Single = vectors  ( &  | )
#   Double = Only first value  ( &&  || )

test = c(TRUE, TRUE, FALSE)
any(test)
all(test)

test2 = c(5, 4, 5, NA)
all(test2 >= 4)
test2 == NA  # Does not work
is.na(test2) # Better way
is.finite(); is.infinite(); is.nan()
Inf






