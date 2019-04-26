###SECTION 6


#********************* Project: Movie Ratings Dataset

#********************* Grammar of Graphics - GGplot2

#Concept of layering images
#goal: how to create a chart that tells a story
#the 7 layers of information on a visualization process

# Movie Budget Distribution visualization analysis
#Aethetics: how is the data mapped?
#Data, Aesthetics, Geometries, Statistics, Facets, Coordinates, Theme
#Facets: multiple versions of a chart


#********************* What is a Factor?

getwd()
setwd("~/Google Drive/_Quant by Design/_Udemy/R Programming AZ/SECTION 6. ADVANCED VISUALIZATION")
getwd()

movies <- read.csv("P2-Movie-Ratings.csv")
colnames(movies) <- c("Film","Genre","CriticRating","AudienceRating","Budget.Million","ReleaseYear")
head(movies)
tail(movies)
str(movies)
summary(movies)

#convert into factor
factor(movies$Year)

#now assigned the new factor conversion back into the column
movies$Year <- factor(movies$Year)

summary(movies)
str(movies)



#********************* Aesthetics
library(ggplot2)

#aesthetics aes() #how data maps to desired visual
ggplot(data=movies, aes(x=CriticRating, y=AudienceRating))

#add geometry geom_point()
ggplot(data=movies, aes(x=CriticRating, y=AudienceRating))+
  geom_point()

#add colour
ggplot(data=movies, aes(x=CriticRating, y=AudienceRating, colour=Genre))+
  geom_point()

#now add size to depict budget
ggplot(data=movies, aes(x=CriticRating, y=AudienceRating, 
                        colour=Genre, size=Budget.Million))+
  geom_point()



#********************* Plotting with layers

#everytime you want to add layer, you have to literally add it
#a new object is created
p <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating, 
                             colour=Genre, size=Budget.Million))+
  geom_point()

#point // both plots are overlayed on top of each other
p + geom_point()

#lines
p + geom_line()

#multiple layers
p + geom_point() + geom_line()
p + geom_line() + geom_point()

#********************* Overriding Aesthetics

q <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating, 
                               colour=Genre, size=Budget.Million))
#add geometric layer
q + geom_point()

#now overriding aes
#here critic rating is increasing as you approach 100
q + geom_point(aes(size=CriticRating))

#ex. 2
#q remains the same
q + geom_point(aes(colour=Budget.Million))

#Ex.3:we can also overide the x-axis and/or y-axis
#note that budget doesn't affect audience ratings
q + geom_point(aes(x=Budget.Million))

#Ex.4
q + geom_point() + geom_line()

#reduce the line
q + geom_point() + geom_line(size=1)

#when making a deliverable: copy graphs and save

#********************* Mapping vs Subsetting
#what we've done so far
r <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating))
r + geom_point()

#mapping the colour
r + geom_point(aes(colour="DarkGreen")) #Error:not what we want

#setting the colour
r + geom_point(colour="DarkGreen")
#if you wanna set the colour, do not use aesthetics
#f you want to map the colour, use aes()

#Setting
r + geom_point(aes(size=Budget.Million)) #Error:not what we want

#mapping
r + geom_point(size=10)

#Inconclusion: only use aes() to map something, never set



#********************* Histograms and Density Charts
s <- ggplot(data=movies, aes(x=Budget.Million))
s + geom_histogram(binwidth=10)            

#add colour (set it, not map it)
s + geom_histogram(binwidth = 10, aes(fill=Genre))

#add a border (set it, not map it) - this chart is to be improved
s + geom_histogram(binwidth = 10, aes(fill=Genre), colour="Black")

#sometimes you may need this probability Density chart
s+ geom_density()

#make the plot look more interesting
s+ geom_density(aes(fill=Genre))
s+ geom_density(aes(fill=Genre), position="stack")


#********************* Starting Layer Tips

t <- ggplot(data=movies, aes(x=AudienceRating))
t + geom_histogram(binwidth = 10,
                   fill="white", colour="Blue")

#another way to acheive the above
#here we overide
t <- ggplot(data=movies)
t + geom_histogram(binwidth = 10, aes(x=AudienceRating),
                   fill="white", colour="Blue")

#Another example
#don't rely on overiding, it is not a good code practice
t + geom_histogram(binwidth = 10, aes(x=CriticRating),
                   fill="white", colour="Blue")

#a skeleton plot: to use different dataset on the plot
t <- ggplot()
t


#********************* Statistical Transformations

?geom_smooth

u <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating,
                             colour=Genre))
u + geom_point() + geom_smooth()

#the plot above is too messy, remove the fill
u + geom_point() + geom_smooth(fill=NA)

#boxplots
u <- ggplot(data=movies, aes(x=Genre, y=AudienceRating,
                             colour=Genre))
u + geom_boxplot()
u + geom_boxplot(size=1.2) #change size
u + geom_boxplot(size=1.2) + geom_point() #too messy!

#tip/hack: geom_jitter()
#jitter is a powerful tool when combined with boxplot
u + geom_boxplot(size=1.2) + geom_jitter()

#Another way:
u + geom_jitter() + geom_boxplot(size=1.2, aplha=0.5)

#mini chanllenge: create boxplot for critic rating

#********************* Facets

v <- ggplot(data=movies, aes(x=Budget.Million))
v + geom_histogram(binwidth = 10, aes(fill=Genre), colour="Black")

#Facets: facet by Genre
v + geom_histogram(binwidth = 10, aes(fill=Genre), colour="Black") +
  facet_grid(Genre~.)

#use scales="free" to free up the scales
v + geom_histogram(binwidth = 10, aes(fill=Genre), colour="Black") +
  facet_grid(Genre~., scales="free")

#now apply facets to scatterplot
w <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating,
                             colour=Genre))
w + geom_point(size=3)

#facets
w + geom_point(size=3) +
  facet_grid(Genre~.)

w + geom_point(size=3) +
  facet_grid(.~ReleaseYear)

w + geom_point(size=3) +
  facet_grid(Genre~ReleaseYear)

w + geom_point(size=3) +
  geom_smooth() +
  facet_grid(Genre~ReleaseYear)

w + geom_point(aes(size=Budget.Million)) +
  geom_smooth() +
  facet_grid(Genre~ReleaseYear)

#********************* Coordinates

#goal: limits and zoom

m <-ggplot(data=movies, aes(x=CriticRating, y=AudienceRating,
                            size=Budget.Million, colour=Genre)) 
m + geom_point()

#here we removed some rows #this might not always work well
m + geom_point() + xlim(50,100) + ylim(50,100)

n <-ggplot(data=movies, aes(x=Budget.Million))
n + geom_histogram(binwidth = 5, aes(fill=Genre), colour="Black")
                            
n + geom_histogram(binwidth = 10, aes(fill=Genre), colour="Black") +
  ylim(0,50)

#now zoom into the chart
n + geom_histogram(binwidth = 5, aes(fill=Genre), colour="Black") +
  coord_cartesian(ylim=c(0,50))

#improve the above form w: what CEO whats
w + geom_point(aes(size=Budget.Million)) +
  geom_smooth() +
  facet_grid(Genre~ReleaseYear) +
  coord_cartesian(ylim=c(0,100))


#********************* Theme

o <- ggplot(data=movies, aes(x=Budget.Million))
h<- o + geom_histogram(binwidth=10,aes(fill=Genre), colour="Black")  

h

#axes label
h +
  xlab("Money Axis") +
  ylab("Number of Movies") +
  theme(axis.title = element_text(colour="DarkGreen", size=10),
        axis.title.y = element_text(colour="Red", size=10))

#tick formatting
h +
  xlab("Money Axis") +
  ylab("Number of Movies") +
  theme(axis.title = element_text(colour="DarkGreen", size=10),
        axis.title.y = element_text(colour="Red", size=10),
        axis.text.x = element_text(size=10),
        axis.text.y = element_text(size=10))

#Legend foramatting

h +
  xlab("Money Axis") +
  ylab("Number of Movies") +
  ggtitle("Movie Budget Distribution") +
  theme(axis.title = element_text(colour="DarkGreen", size=10),
        axis.title.y = element_text(colour="Red", size=10),
        axis.text.x = element_text(size=10),
        axis.text.y = element_text(size=10),
        
        legend.title = element_text(size=10),
        legend.text = element_text(size=10),
        legend.position = "right",
        
        plot.title = element_text(colour="DarkBlue", size=20, 
                                  family="Courier"))
        
#********************* Boxplot (Extra learning)
#this section is more of an explanation section
#horizontal boxplots or vertical boxplot


#********************* Homework: Movie Domestic Rate % Gross

#recreate the visualization given to you by the Team
getwd()
setwd("~/Google Drive/_Quant by Design/_Udemy/R Programming AZ/SECTION 6. ADVANCED VISUALIZATION")
getwd()

mov <- read.csv("Section6-Homework-data.csv")

#data exploration
head(mov)
tail(mov)
summary(mov)
str(mov)

#now let's determine what variables we will need to create
#so we need 4 columns

#load ggplot2 package
#install.packages("ggplot2")
library(ggplot2)

#interesting insight
#it looks like most movies are released on Friday (a strategy)
#no movie was released on a monday
ggplot(data=mov, aes(x=Day.of.Week)) + geom_bar()

#filter the dataframe for the variables that we need
filt <- (mov$Genre=="action") |(mov$Genre=="adventure") | (mov$Genre=="animation") | (mov$Genre=="comedy") | (mov$Genre=="drama")

#filter2
filt2 <-mov$Studio %in% c("Buena Vista Studios", "WB", "Fox", "Universal", "Sony", "Paramount Pictures")

mov2 <- mov[filt & filt2,]
mov2

#prep the plot's data and aes layers
p <- ggplot(data=mov2, aes(x=Genre, y=Gross...US))
p

#add geometrics
p +
  geom_jitter() +
  geom_boxplot(alpha=0.7)

#add colour
p +
  geom_jitter(aes(size=Budget...mill., colour=Studio)) +
  geom_boxplot(alpha=0.7)

#there are some dots from geom_plot() stll present, let's get rid of it
q <- p +
  geom_jitter(aes(size=Budget...mill., colour=Studio)) +
  geom_boxplot(alpha=0.7, outlier.colour=NA )

q

par(xpd=TRUE)

#non-data ink
q <- q +  
  xlab("Genre") +
  ylab("Gross % US") +
  ggtitle("Domestic Gross % by Genre") 

q

#theme
q <- q +  
  theme(axis.title = element_text(colour="Blue", size=10),
        axis.title.y = element_text(colour="Blue", size=10),
        axis.text.x = element_text(size=10),
        axis.text.y = element_text(size=10),
        
        legend.title = element_text(size=10),
        legend.text = element_text(size=10),
        legend.position = "right", #this moves legend outside plot
     
        plot.title = element_text(size=20),
        text = element_text(family ="Comic Sans MS")
        )
q        

#Final Touch
q$labels$size <- "Budget(Million)"

q
