  use LPP_test

  select 
	tab.dimension_1
   ,MAP.correct_dimension_2 as [dimension_2]
   , ISNULL(tab.measure_1,0) as [measure_1] 
   , ISNULL(tab.measure_2,0) as [measure_2]
  
  from
  (
  select A.dimension_1 as [dimension_1], A.dimension_2 as [dimension_2], A.measure_1 as [measure_1], NULL as [measure_2] from [dbo].TableA as A
  union 
  select B.dimension_1 as [dimension_1], B.dimension_2 as [dimension_2], NULL as [measure_1], B.measure_2 as [measure_2] from [dbo].TableB as B
 ) as tab
 left join [dbo].TableMAP as MAP on MAP.dimension_1=tab.dimension_1

 group by tab.dimension_1,tab.dimension_2,  tab.measure_1, tab.measure_2,MAP.correct_dimension_2
 

