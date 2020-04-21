## SITE ACCESS ##
MOST_RECENT_DAILY_CREATE_DATE = Daily.all.pluck(:created_at).sort.last.to_date

## TIME ##
TODAY = Date.today

YEAR = TODAY.year
FIRST_DAY_OF_YEAR = Date.new(YEAR,01,01)
LAST_DAY_OF_YEAR = Date.new(YEAR,12,31)

DAYS_IN_THIS_YEAR = LAST_DAY_OF_YEAR.yday
YEAR_DAY = TODAY.yday

WEEKS_IN_THIS_YEAR = LAST_DAY_OF_YEAR.cweek
YEAR_WEEK = TODAY.cweek

## NOOKS ##
NOOKS_BIRTHDAY = Date.new(2020,01,17)
NOOKS_AGE = "Nooks is #{((Date.today - Date.new(2020,01,17)).to_i / 7.0).round(1)} weeks old"