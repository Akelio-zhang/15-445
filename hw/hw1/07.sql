select parties.name, count(distinct cases.violation_county) as ct
from parties inner join cases on parties.case_id=cases.case_id
where parties.name<>''
and parties.type='Defendant'
group by parties.name
order by ct desc
limit 3;
