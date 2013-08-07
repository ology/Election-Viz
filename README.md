Election-Viz
============

Visualize two candidates in a U.S. presidential election.

This depends on the system having a plain vanilla
[R][http://cran.r-project.org/mirrors.html] installed and
[Perl][http://www.perl.org/get.html] with the CPAN module
[HTML::TableExtractor][https://metacpan.org/module/HTML::TableExtractor].

Then from the command prompt:

    perl wikipedia-scrape YYYY  # [1900-2012]

This will harvest the Wikipedia "Results (Votes) by state" entry for the given
year, and will cache both the HTML entry and tab-separated data files in the
_data/_ subdirectory.

Do this for as many years as you want.  Providing _-1_ instead of a _YYYY_
argument to **wikipedia-scrape** will harvest the entire 1900-2012 range of years.

Next run **R** and

    source('presidential-candidates.R')

This will produce individual _PNG_ charts for each year in the _charts/_
subdirectory.

