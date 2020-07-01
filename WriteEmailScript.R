library(gt)
library(blastula)
library(tidyverse)
library(ggplot2)
library(glue)
library(formattable)

# Create Plot 
# Plot Picture saved to Imgur:
  
  the_plot <- ggplot(dat1, aes(x = date, y = Apps))+ geom_line()+ theme_bw()+scale_color_manual(values= "red")
the_plot

imgur_image <-
  add_imgur_image(
    image = the_plot,
    client_id = "851117406f0b457"
  )




image <- "C:/Users/christine.iyer/Box/Email_Generation/CappexLeads.png"
imgur_image <-
  add_imgur_image(
    image = the_plot,
    client_id = "851117406f0b457"
  )

body_text <-
  glue(
    "


The data he sent makes much more sense. \\
It was excluding students who are not yet captured \\
because the census report is a couple months away. We \\
discussed criteria for a new list which will hopefully \\ 
include students who have deposited and are due to start \\
in the upcoming months. This will give us a second year \\
of applications so we can look at the patterns of ap-\\
plication flow. He's sending the list by EOD tomorrow.



{imgur_image}


Thank you,

Christine Iyer \\
Marketing Data Analyst \\
University of Southern Maine
"
  ) %>% md()

compose_email(body = body_text) %>%
  smtp_send(
    to = "wrike+into523544264@wrike.com",
    #cc = "tracy.st@maine.edu",
    from = "christine.iyer@maine.edu",
    subject = "Project Update",
    credentials = creds_key(id = "gmail")
  )
