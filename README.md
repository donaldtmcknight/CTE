# CTE: Constant Temperature Equivalent

An R package for calculating the Constant Temperature Equivalent (CTE) for nest incubation data

## Descritpion

This package provides a simple function (CTE) for calculating CTE based on the formulas developed in Georges A (1989) Female turtles from hot nests: is it duration of incubation or proportion of development at high temperatures that matters? Oecologia 81:323–328.

See the vignette for full details on the formulas and search algorithms.

## Installation

The current stable version is available on CRAN
```
install.packages("CTE")
```

Alternatively, to install from GitHub, copy and paste the code below to install the package

```
install.packages("devtools") #Installs devtools (if not already installed)
devtools::install_github("donaldtmcknight/CTE") #Installs CTE
```

## Running the package

The pacakge includes a single function: CTE.

It requires three pieces of data:

* *M* = mean temperature
* *R* = the maximum deviation of temperatures from *M* (e.g., if the range of temperatures is 14‒16 and *M* = 20, then *R* = 6)
* *T*<sub>0</sub> = the temperature below which no development occurs (this value should be based on a general knowledge of the species being studied)
 
You can optionally include *t*, a vlue between 0 and 2pi which sets the starting seed for the iterative calcuations, and max.it, which sets the maximum number of iterations the function will try (default is 10,000).

Example:

```
CTE(M=20, R = 6, T0=10)
```

## Citaiton

Cite as: McKnight, D.T. 2026. CTE: Constant Temperature Equivalent. R package version 0.1.3
