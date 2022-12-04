
/*check how many rows*/
select count(*) from WaterbodyClassifications

/*shows first 10 rows of dataset*/
select top 10 * from WaterbodyClassifications 

/*select columns needed*/
select Waterbody_Type
       ,Name
	   ,Description
	   ,Basin
	   ,Water_Quality_Class 
from WaterbodyClassifications

/*check for null values*/
select * from WaterbodyClassifications 
where Waterbody_Type is NULL
or Name is Null
or Description is NULL
or Basin is NULL
or Water_Quality_Class is NULL

/*filter out columns with null value*/
select Waterbody_Type
      ,Name
	  ,Basin
	  ,Water_Quality_Class 
from WaterbodyClassifications 
where Description IS NOT NULL


/*check for dupicates*/
 with cte_dupl as (
      select *, 
	  row_number() over(partition by name order by name) duplicate
	  from WaterbodyClassifications
	  )

select * from cte_dupl where duplicate > 1


/*how many waterbody type(ponds, estuary, etc) are there in NY*/
select Waterbody_Type, count(*) as Total
from WaterbodyClassifications 
group by Waterbody_Type;

/*what are the basin types in Ny*/
select Basin, count(*) as Total
from WaterbodyClassifications 
group by Basin

/*what are the top 10 basin types in Ny*/
select top (10) Basin, count(*) as Total
from WaterbodyClassifications 
group by Basin 
order by count(*) desc 


/*what are the basin types with water quality A in Ny*/
select Basin, Water_Quality_Class, count(*) as Total
from WaterbodyClassifications 
where Water_Quality_Class = 'A'
group by Basin, Water_Quality_Class

/*what is the water quality for specific pond, Lake Forest*/
select Name, Water_Quality_Class 
from WaterbodyClassifications
where Name = 'Lake Forest'


/*how many waterbody types are water quality type A,B,C (fresh surface water)*/
select Waterbody_Type, Water_Quality_Class, count(*) as Total
from WaterbodyClassifications
where Water_Quality_Class IN ('A', 'B', 'C')
group by Waterbody_Type, Water_Quality_Class 
order by Water_Quality_Class, Total asc;


/*how many waterbody types are water quality class B(fresh surface water)*/
select Waterbody_Type, Water_Quality_Class, count(*) as Total
from WaterbodyClassifications
where Water_Quality_Class = 'B'
group by Waterbody_Type, Water_Quality_Class
order by Total asc




