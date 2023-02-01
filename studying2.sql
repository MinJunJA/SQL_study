#요청사항
#classicmodels.customers, classicmodels.orders 테이블을 이용해
#usa 거주자의 주문번호(customernumber), 국가(country)를 출력하세요. (inner join)사용

select A.ordernumber, B.country
from classicmodels.orders A
inner
join classicmodels.customers B
on A.customerNumber = B.customerNumber
where B.country = 'usa';

#요청사항
#classicmodels.customers의 country 칼럼을 이용해 북미(canada, usa)
#비북미를 출력하는 칼럼을 생성하세요.

select country, CASE WHEN country in ('usa', 'canada') then 'North america' else
'Others' end as region
from classicmodels.customers;


#요청사항
#classicmodels.customers의 country 칼럼을 이용해 북미(canada, usa)
#비북미를 출력하는 칼럼을 생성하고, 북미,비북미 거주 고객의 수를 계산하세요.

select case when country in ('usa', 'canada') then 'North America' else 'others' end as region,
       count(customerNumber) N_customers
from classicmodels.customers
group by case when country in ('usa', 'canada') then 'North America'
else 'Others' End;


#요청사항
#classicmodels.products 테이블에서 buyprice 칼럼으로 순위를 매겨 주세요.
#(오름차순) (row_number, rank, dense rank사용)

select buyPrice,
       row_number() over (order by buyPrice) rownumber,
       rank() over (order by buyPrice) rnk,
       dense_rank() over (order by buyPrice) denserank
from classicmodels.products;

#요청사항
#classicmodels.products 테이블의 productline별로 순위를 매겨 주세요.
#(buyprice칼럼 기준, 오름차순) (row_number, rank, dense rank 사용)

select buyPrice,
       row_number() over (partition by productLine order by buyPrice) rownumber,
       rank() over (partition by productLine order by buyPrice) rnk,
       dense_rank() over (partition by productLine order by buyPrice) denserank
from classicmodels.products;


#요청사항
#classicmodels.customers와 classicmodels.orders를 이용해 usa 거주자의 주문번호를 출력

select orderNumber
from classicmodels.orders
where customerNumber in (select customerNumber
                         from classicmodels.customers
                         where country = 'usa');

#view의 특징
#가상의 테이블, 뷰는 실제 데이터를 가지고 있지 않다.
#실제 테이블에 링크된 개념
#엑세스 제한을 위해서 주로 사용됨.

#요청사항
#일별 매출액 조회

select A.orderdate, priceEach*quantityOrdered
from classicmodels.orders A
left
join classicmodels.orderdetails B
on A.orderNumber = B.orderNumber;

#orderdate로 그룹핑한뒤, priceeach * quantityordered의 합을 집계

select A.orderdate, sum(priceEach*quantityOrdered) as sales
from classicmodels.orders A
left
join classicmodels.orderdetails B
on A.orderNumber = B.orderNumber
group by 1
order by 1;

#월별 매출을 구하는 방법

select substr(A.orderdate,1,7) as MM, sum(priceEach*quantityOrdered) as sales
from classicmodels.orders A
left
join classicmodels.orderdetails B
on A.orderNumber = B.orderNumber
group by 1
order by 1;

#연도별 매출액 조회

select substr(A.orderdate,1,4) as YY, sum(priceEach*quantityOrdered) as sales
from classicmodels.orders A
left
join classicmodels.orderdetails B
on A.orderNumber = B.orderNumber
group by 1
order by 1;

#중복제거 값

select orderdate,
       count(distinct customerNumber) N_PURCHASER,
       count(orderNumber) N_orders
from classicmodels.orders
group by 1
order by 1;

#연도별 매출액과 구매자 수를 구하기.

select substr(A.orderdate,1,4) as YY,
       count(distinct A.customerNumber) as N_PURCHASER,
       sum(priceEach*quantityOrdered) as sales
from classicmodels.orders A
left
join classicmodels.orderdetails B
on A.orderNumber = B.orderNumber
group by 1
order by 1;

#연도별 인당 매출액 구하기

select substr(A.orderdate,1,4) as YY,
       count(distinct A.customerNumber) as N_PURCHASER,
       sum(priceEach*quantityOrdered) as sales,
       sum(priceEach*quantityOrdered) / count(distinct A.customerNumber) as AMV
from classicmodels.orders A
left
join classicmodels.orderdetails B
on A.orderNumber = B.orderNumber
group by 1
order by 1;

#건당 구매 금액 구하기(연도별)

select substr(A.orderdate,1,4) as yy,
       count(distinct A.orderNumber) N_PURCHASER,
       sum(priceEach*quantityOrdered) as sales,
       sum(priceEach*quantityOrdered) / count(distinct A.orderNumber) as ATV
from classicmodels.orders A
left
join classicmodels.orderdetails B
on A.orderNumber = B.orderNumber
group by 1
order by 1;

select country, city, priceEach * quantityOrdered
from classicmodels.orders A
left join classicmodels.orderdetails B
on A.orderNumber = B.orderNumber
left join classicmodels.customers C
on A.customerNumber = C.customerNumber;

select C.country, C.city, Sum(priceEach*quantityOrdered) as SALES
from classicmodels.orders A
left join classicmodels.orderdetails B
on A.orderNumber = B.orderNumber
left join classicmodels.customers C
on A.customerNumber = C.customerNumber
group by 1,2
order by 1,2;

