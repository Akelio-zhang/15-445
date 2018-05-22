with disposition_table as
(
select race, charges.disposition, parties.case_id as case_id
from charges, parties
where charges.case_id = parties.case_id
and race <> ''
and disposition in ('Guilty', 'Not Guilty')
and race in ('African American', 'Caucasian')
),
race_aggregate_table as
(
select disposition_table.race as rc, count(case_id) as case_count
from disposition_table
group by disposition_table.race
),
race_dis_aggregate_table as
(
select race, disposition, count(case_id) as case_count
from disposition_table
group by race, disposition
)
select race, race_dis_aggregate_table.disposition,
(race_dis_aggregate_table.case_count * 100.0) / race_aggregate_table.case_count 
from race_dis_aggregate_table, race_aggregate_table
where race_dis_aggregate_table.race = race_aggregate_table.rc
;

