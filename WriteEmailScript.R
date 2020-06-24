library(gt)
library(blastula)
library(tidyverse)
library(ggplot2)
library(glue)
library(formattable)
image <- "C:/Users/christine.iyer/Box/Email_Generation/CappexLeads.png"
imgur_image <-
  add_imgur_image(
    image = the_plot,
    client_id = "851117406f0b457"
  )

body_text <-
  glue(
    "
Good Afternoon Jon,

I wanted to follow up on the application flow for matriculated  \\
students in Online Programs. I matched the raw data you sent me from ME St \\
with the SF data to get the application timeline.\\
There's such a huge gap so I wanted you to double check it. \\
If it looks like you think it should, I'll proceed with my report.\\



{imgur_image}


Thank you,

Christine Iyer\\
Marketing Data Analyst\\
University of Southern Maine
"
  ) %>% md()

compose_email(body = body_text) %>%
  smtp_send(
    to = "jbarker@maine.edu",
    cc = "tracy.st@maine.edu",
    from = "christine.iyer@maine.edu",
    subject = "App Flow for Online Students",
    credentials = creds_key(id = "gmail")
  )
