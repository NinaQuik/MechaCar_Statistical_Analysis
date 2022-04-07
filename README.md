# MechaCar_Statistical_Analysis

## Overview
Reviews manufacturing production data for a fictional car company to determine issues that may be blocking progress.

- Creates a linear model that predicts the mpg of MechaCar prototypes using several variables from the [MechaCar_mpg.csv](MechaCar_mpg.csv) file which contains 50 prototype MechaCars.
- Collects summary statistics on the PSI from three manufacturing lots in [Suspension_Coil.csv](Suspension_Coil.csv)
- Runs t-tests to determine if the manufacturing lots are statistically different than the mean population.
- Designs a statistical study to XYZ.

### Tools
- R version 4.1.3
  - Tidyverse and DPLYR packages
- RStudio

## Linear Regression to Predict MPG
Using R's summary() and lm() functions, a multiple linear regression analysis was performed on five car variables to predict MPG.


![Linear_Regression](/Resources/linearRegression.png)

1. **vehicle_length** and **ground_clearance** are the variables that are statistically unlikely to provide random amounts of variance to the linear model. With p-values of 2.60e-12 and 5.21e-08 respectively, their probability of contributing to the null hypothesis is much below an assumed signignifcance level of .05%.  Meaning that vehicle length and ground clearance are the two variables most likely to influence MPG.  
2. The slope of the linear model is considered to be non zero. The p-value is 5.33e-11 ( .0000000000535 ) which is much smaller than the assumed significance level of .05% and suggests that we should neglect the null hypothesis (zero slope). The equation of the line would look like: 
``` mpg = (6.267)vehicle_length + (0.0012)vehicle_weight + (0.068)spoiler_angle + (3.55)ground_clearance + (-3.411)AWD + (-104.0)```
3. The r-squared value for this linear model is .7149 which means that roughly 71% of the data fits this regression model and that 71% of the variability of MPG can be predicted by the variables in this study. Although not 100% effective at predicting mpg, this model is better than random 50% chances.

## Summary Statistics on Suspension Coils

Creats a total summary and lot summary breakdown for PSI metrics using R's summarize() function.

#### Overall Summary (all lots)
![total_summary](/Resources/total_summary.png)

The design specifications for the MechaCar suspension coils dictate that the variance of the suspension coils must not exceed 100 pounds per square inch. Across the board, MechaCar suspension coils have a mean of 1498.78 compared to a population mean of 1500.  The Variance for MechaCar as a whole is 62.29 and falls under the 100 psi variance requirement.  However, digging deaper into the data and summarizing variance by lot number one can see that there are production issues with lot 3.

#### Per Lot Summary
![lot_summary](/Resources/lot_summary.png)

Lot 3 does not fall within the 100 PSI variance and shows a variance of 170.  This pinpoints a place to begin investigation.
