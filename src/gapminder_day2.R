# Additional gapminder data

# Colombia, Venezuela, Ecuador, Peru, Panama, and Bolivia

# Load gapminder data
gapminder = read.csv("data/gapminder_data.csv")

# Subset to just Bolivar countries
countries = c("Colombia", "Venezuela", "Ecuador",
              "Peru", "Panama", "Bolivia")
bolivar = gapminder[gapminder$country %in% countries ,]

# Pop and GDP in 1972
bolivar1972 = bolivar[bolivar$year==1972,]
sum(bolivar1972$pop)
mean(bolivar1972$gdpPercap)

# Checking total GDP
bolivar$GDP = bolivar$pop * bolivar$gdpPercap
wealthy = bolivar[bolivar$GDP > 100e9,]


# Utility functions
# subset()
wealthy = subset(bolivar, bolivar$GDP > 100e9)
# table()
table(wealthy$country)
table(wealthy$country, wealthy$year)
# unique()
unique(bolivar$country)

