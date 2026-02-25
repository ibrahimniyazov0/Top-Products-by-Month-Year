Select
year(h.Orderdate) as Years,
month(h.Orderdate) as Months,
p.Name as Products,
sum(d.OrderQty) as TotaqlQty,
dense_rank() over (Partition by year(h.OrderDate), month(h.OrderDate) order by sum(d.OrderQty) desc) as ProductRank
from Sales.SalesOrderDetail as d
join Production.Product as p on d.ProductID = p.ProductID
join Sales.SalesOrderHeader as h on d.SalesOrderID = h.SalesOrderID
group by year(h.Orderdate), month(h.Orderdate), p.Name
order by Years, Months, ProductRank asc
