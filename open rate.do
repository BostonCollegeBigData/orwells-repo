
//date management
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

drop opendate2 newdate2 date_sent_redef open_date_redef click_date_redef newdate
drop date_sent2 date_sent3 open_date2 open_date3 longerdate 

gen opentime_1 = clock(opentime, "hms")
format opentime_1 %tc
drop opentime
rename opentime_1 opentime
rename date_sent1 date_sent

////////////////////////////////////////////////////
///////////////////email open rate//////////////////
////////////////////////////////////////////////////

//fiscal year 2015 by using
di date("20140601","YMD")
di date("20150531","YMD")
tab email_open if date_sent>=19875 & date_sent<=20239

//fiscal year 2016 by using
di date("20150601","YMD")
di date("20160531","YMD")
tab email_open if date_sent>=20240 & date_sent<=20605

