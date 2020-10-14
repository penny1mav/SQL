CREATE PROCEDURE thema5
AS
BEGIN
	SELECT i.InvoiceId, c.FirstName, c.LastName, e.FirstName, e.LastName
	FROM Customer AS c, Invoice AS i, Employee as e
	WHERE c.SupportRepid = e.EmployeeId
	AND c.CustomerId = i.CustomerId
	AND i.InvoiceDate > '2010-01-01'
	AND i.InvoiceDate < '2011-01-01'
	AND c.FirstName = 'Isabelle'
	AND c.LastName ='Mercier'
	AND e.FirstName = 'Jane'
	AND e.LastName = 'Peacock'

END