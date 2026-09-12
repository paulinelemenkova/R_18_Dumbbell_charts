# R Dumbbell Charts — Paired Statistical Comparison of Geospatial Data

R scripts for building dumbbell (connected-dot) charts, a compact visual idiom
for comparing two paired values per category on a shared axis. Each category is
drawn as a horizontal segment terminated by two coloured points, so that the
gap length and direction encode the magnitude and sign of change between the
paired variables. The primary script analyses the geomorphology of the Mariana
Trench; a second script demonstrates the same idiom for multi-year land-area
data.

## Related publication

The Mariana Trench script (dumbbell_chart_ggalt_mariana_trench.R) produced
figures in:

Lemenkova, P. Statistical Analysis of the Mariana Trench Geomorphology Using R
Programming Language. Geodesy and Cartography 2019, 45(2), 57-84.

- DOI:      https://doi.org/10.3846/gac.2019.3785
- figshare: https://doi.org/10.6084/m9.figshare.9762860
- HAL:      https://hal.science/hal-02277500
- Zenodo:   https://zenodo.org/record/3385005
- SSRN:     http://ssrn.com/abstract=3447481
- ISSN:     2029-6991 (indexed in Scopus)

## Scripts

### dumbbell_chart_ggalt_mariana_trench.R
Reads a morphometric table of 25 cross-trench profiles (Morphology.csv) and
builds dumbbell charts with ggalt::geom_dumbbell. Two paired comparisons of
per-profile observation points are plotted across tectonic-plate pairs:
Philippine vs Pacific, and Mariana vs Caroline. Methods:

- Deterministic category ordering: the profile axis is coerced to a factor with
  explicit levels (factor(profile, levels = ...)) so dumbbells retain survey
  order rather than being re-sorted alphabetically.
- Dumbbell geometry (geom_dumbbell): a connecting segment plus start/end points
  with independent colours and sizes (colour_x / colour_xend, size_x /
  size_xend) encoding the two paired variables.
- Continuous-axis control with custom major and minor breaks
  (scale_x_continuous, scale_y_continuous).
- Full theme customisation (theme_classic base) with bilingual English and
  Chinese titling via CJK font families (Kai, Hei).
- Multi-panel composition of the two plots side by side with
  cowplot::plot_grid (ncol = 2).

### dumbbell_chart_ggplot2_degraded_land_italy.R
An independent example applying the dumbbell idiom to the area of degraded
mountain land over multiple years. Here the dumbbell is assembled from
primitives rather than geom_dumbbell: geom_segment and geom_line draw the
connectors while geom_point marks the yearly values, coloured by Year, with a
ColorBrewer qualitative palette (scale_fill_brewer, "Set1"). Uses reshape2 for
long/wide reshaping of the input table.

### load_packages.R
A convenience script that loads the author's full R plotting and analysis
environment (ggplot2, ggalt, cowplot, dplyr, tidyverse, RColorBrewer, viridis,
clustering and font packages, and others) in a single call.

## Methods and algorithms

- Dumbbell / connected-dot charts for paired before-after or A-vs-B comparison.
- Factor level control for stable categorical ordering (forcats-style levels).
- Grammar of graphics (ggplot2): additive geom, scale, theme composition.
- ColorBrewer qualitative palettes for categorical colour encoding.
- Multi-panel figure layout with cowplot graphical-object arrangement.
- Data ingestion and reshaping with read.csv and reshape2 (melt).

## Data sources

- Morphology.csv: morphometric observation points along 25 cross-profiles of the
  Mariana Trench, digitised in QGIS from bathymetric data (columns: profile,
  plate_pacif, plate_phill, plate_maria, plate_carol).
- Degraded_mountain.csv (external): area of degraded mountain land by type and
  year (columns: Item, Year, Value).

## Requirements

- R (>= 3.5)
- Packages: ggplot2, ggalt, cowplot, reshape2, RColorBrewer (plus the wider set
  loaded by load_packages.R)

Install the core packages with:

    install.packages(c("ggplot2", "ggalt", "cowplot", "reshape2", "RColorBrewer"))

## Usage

Place the required CSV in the working directory and run, e.g.:

    Rscript dumbbell_chart_ggalt_mariana_trench.R

## Author and citation

Polina Lemenkova
ORCID: https://orcid.org/0000-0002-5759-1089

If you use the Mariana Trench script, please cite:

Lemenkova, P. Statistical Analysis of the Mariana Trench Geomorphology Using R
Programming Language. Geodesy and Cartography 2019, 45(2), 57-84.
https://doi.org/10.3846/gac.2019.3785

## License

See the LICENSE file in this repository.
