CREATE PROCEDURE thema4
AS
BEGIN
SELECT c.FirstName, c.LastName, c.Address, c.PostalCode, c.Phone, c.Fax, c.Email, SUM(i.Total)
FROM Invoice AS i, Customer AS c
WHERE c.CustomerId= i.CustomerId
	AND i.InvoiceDate > '2009-01-01'
	AND i.InvoiceDate > '2011-01-01'
GROUP BY c.FirstName, c.LastName, c.Address, c.PostalCode, c.Phone, c.Fax, c.Email
ORDER BY SUM (i.Total) DESC

END