# MechaCar_Statistical_Analysis

## Overview
Reviews manufacturing data for a fictional car company to determine issues that may be blocking production progress.

- Creates a linear model that predicts the mpg of MechaCar prototypes using several variables from the [MechaCar_mpg.csv](MechaCar_mpg.csv) file which contains 50 prototype MechaCars.
- Collects summary statistics on the PSI from three manufacturing lots in [Suspension_Coil.csv](Suspension_Coil.csv)
- Runs t-tests to determine if the manufacturing lots are statistically different than the mean population.
- Designs a statistical study to compare MechaCar pricing by variable to competitor pricing.

### Tools
- R version 4.1.3
  - Tidyverse and DPLYR packages
- RStudio

## Linear Regression to Predict MPG
Using R's summary() and lm() functions, a multiple linear regression analysis was performed on five car variables to predict MPG.


![Linear_Regression](/Resources/linearRegression.png)

1. **vehicle_length** and **ground_clearance** are the variables that are statistically unlikely to provide random amounts of variance to the linear model. With p-values of 2.60e-12 and 5.21e-08 respectively, their probability of contributing to the null hypothesis is much below an assumed signignifcance level of .05%.  Meaning that vehicle length and ground clearance are the two variables most likely to influence MPG.  
2. The slope of the linear model is considered to be non zero. The p-value is 5.33e-11 ( .0000000000535 ) which is much smaller than the assumed significance level of .05% and suggests that we should reject the null hypothesis (zero slope). The equation of the line would look like: 
``` mpg = (6.267)vehicle_length + (0.0012)vehicle_weight + (0.068)spoiler_angle + (3.55)ground_clearance + (-3.411)AWD + (-104.0)```
3. The r-squared value for this linear model is .7149 which means that roughly 71% of the data fits this regression model and that 71% of the variability of MPG can be predicted by the variables in this study. Although not 100% effective at predicting mpg, this model is better than random 50/50.

## Summary Statistics on Suspension Coils

Creats a total summary and lot summary breakdown for PSI metrics using R's summarize() function.

#### Overall Summary (all lots)
![total_summary](/Resources/total_summary.png)

The design specifications for the MechaCar suspension coils dictate that the variance of the suspension coils must not exceed 100 pounds per square inch. Across the board, MechaCar suspension coils have a mean of 1498.78 and a standard deviation of 7.89.  The variance for MechaCar suspension coil PSI as a whole is 62.29 and falls under the 100 psi variance requirement.  However, digging deaper into the data and summarizing variance by lot number one can see that there are production issues with lot 3.

#### Per Lot Summary
![lot_summary](/Resources/lot_summary.png)

Lot 3 does not fall within the 100 PSI variance acceptability and shows a variance of 170.  This pinpoints a place to begin further investigation.

## T-Tests on Suspension Coils
Uses R's t-test() function see if the PSI across all lots is statistically different from a population mean of 1,500 pounds per square inch.

#### T-Test across all manufacturing lots
![ttest_total](/Resources/t_test.png)

Across all manufacturing lots, the mean PSI for suspension coils is 1498.78 with a p-value of 0.06.  Because a p-value of .06 is greater than the assumed  significance level of .05, there is not enough evidence to reject the null hypothesis. This means that statistically, the PSI of MechaCar suspension coils is not divergent from a population mean of 1,500 PSI.

#### T-Tests per lot

![lots_ttest](/Resources/lot_ttest.png)

However, by performing t-tests against each individual lot, we can see that lot 3, with a mean of 1496.14 PSI and p-value of .04 fits the alternative hypothesis. Lot 3 has significant difference between mean PSI and the population mean PSI.  

Lots 1 and Lots 2 have p-values of 1 and .607 respectively.  Lot 1 most closely matches a mean of 1500 PSI.

## Study Design: MechaCar vs Competition
Metrics that are usefull to a consumer include cost, fuel efficiency, horse power, maintenance cost and safety ratings. The MechaCar company will want to price cars at the optimal level to maximize revenue, however, the price that customers will pay is dependent on independent variables like MPG, Safety, and features (carrying capacity, horsepower, AWD) compared to those of the competition.

#### Metrics
To understand the ideal price point for mechaCars it would be good to sample the Price vs. MPG,  Price vs. Safety Rating and Price vs. Horse Power compared to the competition. 
First we would want to bucket the cars into different classes - ex, compact, SUV, midsize, etc.
- For the purposes of this exercise we'll start with class = SUV.
- The independent metrics that we would collect are MPG, Average Maintenance Cost, AWD, Safety Rating.  
- The dependent metric is price.
- We would limit cars to the current year, or current year and previous year.

#### Data Sets
We would then determine which competitors to compare against and retrieve a dataset containing those metrics. If this data isn't readily available (ex, through Kelly Blue Book), then webscraping could be performed.

### Statistical Tests
- The null hypothesis is that the price for MechCar SUVs are priced similarly to the competition for key factors such as MPG, Maintenance, AWD, Features, Safety Rating.
- The Alternative hypothesis is that the price for MechaCar SUVs are priced below or above the competition for key factors such as MPG, Maintenance, AWD, Features, Safety Rating.

Assuming the sample size is large, Multiple two sample T-tests could be performed against numerical data like MPG, Safety Rating or Maintenance Costs.
A chi-squared test could be used to compare features (AWD, Horsepower, Interior, entertainment system) to price.

