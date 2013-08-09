Election-Viz
============

Visualize two candidates in a U.S. presidential election.

* This depends on the system having a plain vanilla
[R](http://cran.r-project.org/mirrors.html) installed and
[Perl](http://www.perl.org/get.html) with the CPAN module
[HTML::TableExtractor](https://metacpan.org/module/HTML::TableExtractor).

* Then from the command prompt, in the cloned git repo:

    perl wikipedia-scrape YYYY  # [1900-2012]

This will harvest and process the Wikipedia "Results (Votes) by state" entry for
the given year, and will cache both the HTML entry and tab-separated data files
in the *data/* subdirectory.

Do this for as many years as you want.  Providing *-1* instead of a *YYYY*
argument to **wikipedia-scrape** will harvest the entire 1900-2012 range of years.

* Next run **R** and

    source('presidential-candidates.R')

This will read the harvested data files and produce individual *PNG* charts for
each year in the *charts/* subdirectory.

* Open the presidential-candidates.R code in an editor, change the *plot_type*
from **N**umber of popular votes to **P**ercent of votes, toggle *show_labels*,
save and re-source in your R window.  The relevant charts/*.png files will be
refreshed.

If you want to use a different graphics driver or save format, change the
relevant R *png()* or *quartz()* statements, while in your editor.

Voilà!
