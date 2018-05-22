WITH att_dis(att,case_id,dis) AS
(
SELECT attorneys.name, attorneys.case_id, charges.disposition
FROM attorneys, charges
WHERE attorneys.case_id = charges.case_id
and attorneys.name<>''
),
att_case_cnt(att, cnt) AS
(
SELECT att, count(case_id) as cnt
FROM att_dis
GROUP BY att
HAVING cnt > 100
)
SELECT att_dis.att, att_case_cnt.cnt, count(case_id) * 100.0 / att_case_cnt.cnt AS succ_ratio
FROM att_dis, att_case_cnt
WHERE att_dis.att = att_case_cnt.att
and att_dis.dis = 'Not Guilty'
GROUP BY att_dis.att
ORDER BY succ_ratio DESC
LIMIT 1 OFFSET 6;
