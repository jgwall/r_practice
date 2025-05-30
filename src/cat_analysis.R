# Basic analysis of cat data

# Load in cats data
cats = read.csv("data/cats.csv")
# read.delim() # For tab-separated files

# Get info on our data frame
class(cats)  # human-readable results
typeof(cats) # For the computer to see

# Making different types of vectors
x = 1:18 # Integer vector
typeof(x)
y = c(1, 2, 107) # Double (or numeric) vector
typeof(y)
z = c(1.5, 2.0999, -87) # Also a double/numeric
typeof(z)
a = c(TRUE, FALSE, FALSE, TRUE)
typeof(a) # Logical
b = c("Hello", "47", "FALSE")
typeof(b)
mixed = c(TRUE, 58, "Hello")
typeof(mixed)
mixed
# Hierarchy of conversion
#  Logical > Integer > Numeric > Complex > Character

# Coercing data
as.logical(mixed)
as.numeric(mixed)
mixed2 = c(TRUE, 58, "Hello")
mixed2
as.logical(mixed2)
as.integer(mixed2)
as.character(mixed2)

# Exploring cats data
str(cats)
cats$likes_cheese = as.logical(cats$likes_cheese)
str(cats)
dim(cats)
names(cats)
head(cats, n=2)
tail(cats, n=2)
length(cats)
length(cats$name)
length(1:101)

# Write out altered cats data
write.csv(cats, file="data/cats_clean.csv",
          row.names=FALSE)


# Matrices
mymatrix = matrix(1:12, nrow=4, byrow = TRUE)
mymatrix
as.matrix(cats)

# Lists
mylist = list(a, b, x, y, z, mixed)
str(mylist)
mylist

# Hierarchy of flexibility
# vectors > matrices > data.frames > lists

# Adding data to data frame
color = c("tuxedo", "ginger", "gray", "black")
cbind(color, cats, number=1:4) # Bind by columns
rbind(cats, list("Bob", 14, FALSE)) # Bind by rows

new_cats = cats
new_cats$color = color
new_cats$number = 1:4
new_cats






