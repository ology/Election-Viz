#
# Visualize the winner vs loser in the U.S. presidential election
#

# Read in the election data.
elections <- read.table(
  '1900.txt',
  header     = TRUE,
  skip       = 2,
  na.strings = '-'
);

# Convert "comma numbers" into integers.
elections$Votes   <- as.numeric(gsub(',', '', elections$Votes));
elections$Votes.1 <- as.numeric(gsub(',', '', elections$Votes.1));

# Render the scatter plot.
plot(
  elections$Votes, elections$Votes.1, 
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

