CREATE PROCEDURE thema3
AS
BEGIN
SELECT TOP 10 Genre.Name as Genre_Name, G_Sales.GenreId, G_Sales.Sales_Per_Genre
FROM ( SELECT G.GenreId, SUM(G.Total_per_Album) as Sales_Per_Genre
	FROM ( SELECT Track_Album_Total_Date.AlbumId, SUM(Track_Album_Total_Date.Total_Per_Track) as Total_Per_Album,Track_Album_Total_Date.GenreId
		FROM ( SELECT T.AlbumId, TOTAL_SOLD_PER_TRACK_DATE.Total_Per_Track,T.GenreId
			FROM Track as T, (SELECT T.TrackId, SUM(T.Quantity) as Total_Per_Track
				FROM (SELECT I.InvoiceId,I.InVoiceDate,IL.InvoiceLineId,IL.TrackId,IL.Quantity
				FROM Invoice as I, InvoiceLine as IL
				WHERE I.InvoiceId=IL.InvoiceId) as T
				GROUP BY T.TrackId
				)
				as TOTAL_SOLD_PER_TRACK_DATE
			WHERE T.TrackId=TOTAL_SOLD_PER_TRACK_DATE.TrackId) as Track_Album_Total_Date
		GROUP BY Track_Album_Total_Date.AlbumId,Track_Album_Total_Date.GenreId) as G
		GROUP BY G.GenreId ) as G_Sales
	JOIN Genre
	on Genre.GenreId=G_Sales.GenreId
	order by G_Sales.Sales_Per_Genre DESC
	END