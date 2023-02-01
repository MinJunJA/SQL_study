#CASE WHEN은 조건에 따라 원하는 결과를 조회할 수 있다.


select case when country in ('usa','canada') then 'North America'
else 'Others' end COUNTRY_GRP
from classicmodels.customers;

#국가별, 도시별 매출액 (매출액 기준 내림차순)

SELECT C.country,
       C.city,
       sum(quantityOrdered*priceEach) as SALES
from classicmodels.orders A
left
join classicmodels.orderdetails B
on A.orderNumber = B.orderNumber
left
join classicmodels.customers C
on A.customerNumber = C.customerNumber
group by 1,2
order by 3 DESC;

#북미, 비북미 매출액

select case when country in ('usa','canada') then 'North America'
else 'Others' end country_grp,
    sum(priceEach*quantityOrdered) as SALES
from classicmodels.orders A
left
join classicmodels.orderdetails B
on A.orderNumber = B.orderNumber
left
join classicmodels.customers C
on A.customerNumber = C.customerNumber
group by 1
order by 2 DESC;

#국가별 매출액

create table classicmodels.STAT as
select C.country,
       sum(priceEach*quantityOrdered) as SALES
from classicmodels.orders A
left
join classicmodels.orderdetails B
on A.orderNumber = B.orderNumber
left
join classicmodels.customers C
on A.customerNumber = C.customerNumber
group by 1
order by 2 desc;

select *
from classicmodels.stat;

#DENSE_RANK()

select country,
       SALES,
       DENSE_RANK() over (order by SALES DESC) RNK
from classicmodels.stat;

create table classicmodels.STAT_RNK as
select COUNTRY, SALES, DENSE_RANK() over (order by SALES DESC) RNK
from classicmodels.STAT;


select *
from classicmodels.STAT_RNK;

select *
from classicmodels.STAT_RNK
where RNK between 1 and 5;


select *
from (select country, sales, dense_rank() over (order by sales desc) RNK
      from (select C.country, sum(priceEach*quantityOrdered) SALES
            from classicmodels.orders A
            left
            join classicmodels.orderdetails B
            on A.orderNumber = B.orderNumber
            left
            join classicmodels.customers C
            on A.customerNumber = C.customerNumber
            group by 1) A) A
where RNK <= 5;


select A.customernumber,
       A.orderdate,
       B.orderdate
from classicmodels.orders A
left
join classicmodels.orders B
on A.customerNumber = B.customerNumber and substr(A.orderDate, 1, 4)
= substr(B.orderDate,1,4)-1;

select c.country,substr(A.orderdate,1,4) as YY,
       count(distinct A.customernumber) BU_1,
       count(distinct B.customernumber) BU_2,
       count(distinct B.customernumber)/count(distinct A.customernumber) as
RETENTION_RATE
from classicmodels.orders A
left
join classicmodels.orders B
on A.customerNumber = B.customerNumber
       and substr(A.orderDate,1,4) = substr(B.orderDate,1,4)-1
left
join classicmodels.customers C
on A.customerNumber = C.customerNumber
group by 1,2;
