select count(case_id)*100.0/(select count(*) from cases)
from cases
where status='Case Closed Statistically';
