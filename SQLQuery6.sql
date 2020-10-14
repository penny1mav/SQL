CREATE PROCEDURE themaa6
AS
BEGIN
	SELECT Qpivot.[1] As Q1, QPivot.[2] AS Q2, QPivot.[3] AS Q3, QPivot.[4] AS Q4
	FROM
	(
		SELECT DATEPART(QUARTER, i.InvoiceDate) [Quarter], COUNT(1) [Sales Count]
		FROM  Invoice AS i, InvoiceLine AS il, Track As t
		WHERE i.InvoiceId=il.InvoiceId
		AND YEAR(i.invoiceDate) = 2009
		AND t.TrackId= il.TrackId
		AND t.Name='Dazed and Confused'
		GROUP BY DATEPART(QUARTER,i.InvoiceDate)
		) AS QuarterlyData
PIVOT( SUM([Sales Count])
	FOR QUARTER IN ([1],[2],[3],[4])) AS QPivot
END