By below docker commands we created a postegres instance

```console
docker build -t xihan-postgres-db ./

docker run --name xihan-postgresdb-container -p 5432:5432 -e POSTGRES_PASSWORD=mysecretpassword -d xihan-postgres-db

docker exec -it xihan-postgresdb-container /bin/sh

su postgres
psql -f docker-entrypoint-initdb.d/er.sql
```



1.I want to know the list of our customers and their spending.

SQL:

select c.Customer_id,max(c.Customer_Name) as name,sum(car.Price) as spending
from Transaction t
join Customer c 
on t.Customer_id = c.Customer_id
join Car car 
on t.Car_id = car.car_id
group by c.Customer_id;

2.I want to find out the top 3 car manufacturers that customers bought by sales (quantity) and the sales number for it in the current month.

SQL:

select car.Manufacturer,count(1) as quantity,sum(car.Price) as amount
from Transaction t
join Car car 
on t.Car_id = car.car_id
WHERE transaction_date >= date_trunc('month', CURRENT_DATE);
group by car.Manufacturer
order by 2 desc 
limit 3;
