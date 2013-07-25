http://www.presidency.ucsb.edu/elections.php

http://en.wikipedia.org/wiki/List_of_U.S._states_by_historical_population

~
elections <- read.table(
  '/Users/gene/Data/Elections/presidential/1900.txt',
  header=TRUE,
  skip=2,
  na.strings="-"
);

elections$TOTAL   <- as.numeric(gsub(',', '', elections$TOTAL));
elections$Votes   <- as.numeric(gsub(',', '', elections$Votes));
elections$Votes.1 <- as.numeric(gsub(',', '', elections$Votes.1));

plot(
  elections$Votes, elections$Votes.1, 
  main='1900 Election', 
  xlab = 'WILLIAM McKINLEY', 
  ylab = 'WILLIAM J. BRYAN'
);

abline(0, 1, lty = 2, col = 'blue');

