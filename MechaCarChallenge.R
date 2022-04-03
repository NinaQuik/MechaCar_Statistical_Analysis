library(dplyr)

# Load MechaCar_mpg.csv file into a dataframe
mechaCar <- read.csv("MechaCar_mpg.csv")
#head(mechaCar)

#Perform Linear Regression using lm()
summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,data=mechaCar))

# Load Suspension_Coil.csv file into a dataframe
suspensionCoil <- read.csv("Suspension_Coil.csv")
head(suspensionCoil)

#Summary for suspension coil's PSI column
total_summary <- suspensionCoil %>% summarize(Mean=mean(PSI), Median=median(PSI), Variance=var(PSI),SD=sd(PSI))
#head(total_summary)

# Summary of PSI column by manufacturing lot
lot_summary <- suspensionCoil %>% group_by(Manufacturing_Lot) %>% summarize(Mean=mean(PSI), Median=median(PSI), Variance=var(PSI),SD=sd(PSI))

# Use T-Test to see if the PSI across all lots is statistically different from a population mean of 1,500
t.test(suspensionCoil$PSI, mu=1500)

# Use T-Test for each lot to see if they are statistically different from a population mean of 1,500
t.test(subset(suspensionCoil, Manufacturing_Lot == "Lot1")$PSI, mu=1500)
t.test(subset(suspensionCoil, Manufacturing_Lot == "Lot2")$PSI, mu=1500)
t.test(subset(suspensionCoil, Manufacturing_Lot == "Lot3")$PSI, mu=1500)
