-- 1101                Number of persons by location state
--insert into @results_schema.heracles_results (cohort_definition_id, analysis_id, stratum_1, count_value)
select c1.cohort_definition_id,
  1101 as analysis_id,
  l1.state as stratum_1,
  cast( '' as varchar(1) ) as stratum_2, cast( '' as varchar(1) ) as stratum_3, cast( '' as varchar(1) ) as stratum_4,
  COUNT_BIG(person_id) as count_value
into #results_1101
from @CDM_schema.person p1
inner join #HERACLES_cohort_subject c1
on p1.person_id = c1.subject_id
inner join @CDM_schema.location l1
on p1.location_id = l1.location_id
where p1.location_id is not null
and l1.state is not null
group by c1.cohort_definition_id,
l1.state;