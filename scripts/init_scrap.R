library(rvest)
library(magrittr) # for the pipe operator
# RQ: Scrape the IMDB website for the most popular 100 movies of all times
# website to scrape
#site<- "http://www.propwall.my/"
#siteLoc<- "http://www.propwall.my/selangor"
siteLoc<- "http://www.imdb.com/search/title?year=2015,2016&title_type=feature"
# there are 20,835 titles for movies released between 2015-2016
siteLocHTML<- read_html(siteLoc)

# get the movie rank
#Using CSS selectors to scrap the rankings section
rank_data_html<- html_nodes(siteLocHTML,'.text-primary') # use single quote to enclose the CSS element
#Converting the ranking data to text
rank_data <- html_text(rank_data_html)
#Let's have a look at the rankings
head(rank_data)
#Data-Preprocessing: Converting rankings to numerical
rank_data<-as.numeric(rank_data)
head(rank_data)

#Using CSS selectors to scrape the title section
siteLocHTML %>% 
  html_nodes("h3 a") %>%
  html_text()

#Using CSS selectors to scrape the movie release year
siteLocHTML %>% 
  html_nodes("h3 span") %>%
  html_text()%>%
  head()

# movie certificate
siteLocHTML %>% 
  html_nodes(".certificate") %>%
  html_text()%>%
  head()

# movie runtime
siteLocHTML %>% 
  html_nodes(".runtime") %>%
  html_text()%>%
  head()

# movie genre
siteLocHTML %>% 
  html_nodes(".genre") %>%
  html_text()%>%
  head()

# movie rating
siteLocHTML %>% 
  html_nodes("strong") %>%
  html_text()%>%
  head()

# movie metascore
siteLocHTML %>% 
  html_nodes(".ratings-metascore") %>%
  html_text()%>%
  head()
