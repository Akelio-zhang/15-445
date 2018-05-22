---Print the county name and number of cases in that particular county. Sort the counties by the number of cases in descending order, and break ties by ordering them in ascending order with respect to the county name. Report only the top 3 counties with the maximum number of cases. The search string for the appropriate column is %RECKLESS%. Ensure that you only fetch the cases whose county name is not empty.


select cases.violation_county, count(cases.case_id) as ct
from charges
left join cases on cases.case_id=charges.case_id
where cases.violation_county<>''
and charges.description like '%RECKLESS%'
group by cases.violation_county
order by ct desc, cases.violation_county asc
limit 3;
