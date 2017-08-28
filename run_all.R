# TCI index and analyses
#
#

# get assumptions
source('assumptions.R')

# outputs directory (set to one per day!)
now <- Sys.time()
dname <- paste0( 'run_', strftime(now, format = "%Y%m%d"))
outdir <- file.path( 'outputs', dname )
dir.create(outdir)

# view assumptions / parameters
print(ls.str())

# 1. compile data and calculate TCI scores

source('code/0_getData.R')

# 2. Analyses 
