WITH year_table(cid, fyear) AS
(
SELECT cases.case_id, strftime('%Y',filing_date)
FROM cases, charges
WHERE cases.case_id=charges.case_id
and charges.disposition='Guilty'
and filing_date <> ''
),
age_table(cid, age) AS
(
SELECT cases.case_id, strftime('%Y.%d%m',cases.filing_date)-strftime('%Y.%d%m',parties.dob) AS age
FROM cases, parties
WHERE cases.case_id=parties.case_id
and parties.name<>''
and parties.dob is not NULL
and parties.type='Defendant'
and age > 0 and age < 100
)
SELECT year_table.fyear, AVG(age_table.age) 
FROM year_table, age_table
WHERE year_table.cid = age_table.cid
GROUP BY year_table.fyear
ORDER BY year_table.fyear DESC
limit 5;
