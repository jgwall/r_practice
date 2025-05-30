# Practice plotting with ggplot2

library(ggplot2)

# Load gapminder data
gapminder = read.csv("data/gapminder_data.csv")

# Create a basic plot
ggplot(gapminder) +
  aes(x=gdpPercap, y=lifeExp, color=continent) +
  geom_point(alpha=0.5)

# Year vs Life Expectancy
ggplot(gapminder) +
  aes(x=year, y=lifeExp, color=continent,
      group=country) +
  geom_line(alpha=0.5) +
  geom_point(color="black")
  
# Transformations
ggplot(gapminder) +
  aes(x=gdpPercap, y=lifeExp) +
  geom_point(alpha=0.5) +
  scale_x_log10() +
  geom_smooth(method = "lm") +
  theme(axis.text = element_text(size=15, 
                                 face="bold",
                                 color="blue"),
        axis.text.x = element_blank(),
        panel.background = element_blank()) +
  labs(title = "Sample plot",
       x = "GDP Per Capita",
       y = "Life Expectancy")


# Year vs Life Expectancy
plot1 = ggplot(gapminder) +
  aes(x=year, y=lifeExp, color=continent,
      group=country) +
  geom_line(alpha=0.5) +
  facet_wrap( ~ continent, scales="free") +
  xlim()

ggsave(plot1, file="results/gapminder1.png",
       width=7, height=6, units="cm", dpi=300)



