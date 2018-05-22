select case_id, filing_date
from cases
where filing_date between '1950-01-01' and '1959-12-31'
order by filing_date asc
limit 3;

