SELECT zip, count(charges.case_id) as cnt 
FROM parties, charges
WHERE parties.case_id=charges.case_id 
and parties.zip<>'' 
GROUP BY zip 
ORDER BY cnt DESC
limit 3;

