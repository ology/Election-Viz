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
    # Get the year from the filename.
    year <- sub('^data/([0-9]+)\\.dat$', '\\1', file);

    # Build the chart title.
    title <- paste( year, 'US Presidential Election' );

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
        na.strings = '-',
        sep        = '\t',
    );

    # Open the graphics device to save our chart.
    png( paste('charts', '/', year, '.png', sep = '') );
#    quartz();

    # Render the scatter plot.
    plot(
      election$N,
      election$N.1,
      main = title,#paste( title, '\nby popular vote in millions' ),
      xlab = candidates[[1]],
      ylab = candidates[[2]],
#      xaxt = 'n', # Turn off default x-axis
#      yaxt = 'n', # Turn off default y-axis
    );

    # Identify datapoints.
    identify(
        election$N,
        election$N.1,
        labels = row.names(election),
    );

    # Scale the values.
    scale <- 1000000;

    # Draw the axes.
#    axis( 1, at = pretty(0:election$N,   n = 10) );
#    axis( 2, at = pretty(0:election$N.1, n = 10) );

    # Draw a reference line.
    abline(
      a   = 0,
      b   = 1, # Slope=1
      lty = 3, # Dashes
      col = 'blue'
    );

    # Close the graphics device.
    dev.off();
}
