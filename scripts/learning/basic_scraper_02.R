# Objective: scraping news articles
# Script name: basic_scraper_02

# Load the libraries
library(XML)
library(RCurl)
library(stringr)

# news to scrape from
url<-"http://timesofindia.indiatimes.com/topic/Donald-Trump/news"

# Read the HTML of the web page
SOURCE<- getURL(url, encoding="UTF-8")
# Parse the HTML file and generate an R structure representing the XML/HTML tree
PARSED<- htmlParse(SOURCE)  

