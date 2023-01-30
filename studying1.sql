#요청사항
#classicmodels.customers의 customerNumber를 조회하세요

select customerNumber
from classicmodels.customers;

#요청사항
#classicmodels.payment의 amount의 총합과 checknumber 개수를 구하세요.

select sum(amount),
       count(checkNumber)
from classicmodels.payments;

#요청사항
#classicmodels.products의 productname, productline을 조회하세요.

select productName, productLine
from classicmodels.products;

#요청사항
#classicmodels.products의 productcode의 개수를 구하고, 칼럼 명을 n_products로 변경하세요

select count(productCode) AS n_products
from classicmodels.products;

#요청사항
#classicmodels.orderdetails의 ordernumber의 중복을 제거하고 조회하세요.

select distinct orderNumber
from classicmodels.orderdetails;

#요청사항
#classicmodels.orderdetails의 priceeach가 30에서 50사이인 데이터를 조회하세요.

select *
from classicmodels.orderdetails
where priceEach between 30 and 50;



#요청사항
#classicmodels.orderdetails의 priceeach가 30이상인 데이터를 조회하세요.
select *
from classicmodels.orderdetails
where priceEach >= 30;

#요청사항
#classicmodels.customers의 country가 usa또는 canada인 customernumber를 조회하세요.

select customerNumber
from classicmodels.customers
where country in ('usa', 'canada');

#요청사항
#classicmodels.customer의 country가 usa, canada가 아닌 customernumber를 조회하세요.

select customerNumber
from classicmodels.customers
where country not in ('usa', 'canada');

#요청사항
#classicmodels.employees의 reportsTo의 값이 null인 employeenumber를 조회하세요.

select employeeNumber
from classicmodels.employees
where reportsTo is null;

#요청사항
#classicmodels.customers의 addressline1에 ST가 포함된 addressline1을 출력하세요.

select addressLine1
from classicmodels.customers
where addressLine1 like '%ST%';

#요청사항
#classicmodels.customers 테이블을 이용해 국가, 도시별 고객 수를 구하세요.

select country, city, count(customerNumber) N_customers
from classicmodels.customers
group by country, city;

#요청사항
#classicmodels.customers, classicmodels.orders 테이블을 결합하고
#ordernumber와 country를 출력하세요. (left join)

select A.ordernumber, B.country
from classicmodels.orders A
left
join classicmodels.customers B
on A.customerNumber = B.customerNumber;

#요청사항
#classicmodels.customers, classicmodels.orders 테이블을 이용해
#usa 거주자의 주문번호(ordernumber), 국가(country)를 출력하세요. (left join)

select A.ordernumber, B.country
from classicmodels.orders A
left
join classicmodels.customers B
on A.customerNumber = B.customerNumber
where B.country = 'usa'