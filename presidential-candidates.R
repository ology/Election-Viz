#
# Visualize two candidates in a U.S. presidential election with R.
#
# Each data point is a State.  The position is based on the number of popular
# votes given to each opponent.  The more votes, the farther "Northeast" the
# data point.  The reference line is the ideal diagonal given a perfect 50/50
# split.  A point between the diagonal reference line and the axis of a
# candidate, represents that State "leaning" toward that candidate.
#
# -- gene+github@ology.net
#

# Collect the election data files.
filenames <- list.files(
    'data',
    pattern = '^[0-9]{4}.dat$',
    full.names = TRUE,
);

# Process the elections into charts.
for (file in filenames) {
    # Build the chart title from the filename.
    title <- paste( sub('^data/([0-9]+)\\.dat$', '\\1', file), 'US Presidential Election' );

    # Read the candidate data.
    candidates <- read.table(
        file,
        header = FALSE,
        nrows  = 1,
        sep    = '\t',
    );

    # Read the election data.
    election <- read.table(
        file,
        header     = TRUE,
        skip       = 1,
        sep        = '\t',
    );

    # Open the graphics device to save our chart.
    png( paste(file, '.png', sep = '') );

    # Render the scatter plot.
    plot(
      election$Votes,
      election$Votes.1,
      main = paste( title, '\nby popular vote in millions' ),
      xlab = paste( names(candidates)[1], candidates[[1]], sep = ' - ' ),
      ylab = paste( names(candidates)[2], candidates[[2]], sep = ' - ' ),
      xaxt = 'n', # Turn off default axis
      yaxt = 'n', # "
    );

    # Scale the values.
    scale <- 1000000;

    # Draw the axes.
    # XXX Clunky and tedious. TODO Apply a single scaling method.
    axis( 1,
        at     = c(0, max(election$Votes) / 2, max(election$Votes)),
        labels = c(
            0,
            sprintf('%.2f', max(election$Votes) / scale / 2),
            sprintf('%.2f', max(election$Votes) / scale)
        ),
    );
    axis( 2,
        at     = c(0, max(election$Votes.1) / 2, max(election$Votes.1)),
        labels = c(
            0,
            sprintf('%.2f', max(election$Votes.1) / scale / 2),
            sprintf('%.2f', max(election$Votes.1) / scale)
        ),
    );

    # Draw a slope=1 reference line.
    abline(
      a   = 0,
      b   = 1,
      lty = 3,
      col = 'blue'
    );

    # Close the graphics device.
    dev.off();
}
