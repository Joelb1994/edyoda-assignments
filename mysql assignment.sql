create  database class3;
use class3;
create table SalesPeople(
Snum int primary key,
Sname varchar(20) not null unique,
city varchar(30),
comm numeric(3,3)
);
insert into SalesPeople values ('1001','Peel','london','.12');
insert into SalesPeople values ('1002','Serres','sanjose','.13');
insert into SalesPeople values ('1004','Motika','london','.11');
insert into SalesPeople values ('1007','Rifkin','barcelona','.15');
insert into SalesPeople values ('1003','Axelrod','newyork','.10');

create table Customers(
Cnum int primary key,
Cname varchar(20) ,
city varchar(30) not null,
Snum int,
foreign key (Snum) references Salespeople(Snum)  
);

insert into Customers values ('2001','Hoffman','london','1001');
insert into Customers values  ('2002','Giovanni','rome','1003');
insert into Customers values ('2003','Liu','sanjose','1002');
insert into Customers values ('2004','Grass','Berlin','1002');
insert into Customers values  ('2006','Clemens','london','1001');
insert into Customers values  ('2008','Cisneros','sanjose','1007');
insert into Customers values  ('2007','Pereira ','rome','1004');
select * from Customers;

create table Orders(
Onum int primary key,
Amt numeric(10,2),
Odate date not null,
Cnum int,
Snum int,
foreign key (Cnum) references Customers(Cnum), 
foreign key (Snum) references SalesPeople(Snum) 
);
insert into Orders values ('3001','18.69','1990-10-03','2008','1007');
insert into Orders values ('3003','767.19','1990-10-03','2001','1001');
insert into Orders values ('3002','1900.10','1990-10-03','2007','1004');
insert into Orders values ('3005','5160.45','1990-10-03','2003','1002');
insert into Orders values ('3006','1098.16','1990-10-03','2008','1007');
insert into Orders values ('3009','1713.23','1990-10-04','2002','1003');
insert into Orders values ('3007','75.75','1990-10-04','2004','1002');
insert into Orders values ('3008','4273.00','1990-10-05','2006','1001');
insert into Orders values ('3010','1309.95','1990-10-06','2004','1002');
insert into Orders values ('3011','9891.88','1990-10-06','2006','1001');

# 1) Count the number of Salesperson whose name begin with ‘a’/’A’.
select sname, count(*) as No_of_salesperson 
from salespeople
where sname like "a%" or sname like"A%"
group by sname;

 #2)Display all the Salesperson whose all orders worth is more than Rs. 2000.
 
 select salespeople.sname as sales_person_name,orders.amt as amount
 from salespeople inner join orders
 on salespeople.snum=orders.snum
 where amt>2000;
 
#3) Count the number of Salesperson belonging to Newyork.
select city,count(*) as  no_of_salesperson 
from salespeople
where city="newyork";

#4)Display the number of Salespeople belonging to London and belonging to Paris.
select city,count(*) as  no_of_salesperson 
from salespeople
where city in('london','paris')
group by city;

#5)Display the number of orders taken by each Salesperson and their date of orders.
select sname as name_of_salesperson,count(*) as order_taken,odate 
from salespeople inner join orders
on salespeople.snum=orders.snum
group by sname,odate;
  






