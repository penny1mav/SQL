CREATE PROCEDURE Ai
AS
BEGIN
SELECT TOP 10 a.Name, al.Title, SUM(il.Quantity)
FROM Invoice AS i, InvoiceLine As il,Album as al, Track As t, Artist As a
WHERE i.InvoiceId=il.InvoiceId
	AND i.InvoiceDate > '2009-01-01'
	AND i.InvoiceDate < '2009-03-01'
	AND t.TrackId = il.TrackId
	AND al.AlbumId =  t.AlbumId
	AND al.ArtistId = a.ArtistId
GROUP BY al.Title, a.Name
ORDER BY SUM(il.Quantity) DESC
END