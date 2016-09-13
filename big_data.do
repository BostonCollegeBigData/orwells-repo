
cd "\\appsstorage.bc.edu\appsdata\ClassData\ADEC743001"
ls
set more off

capture log using "F:\big data\log", text replace

/********************************************************************************
Import raw data and save as .dta format
********************************************************************************/
*smallest (0.3 GB)
import delimited "WORK_WCAS_DATA_CLASS.csv",clear
des
list in 1/2
saveold "F:\big data\WORK_WCAS_DATA_CLASS", replace

*large (4.4 GB)
import delimited "BC_SUBSCRIBER_SUMMARY.csv", rowrange (1:1000) clear
//import delimited "BC_SUBSCRIBER_SUMMARY.csv", clear
des
list in 1/2
saveold "F:\big data\BC_SUBSCRIBER_SUMMARY", replace

*largest (6.3 GB)
import delimited "BC_SUBSCRIBER_BEHAVIOR.csv", rowrange (1:10000) clear
//import delimited "BC_SUBSCRIBER_BEHAVIOR.csv", clear
des
list in 1/2
saveold "F:\big data\BC_SUBSCRIBER_BEHAVIOR", replace

log close 
