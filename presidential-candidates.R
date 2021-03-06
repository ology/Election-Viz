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

# Type of plot: [N]umeric or [P]ercent
plot_type <- 'P';
# Show state abbreviation/name labels.
show_labels <- 1;

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

    cat(paste('Building image file for', title, '...'));

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

    image_file <- paste('charts', '/', year, '.png', sep = '');

    # Open the graphics device to save our chart.
    png(image_file);
#    quartz(); # <- Open interactive charting.

    # Render the scatter plot.
    if (plot_type == 'N') {
        # By popular vote
        plot(
            election$N, election$N.1,
            main = paste(title, '\ndata harvested from Wikipedia'),
            xlab = candidates[[1]],
            ylab = candidates[[2]],
        );
    } else {
        # By percent
        plot(
            election$P, election$P.1,
            main = paste(title, '\ndata harvested from Wikipedia'),
            xlab = candidates[[1]],
            ylab = candidates[[2]],
            xlim = c(0, 100),
            ylim = c(0, 100),
        );
    }

    # Draw a reference line.
    abline(
      # By popular vote
      a = ifelse(plot_type == 'N', 0, 100),
      # By percent
      b = ifelse(plot_type == 'N', 1, -1),
      lty = 3, # Dotted
      col = 'blue'
    );

    # Draw labels if requested.
    if (show_labels > 0) {
        # Label points for abbreviation or state.
        abbrev <- names(election)[names(election) == 'XX'];
        if (length(abbrev) == 0) {
            row.names(election) <- election$State;
        }
        else {
            row.names(election) <- election$XX;
        }
        # Add labels to the plot.
        if (plot_type == 'N') {
            # By popular vote
            text(
                election$N, election$N.1,
                row.names(election),
                cex = 0.6,
                pos = 4,
                col = 'red',
            );
        } else {
            # By percent
            text(
                election$P, election$P.1,
                row.names(election),
                cex = 0.6,
                pos = 4,
                col = 'red',
            );
        }
        # Identify points for mouse-click interactive charting.
    #    identify(
    #        election$P,
    #        election$P.1,
    #        labels = row.names(election),
    #    );
    }

    # Set the legend slope by votes or percent.
    slope <- ifelse(plot_type == 'N', 1, -1);
    # Render a legend.
    legend(
        # Toggle for popular vote or percent.
        ifelse(plot_type == 'N', 'bottomright', 'topright'),
        c('State', paste('slope =', slope)),
        col = c('black', 'blue'),
        pch = c('o', ''),
        lty = c(0, 3),
        lwd = c(0, 1),
        inset = 0.05,
    );

    # Close the graphics device.
    dev.off();

    cat(paste('Wrote image file:', image_file));
}
