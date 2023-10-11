select concat(c.fname, ' ', c.lname) as fullname, r.idRequest, p.productdescription, s.comporatename 
from customer c, product p, productsupplier ps, productrequest pr, supplier s, paymentmethod pm, request r 
where c.idCustomer = pm.idCustomer and pm.idpaymentmethod = r.idPaymentMethod and r.idrequest = pr.idRequest
and pr.idProduct = p.idProduct and p.idProduct = ps.idProduct and ps.idSupplier = s.idSupplier;

select concat(c.fname, ' ', c.lname) as fullName, r.idRequest, sum(p.price + r.shippingprice) as priceRequest
from customer c, product p, productrequest pr, paymentmethod pm, request r 
where c.idCustomer = pm .idCustomer and pm.idpaymentmethod = r.idPaymentMethod and r.idrequest = pr.idRequest
and pr.idProduct = p.idProduct group by r.idrequest;

select p.productdescription, w.place as warehouseLocal from product p join warehouseproduct using (idproduct) join warehouse w using (idwarehouse);

select concat(c.fname, ' ', c.lname) as fullName, ca.flag from customer c, paymentmethod pm, card ca where c.idCustomer = pm.idCustomer and pm.idPaymentMethod = ca.idPaymentMethod;

select p.category, sum(p.price) as sum_of_the_prices, avg(evaluation) average_evaluation from product p group by p.category having sum_of_the_prices > 100;

select w.place as warehouse, sum(p.price) sum_product_price 
from warehouse w join warehouseproduct using (idwarehouse) join product p using (idproduct)
 group by warehouse having sum_product_price > 1000; 