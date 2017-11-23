

#data is the SUA of all Countries
library(data.table)

data=readRDS("Data/SUA_data.rds")

create_FBS_Tool = function(data){
 
  

  
setnames(data,c("geographicAreaM49" ,"geographicAreaM49_description", "measuredElement" , "measuredElement_description","measuredItemCPC",              
"measuredItemCPC_description" ,"timePointYears" ,"Value" ,"translatedFlag"),
c("CountryM49","Country", "ElementCode","Element", "CPCCode", "Commodity", "Year", "Value", "Flag"))

  
  
countryData=lapply(unique(data[,CountryM49]), function(x){
   
  subset(data, CountryM49 == x)
  
}) 
  
country=unique(countryData[[1]][,Country])

ff=countryData[[1]]

save(object = ff, file = "Data/Malawi.rda" ) 
  
  
  malawi=load(file = "Data/Malawi.rda")
  
  attach(malawi)
  
  
  
  # save(object = sua_world_long, file = paste("FBSTools/", country, "/Data", sep = "")
  # )  
  
  
  
  
  
  
}