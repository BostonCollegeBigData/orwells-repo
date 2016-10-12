set more off

drop if click=="Mac OS X 10.1"
destring (click), gen(clicked)
drop click
rename clicked click
drop if shared =="Mac OS X"
destring (shared), replace
destring (number_of_clicks), replace
drop if bounce=="Android"|bounce=="iOS"
destring (bounce), replace
encode (is_deceased), gen(deceased)
replace deceased=deceased-1

foreach v in no_affinity_email no_blast_email no_chapter_email no_donor_email no_evt_week_email no_general_email no_school_email no_solic_email no_spirit_email no_survey_email {
encode (`v'), gen(`v'_n)
}

split date_sent, p(" ")

//for longer time characters
gen moreday=substr(date_sent2,-2,2)
gen moretime=substr(date_sent2,1,8)
gen longerdate=moretime+moreday
drop moreday moretime

//for shorter characters
gen lessday=substr(date_sent3,-2,2)
gen lesstime=substr(date_sent3,1,7)
gen smallertime=lesstime+lessday
drop lessday lesstime

replace smallertime=longerdate if missing(smallertime)
drop longerdate

drop date_sent

drop no_affinity_email no_blast_email no_chapter_email no_donor_email no_evt_week_email no_general_email no_school_email no_solic_email no_spirit_email no_survey_email

rename smallertime timesent
rename date_sent1 date_sent

//convert open_date to readable date
split open_date, p(" ")

//for longer time characters
gen moreday=substr(open_date2,-2,2)
gen moretime=substr(open_date2,1,8)
gen longerdate=moretime+moreday
drop moreday moretime

//for shorter characters
gen lessday=substr(open_date3,-2,2)
gen lesstime=substr(open_date3,1,7)
gen smallertime=lesstime+lessday
drop lessday lesstime

replace smallertime=longerdate if missing(smallertime)

drop open_date
rename open_date1 open_date
rename smallertime opentime

//frequency open/sent click/open
//emails per year over next year/month over month
//segmentation

gen date_sent1 = date(date_sent, "MDY")
format date_sent1 %td
drop date_sent

gen open_date1 = date(open_date, "MDY")
format open_date1 %td
drop open_date
rename open_date1 open_date

//times
gen timesent_1 = clock(timesent, "hms")
format timesent_1 %tc
drop timesent

drop date_sent2 date_sent3 open_date2 open_date3 longerdate

gen opentime_1 = clock(opentime, "hms")
format opentime_1 %tc
drop opentime
rename opentime_1 opentime
rename date_sent1 date_sent

//month to month
di date("20140101","YMD")
di date("20140131","YMD")
drop if date_sent<19783|date_sent>19813
sum date_sent, detail
di date("20140201","YMD")
di date("20140228","YMD")
drop if date_sent<19783|date_sent>19813
sum date_sent, detail
use "L:\big data\newww.dta", clear
di date("20140301","YMD")
di date("20140331","YMD")
drop if date_sent<19814|date_sent>19843
sum date_sent, detail
use "L:\big data\newww.dta", clear
di date("20140401","YMD")
di date("20140430","YMD")
drop if date_sent<19844|date_sent>19874
sum date_sent, detail
use "L:\big data\newww.dta", clear
di date("20140501","YMD")
di date("20140531","YMD")
drop if date_sent<19844|date_sent>19874
sum date_sent, detail
use "L:\big data\newww.dta", clear
di date("20140601","YMD")
di date("20140630","YMD")
drop if date_sent<19875|date_sent>19904
sum date_sent, detail
use "L:\big data\newww.dta", clear
di date("20140701","YMD")
di date("20140731","YMD")
drop if date_sent<19905|date_sent>19935
sum date_sent, detail
use "L:\big data\newww.dta", clear
di date("20140801","YMD")
di date("20140831","YMD")
drop if date_sent<19936|date_sent>19966
sum date_sent, detail
di date("20140901","YMD")
di date("20140930","YMD")
drop if date_sent<19967|date_sent>19996
sum date_sent, detail
use "L:\big data\newww.dta", clear
di date("20141001","YMD")
di date("20141031","YMD")
drop if date_sent<19997|date_sent>20027
sum date_sent, detail
use "L:\big data\newww.dta", clear
di date("20141101","YMD")
di date("20141130","YMD")
drop if date_sent<20028|date_sent>20057
sum date_sent, detail
use "L:\big data\newww.dta", clear
di date("20141201","YMD")
di date("20141231","YMD")
drop if date_sent<20058|date_sent>20088
sum date_sent, detail
use "L:\big data\newww.dta", clear
di date("20150101","YMD")
di date("20150131","YMD")
drop if date_sent<20089|date_sent>20119
sum date_sent, detail
use "L:\big data\newww.dta", clear
di date("20150201","YMD")
di date("20150228","YMD")
drop if date_sent<20120|date_sent>20147
sum date_sent, detail
di date("20140101","YMD")
di date("20140131","YMD")
drop if date_sent<19724|date_sent>19754
sum date_sent, detail
sum date_sent, detail
di date("20150301","YMD")
use "L:\big data\newww.dta", clear
di date("20150301","YMD")
di date("20150331","YMD")
drop if date_sent<20148|date_sent>20178
sum date_sent, detail
use "L:\big data\newww.dta", clear
di date("20150401","YMD")
di date("20150430","YMD")
drop if date_sent<20179|date_sent>20208
sum date_sent, detail
use "L:\big data\newww.dta", clear
di date("20150501","YMD")
di date("20150531","YMD")
drop if date_sent<20209|date_sent>20239
sum date_sent, detail
di date("20150601","YMD")
di date("20150630","YMD")
drop if date_sent<20240|date_sent>20269
sum date_sent, detail
use "L:\big data\newww.dta", clear
di date("20150601","YMD")
di date("20150630","YMD")
drop if date_sent<20240|date_sent>20269
sum date_sent, detail
use "L:\big data\newww.dta", clear
di date("20150701","YMD")
di date("20150731","YMD")
drop if date_sent<20270|date_sent>20300
sum date_sent, detail
use "L:\big data\newww.dta", clear
di date("20150801","YMD")
di date("20150831","YMD")
drop if date_sent<20301|date_sent>20331
sum date_sent, detail
use "L:\big data\newww.dta", clear
di date("20150901","YMD")
di date("20150930","YMD")
drop if date_sent<20332|date_sent>20361
use "L:\big data\newww.dta", clear
di date("20150901","YMD")
di date("20150930","YMD")
drop if date_sent<20332|date_sent>20361
sum date_sent, detail
use "L:\big data\newww.dta", clear
di date("20151001","YMD")
di date("20151031","YMD")
drop if date_sent<20362|date_sent>20392
sum date_sent, detail
di date("20151101","YMD")
di date("20151130","YMD")
drop if date_sent<20393|date_sent>20422
sum date_sent, detail
use "L:\big data\newww.dta", clear
di date("20151201","YMD")
di date("20151231","YMD")
drop if date_sent<20393|date_sent>20422
sum date_sent, detail

