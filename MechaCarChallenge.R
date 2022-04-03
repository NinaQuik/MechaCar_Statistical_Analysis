library(dplyr)

# Load MechcCar_mpg.csv file into a dataframe
mechaCar <- read.csv("MechaCar_mpg.csv")
#head(mechaCar)

#Perform Linear Regression using lm()
summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,data=mechaCar))

# Load Suspension_Coil.csv file into a dataframe
suspensionCoil <- read.csv("Suspension_Coil.csv")
head(suspensionCoil)

#Summary for suspension coil's PSI column
total_summary <- suspensionCoil %>% summarize(Mean=mean(PSI), Median=median(PSI), Variance=var(PSI),SD=sd(PSI))
head(total_summary)

# Summary of PSI column by manufacturing lot

lot_summary <- suspensionCoil %>% group_by(Manufacturing_Lot) %>% summarize(Mean=mean(PSI), Median=median(PSI), Variance=var(PSI),SD=sd(PSI))
