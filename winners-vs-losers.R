#
# Visualize two candidates in a U.S. presidential election with R.
#
# Each data point is a State.  The position is based on the number of popular
# votes given to each opponent.  The more votes, the farther "Northeast" the
# data point.  A point between the diagonal reference line and the axis of a
# candidate, represents that State "leaning" toward that candidate.
#
# -- gene+github at ology dot net not com
#

# Read in the election data.
election <- read.table(
  '1900.txt',
  header     = TRUE,
  skip       = 2,
  na.strings = '-'
);

# Convert the winner numbers into integers.
election$Votes   <- as.numeric(gsub(',', '', election$Votes));
# Convert the loser numbers into integers.
election$Votes.1 <- as.numeric(gsub(',', '', election$Votes.1));

# Render the scatter plot.
plot(
  election$Votes, election$Votes.1, 
  main = '1900 Election', 
  xlab = 'WILLIAM McKINLEY', 
  ylab = 'WILLIAM J. BRYAN'
);

# Draw a slope=1 line as reference.
abline(
  a   = 0,
  b   = 1,
  lty = 2,
  col = 'blue'
);

