select count(case_id) as ct, substr(filing_date,1,3)||'0s' as year
from cases
where cases.filing_date<>''
group by year
order by ct desc
limit 3;
