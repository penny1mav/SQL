CREATE PROCEDURE thema2
AS
BEGIN
SELECT TOP 10 t.Name, SUM(il.Quantity)
FROM Invoice AS i, InvoiceLine AS il, Track as t
WHERE i.InvoiceId = il.InvoiceId
	AND i.InvoiceDate > '2009-04-09'
	AND i.InvoiceDate <'2015-03-01'
	AND t.TrackId = il.TrackId
GROUP BY t.Name
ORDER BY SUM(il.Quantity) DESC

		END


