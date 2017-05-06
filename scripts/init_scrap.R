library(rvest)
library(magrittr) # for the pipe operator
# website to scrape
site<- "http://www.ibilik.my/"
siteLoc<- "http://www.ibilik.my/rooms/petaling_jaya"
siteLocHTML<- read_html(siteLoc)

siteLocHTML %>%
  #html_nodes("table.room_list") %>%
  html_nodes("div.location")%>%
  html_text()

