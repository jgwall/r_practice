# Final R wrap-up

library(ggplot2)

# Load Gapminder data
gapminder = read.csv("data/gapminder_data.csv")
head(gapminder)

# 2007 life expectancy for each continent
unique(gapminder$continent)
gap2007 = subset(gapminder, gapminder$year==2007)
asia = subset(gap2007, gap2007$continent=="Asia")
africa = subset(gap2007, gap2007$continent=="Africa")
mean(asia$lifeExp)
mean(africa$lifeExp)

# Alternative
asia2 = subset(gapminder, gapminder$continent=="Asia" &
                gapminder$year==2007)


# Make a plot
ggplot(gapminder) +
  aes(x=gdpPercap, y=lifeExp, color=continent, size=pop) +
  geom_point(alpha=0.5) +
  facet_wrap(~continent)
ggsave(file="results/gapminder_dots.png", width=8,
       height=8, units="in", dpi=600)


# For loop demonstration
continents = unique(gapminder$continent)
for(mycontinent in continents){
  # Calculate mean life expectancy
  cat("Calculating for", mycontinent, "\n")
  mydata = subset(gapminder, gapminder$year==2007 &
                    gapminder$continent == mycontinent)
  mymean = mean(mydata$lifeExp)
  cat("\tMean life exp. is", mymean, "\n")
  
  # Print what range the life expectancy is in
  if (mymean < 60){
    cat("\tExpectancy is < 60\n")
  } else if(mymean < 75){
    cat("\tExpectancy is between 60 and 75\n")
  } else {
    cat("\tExpectancy greater than 75\n")
  }
}

# Conditionals
x=1
if( x > 4 ){
  cat("X is greater than 4")
} else {
  cat("X is not greater than 4")
}


# Working with dplyr
library(dplyr)

mean_exp = gapminder %>%
  filter(year == 2007) %>%
  group_by(continent) %>%
  summarize(meanExp  = mean(lifeExp, na.rm=TRUE))
mean_exp


# For each year in the dataset, print out the min, 
#    median, and max gdpPercap for each continent   
gapminder %>%
  group_by(year, continent) %>%
  summarize(min=min(gdpPercap), med=median(gdpPercap),
            max=max(gdpPercap))

# Mutate
gapminder %>%
  mutate(GDP = gdpPercap * pop) %>%
  head()

# Equivalent function calls
gapminder$continent %>% 
  unique() %>%
  sort()
unique(gapminder$continent)



# Trial code
practice2 = gapminder[gapminder$continent %in% c("Asia", "Africa") &
                        gapminder$year %in% 1970:1979,]
mean(practice2$lifeExp)     

numbers = practice2 %>% select(year, pop, lifeExp, gdpPercap)
mean(as.matrix(numbers))



