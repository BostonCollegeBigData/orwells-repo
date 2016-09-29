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

//year over year
di date("20140601","YMD")
di date("20150531","YMD")
drop if date_sent<19875|date_sent>20239
sum date_sent, detail
di date("20150601","YMD")
di date("20160531","YMD")
drop if date_sent<20240|date_sent>20605
sum date_sent,detail

//for tableau
gen homecity=home_city+" "
gen homeplace=homecity+home_state

keep if home_state=="AL"|home_state=="AK"|home_state=="AZ"|home_state=="AR"|home_state=="CA"|home_state=="CO"|home_state=="CT"|home_state=="DE"|home_state=="FL"|home_state=="GA"|home_state=="HI"|home_state=="ID"|home_state=="IL"|home_state=="IN"|home_state=="IA"|home_state=="KS"|home_state=="KY"|home_state=="LA"|home_state=="ME"|home_state=="MD"|home_state=="MA"|home_state=="MI"|home_state=="MN"|home_state=="MS"|home_state=="MO"|home_state=="MT"|home_state=="NE"|home_state=="NV"|home_state=="NH"|home_state=="NJ"|home_state=="NM"|home_state=="NY"|home_state=="NC"|home_state=="ND"|home_state=="OH"|home_state=="OK"|home_state=="OR"|home_state=="PA"|home_state=="RI"|home_state=="SC"|home_state=="SD"|home_state=="TN"|home_state=="TX"|home_state=="UT"|home_state=="VT"|home_state=="VA"|home_state=="WA"|home_state=="WV"|home_state=="WI"|home_state=="WY"


//characters in email subject
gen charemail=length(email_subject)

//what fraction give of the oldies?
//give at a higher frequency
//hyperlink to do file
//run emails sent on full dataset
//ltw characters

//homework dataset to run regression on. 50-100 variables
