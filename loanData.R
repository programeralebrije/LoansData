# I
#Please answer the following question.
#Does the term of the loan influence loan status? If so, how?

install.packages("gmodels")
library(gmodels)
library(dplyr)

loans$DateR <- as.Date(paste(loans$Date), "%m/%d/%Y")
CrossTable(loans$term, loans$loan_status, fisher=TRUE, chisq = TRUE, mcnemar = TRUE, expected = TRUE, sresid=TRUE, format="SPS")

#III 
#The news just ran a story that only 15% 
#of homes are fully paid for in America,
#and that another 10% have given up on paying it back, 
#so the bank has "charged off" the loan.
#Does it seem likely that the data for this hands on came from the larger population of America?




loans %>% group_by(loan_status) %>% summarize(count=n())
observed = c(5627, 1140, 32950)
expected = c(0.10, 0.75, 0.15)
chisq.test(x = observed, p = expected)

# A tibble: 3 × 2
#loan_status count
#<chr>       <int>

#  1 Charged Off  3282
#  2 Current       502
#  3 Fully Paid  18173

#data:  observed
#X-squared = 150539, df = 2, p-value < 2.2e-16


