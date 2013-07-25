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

# Collect the election data files.
filenames <- list.files(
    'data',
    pattern = '^presidential-[0-9]{4}.txt$',
    full.names = TRUE
);

for (file in filenames) {
    election <- read.table(
        file,
        header     = TRUE,
        skip       = 2,
        na.strings = '-'
    );

    # Convert the winner numbers into integers.
    election$Votes   <- as.numeric(gsub(',', '', election$Votes));
    # Convert the loser numbers into integers.
    election$Votes.1 <- as.numeric(gsub(',', '', election$Votes.1));

    # Save our chart.
    img <- paste(file, '.png', sep = '');
    png(img);

    # Render the scatter plot.
    plot(
      election$Votes, election$Votes.1, 
      main = file, 
      xlab = 'WINNER', 
      ylab = 'LOSER'
    );

    # Draw a slope=1 line as reference.
    abline(
      a   = 0,
      b   = 1,
      lty = 2,
      col = 'blue'
    );

    dev.off();
}
