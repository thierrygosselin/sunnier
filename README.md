# sunnier
[![Travis-CI Build Status](https://travis-ci.org/thierrygosselin/sunnier.svg?branch=master)](https://travis-ci.org/thierrygosselin/sunnier)
[![AppVeyor Build Status](https://ci.appveyor.com/api/projects/status/github/thierrygosselin/sunnier?branch=master&svg=true)](https://ci.appveyor.com/project/thierrygosselin/sunnier)
[![CRAN_Status_Badge](http://www.r-pkg.org/badges/version/sunnier)](https://cran.r-project.org/package=sunnier)
[![DOI](https://zenodo.org/badge/doi/10.5281/zenodo.57039.svg)](http://dx.doi.org/10.5281/zenodo.57039)



The goal of this little R package is to make your day a little *sunnier* while working with 
cloud compute engine like 
[Amazon](https://console.aws.amazon.com/ec2) and 
[Google](https://cloud.google.com), inside R.

## Installation
To try out the dev version of **sunnier**, follow the 2 steps below:

**Step 1:** Install or load the package **devtools**
```r
if (!require("devtools")) install.packages("devtools") # to install
```

**Step 2:** Install **sunnier**
```r
devtools::install_github("thierrygosselin/sunnier") # to install without vignettes
library(sunnier) # to load
```
