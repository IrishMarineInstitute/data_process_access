#install.packages("rerddap")
library(rerddap)

# See all the Erddap servers
erddapServers <- rerddap::servers()
#View(erddapServers)

# See which datasets are available on the MI server - we can get the URL from the previous step if we don't already know it
MIURL <- "https://erddap.marine.ie/erddap/"
MIdatasets <- rerddap::ed_datasets(url = MIURL)
#View(MIdatasets)

# Download the UWTV data - using the datasetID we found in MIdatasets (see previous step)
datasetID <- 'nephrops_uwtv_surveys'
dataInfo <- rerddap::info(datasetID, url = MIURL)
# Set some date parameters
dateFrom <- '2024-01-01T00:00:00Z'
dateTo <- '2025-01-01T00:00:00Z'
# Get the data
myData <- rerddap::tabledap(dataInfo, paste0('time>=',dateFrom), paste0('time<=',dateTo))
View(myData)

