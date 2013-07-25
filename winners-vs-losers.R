#
# R code to visualize the winner vs loser in the U.S. presidential election.
# -- gene+github at ology dot net not com
#

# Read in the election data.
election <- read.table(
  '1900.txt',
  header     = TRUE,
  skip       = 2,
  na.strings = '-'
);

# Convert "comma numbers" into integers.
election$Votes   <- as.numeric(gsub(',', '', election$Votes));
election$Votes.1 <- as.numeric(gsub(',', '', election$Votes.1));

# Render the scatter plot.
plot(
  election$Votes, election$Votes.1, 
  main = '1900 Election', 
  xlab = 'WILLIAM McKINLEY', 
  ylab = 'WILLIAM J. BRYAN'
);

# Draw a line with slope=1 as a reference.
abline(
  a   = 0,
  b   = 1,
  lty = 2,
  col = 'blue'
);

