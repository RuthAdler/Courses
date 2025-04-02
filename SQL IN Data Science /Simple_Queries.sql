-- Q1 Run query: Who is the composer for track 18?
Select *
From Tracks
WHERE TrackId = 18;

--Q2 Run Query: ow many artists are you familiar with (there is no wrong answer here)?
Select *
From Artists;

--Q3 Run Query: What is the billing address for customer 31?
Select BillingAddress
From Invoices
WHERE CustomerId = 13

--Q4 Run Query: How many playlists are there? Which would you classify is your favorite from this list?
Select Playlistid,
Name
From Playlists;

--Q5A Run Query: What city is associated with Customer ID number 42? 
Select BillingCity 
FROM Invoices
WHERE CustomerId = 42;
--Q5B What was the invoice date for the customer in Santiago?
Select InvoiceDate
FROM Invoices
WHERE BillingCity = 'Santiago';

--Q6 What is the telephone number for Jennifer Peterson?
Select Phone
From Customers
WHERE FirstName = 'Jennifer' AND LastName = 'Peterson';

--Q7 How much do these tracks cost?
Select  UnitPrice 
From Tracks;

--Q8 Select all the columns from the Playlist Track table and limit the results to 10 records.
Select *
From Playlist_track 
Limit 10;

--Q9 Select all the columns from the Media Types table and limit the results to 50 records. 
Select *
From Media_types
Limit 50;

--Q10 What is the name of the 9th album in this list?
Select  Title  
From Albums
WHERE AlbumId ='9';
