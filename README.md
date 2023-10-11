## *Examining the effect of environmental variability on the viability of endangered Steller sea lions using an integrated population model* 

#### Amanda J. Warlick, Devin S. Johnson, Katie L. Sweeney, Tom S. Gelatt, Sarah J. Converse

##### Please contact Amanda Warlick at amanda.warlick@noaa.gov for questions about the code or data.

##### Secondary contact: Sarah Converse (sconver@usgs.gov)

________________________________________________________________________________

## Abstract

Understanding spatio-temporal variability in demography and the influence of environmental conditions on that variability offers insight into the factors underlying the dynamics and viability of wildlife populations. This is particularly true for species with divergent demographic patterns across large geographic areas. The contrasting abundance trends observed across the range of Steller sea lions (*Eumetopias jubatus*) have been studied extensively but remain poorly understood, with much of the research suggesting that the primary drivers of localized population dynamics vary over time and space. We developed a Bayesian integrated population model for the endangered western distinct population segment of Steller sea lions in Alaska. The model combines mark-recapture and count survey data from 2000-2021 to estimate demographic rates, abundance trends, and effects of environmental variability on population growth and viability. Our results reveal declining age-specific survival probabilities in the latter part of the study period and highlight demographic differences between subregions, including reduced pup survival in the central Aleutian Islands and reduced yearling survival in the central and western Aleutian Islands. Range-wide abundance increased by 1.7% yr-1 (95% credible interval: 0.14; 3.4%) over the study period, with variable growth rates across the range. We estimated a positive annual growth rate of 3.0% (1.1; 5.1%) yr-1 east of Samalga Pass, a negative growth rate of -2.1% (-4.6; 0.5%) yr-1 west of Samalga Pass, and an overall low probability of local extirpation (<2%) in 100 years even in subregions experiencing continued decline. The effect of environmental variability on population growth rates varied depending on subpopulation size and age-specific vital rates and was strongest in the western Aleutian Islands (area of greatest decline). Our model framework represents an improvement upon existing approaches for estimating abundance, accounts for environmental variability within the viability analysis, and can facilitate evaluating the efficacy of conservation actions and progress toward recovery goals across the species’ range. 

### Table of Contents 

#### [Scripts](./scripts)

Contains the script to process raw data and run all analyses. 

-- SSL_wDPS_IPM_data.Rmd processes mark-resight observations into annual resightings histories.  
-- SSL_wDPS_IPM.Rmd loads in processed data and runs estimation models and viability simulation projections including environmental variability scenarios. 
 
#### [Data](./Data) 

Contains raw and processed data necessary for running the model, including mark-resight data, count survey, and covariate data. 

#### [Results](./results)

Contains raw and processed results.  

#### Required Packages and Versions Used 

Hmisc_4.5-0       
ggstance_0.3.5   
reshape2_1.4.4    
truncnorm_1.0-8   
DescTools_0.99.43 c
cowplot_1.1.1     
demogR_0.6.0     
gtools_3.9.2
knitr_1.31        
stringr_1.4.0    
purrr_0.3.4       
ggplot2_3.3.6     
tidyverse_1.3.1   
dplyr_1.0.5      
readr_2.0.1       
here_1.0.1        
tidyr_1.1.3       
lubridate_1.7.10 

### Details of Article 

Warlick AJ, DS Johnson, TS Gelatt, and SJ Converse. 2022. Examining the effect of environmental variability on the viability of endangered Steller sea lions using an integrated population model. Animal Conservation. https://doi.org/10.3354/esr01282

### How to Use this Repository 

(Provide some guidance here to users, is there an order in which they should run things, for example?)  
