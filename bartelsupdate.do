** Replicate Bartels Figures from Chapter 3

use "/home/corwin/research/data/nes/timeseries/anes_timeseries_cdf_dta/anes_timeseries_cdf_stata12.dta" , clear

gen college = 0 if VCF0110>=1 & VCF0110<=3
replace college = 1 if VCF0110==4

gen income3cat = 1 if VCF0114>0 & VCF0114<=2
replace income3cat = 2 if VCF0114==3 
replace income3cat = 3 if VCF0114>=4 & VCF0114<=5

gen white = 1 if VCF0105a==1

gen partyid3cat = -1 if VCF0301>=1 & VCF0301<=2
replace partyid3cat = 0 if VCF0301>=3 & VCF0301<=5
replace partyid3cat = 1 if VCF0301>=6 & VCF0301<=7

gen partyid3catlean =  -1 if VCF0301>=1 & VCF0301<=3
replace partyid3catlean = 0 if VCF0301==4
replace partyid3catlean = 1 if VCF0301>=5 & VCF0301<=7

gen demrepvote = 1 if VCF0704==1
replace demrepvote = 0 if VCF0704==2

gen year= VCF0004


keep if white==1
drop if year==1948
drop if year==1954
drop if year==1958
drop if year==1962
drop if year==1966
drop if year==1970
drop if year==1974
drop if year==1978
drop if year==1982
drop if year==1986
drop if year==1990
drop if year==1994
drop if year==1998
drop if year==2002
drop if year==2006

** Figure 3.1

proportion demrepvote if college==0 [pw=VCF0009z], over(year)
proportion demrepvote if college==1 [pw=VCF0009z], over(year)

** Figure 3.2

proportion demrepvote if income3cat==1 [pw=VCF0009z], over(year)
proportion demrepvote if income3cat==3 [pw=VCF0009z], over(year)

** Figure 3.3 Lean


proportion partyid3catlean if income3cat==1 [pw=VCF0009z], over(year)
proportion partyid3catlean if income3cat==3 [pw=VCF0009z], over(year)

proportion partyid3catl if income3cat==1 [pw=VCF0009z], over(year)
proportion partyid3catl if income3cat==3 [pw=VCF0009z], over(year)

** For 2016

use "/home/corwin/research/data/nes/timeseries/anes_timeseries_2016_dta/anes_timeseries_2016.dta", clear

gen weight=V160101

gen white = 1 if V161310x==1
keep if white==1

gen college = 1 if V161270>=13 & V161270<=16
replace college = 0 if V161270>0 & V161270<13
replace college = 0 if V161270>89 & V161270<=95

gen income = V161361x
recode income -9=. -5=.
tab income [iw=V160101]
gen income3cat = 1 if income<=11
replace income3cat = 2 if income>11 & income<=20
replace income3cat = 3 if income>20 & income<=28

gen partyid3catlean = -1 if V161158x>=1 & V161158x<=3
replace partyid3catlean = 0 if V161158x==4
replace partyid3catlean = 1 if V161158x>=5 & V161158x<=7

gen demrepvote = 1 if V162034a==1
replace demrepvote = 0 if V162034a==2
replace demrepvote = 1 if V161027==1
replace demrepvote = 0 if V161027==2

** Figure 3.1

proportion demrepvote if college==0 [pw=weight]
proportion demrepvote if college==1 [pw=weight]

** Figure 3.2

proportion demrepvote if income3cat==1 [pw=weight]
proportion demrepvote if income3cat==3 [pw=weight]

** Figure 3.3 Lean


proportion partyid3catlean if income3cat==1 [pw=weight]
proportion partyid3catlean if income3cat==3 [pw=weight]

proportion partyid3catl if income3cat==1 [pw=VCF0009z], over(year)
proportion partyid3catl if income3cat==3 [pw=VCF0009z], over(year)
