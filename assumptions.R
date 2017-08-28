#
# Assumptions and parameters used for constructing the TCI index
#


# minimum number of indicators a country must have to be included

min.num.inds <- 7

# chosen indicators

indicators <- list(

  # Transboundary Water
  "transboundary_water" = list( fname = "transboundary_water.csv"),

  # Bilateral climate weighted FDI
  "fdi" = list (fname = "fdi.csv"),
  
  # Remittances
  "remittances" = list (fname = "remittances.csv"),

  # Openness to asylum  
  "asylum" = list (fname = "refugees.csv"),
  
  # Migration from climate vulnerable countries
  "migration" = list (fname = "migration.csv"),
  
  # Trade openness
  "trade_openness" = list (fname = "trade_openness.csv"),
  
  # Cereal import dependency
  "cereal" = list (fname = "cereal.csv", title = "Cereal Import Dependency"),

  # Embedded water risk
  "water_risk" = list (fname = "embedded_water.csv"),

  # KOF Globalization Index
  "kof" = list (fname = "kof_globalization.csv")

)

# number of quantile 'bins' to use for generating indicator scores
num.quantiles <- 10

# Ranking function to calculate indicator scores
 score <- function( values , bins ){
    
    # apply a raw ranking of values
    rnk <- rank(values , ties = 'min', na.last = 'keep')
    
    # note: The ties = "min" parameter ensures that countries with the same
    #       value receive the same rank.
    #       The na.last='keep' maintains missing values in their proper place.
    
    # bin boundaries
    bin.bounds = quantile(unique(rnk), probs = 0:bins/bins, na.rm= TRUE)
    
    #return a vector of scores
    cut( rnk, bin.bounds , include.lowest =TRUE, labels = FALSE)
  
  }

