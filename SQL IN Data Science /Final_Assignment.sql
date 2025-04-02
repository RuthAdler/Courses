SQL Final assinment:
 
Part 1: Yelp Dataset Profiling and Understanding

1. Profile the data by finding the total number of records for each of the tables below:
    ————————————————————————————————————————————————————————
		 Table						row used
    ————————————————————————————————————————————————————————
    SELECT business_id             	FROM attribute
    SELECT id                   		FROM Business
    SELECT business_id             	FROM Category
    SELECT business_id, date, count 	FROM checkin
    SELECT user_id,year             	FROM elite_years
    SELECT friend_id               	FROM friend
    SELECT hours                   	FROM hours
    SELECT caption              		FROM photo
    SELECT stars, date, cool        	FROM review
    SELECT text                     	FROM tip
    SELECT name                     	FROM user

	—————————————————————————————————————————
	Table			 	Num of records	|
	—————————————————————————————————————————
	i. Attribute table = 	10000 records	|
	ii. Business table = 	10000 records	|
	iii. Category table = 	10000 records	|
	iv. Checkin table = 	10000 records	|
	v. elite_years table = 	10000 records	|
	vi. friend table = 		10000 records	|
	vii. hours table = 		10000 records	|
	viii. photo table = 	10000 records	|
	ix. review table = 		10000 records	|
	x. tip table = 		10000 records	|
	xi. user table = 		10000 records	|
	—————————————————————————————————————————


2. Find the total distinct records by either the foreign key or primary key for each table. If two foreign keys are listed in the table, please specify which foreign key.
	SELECT COUNT (DISTINCT (id)) 			FROM Business 
	SELECT COUNT (DISTINCT (business_id)) 	FROM Hours 
	SELECT COUNT (DISTINCT (business_id)) 	FROM Category
	SELECT COUNT (DISTINCT (business_id)) 	FROM Attribute
	SELECT COUNT (DISTINCT (id)),
		  COUNT (DISTINCT (business_id)),
		  COUNT (DISTINCT (user_id)) 		FROM Review
	SELECT COUNT (DISTINCT (business_id)) 	FROM Checkin
	SELECT COUNT (DISTINCT (user_id)),
		  COUNT (DISTINCT (friend_id)) 	FROM Friend
	SELECT COUNT (DISTINCT (user_id))		FROM Elite_years


	——————————————————————————————————————————————————————————————————————————
	Table			Key 			Primary/foreign		Num of records
	——————————————————————————————————————————————————————————————————————————
	i. Business =		id		  		primary				10000  
	ii. Hours =		business_id 		foreign				1562	  
	iii. Category =	business_id 		foreign				2643
	iv. Attribute =	business_id 		foreign				1115
	v. Review =		id, 				primary				10000
					business_id, 		foreign				8090
					user_id			foreign				9581
	vi. Checkin = 		business_id		foreign				493
	vii. Photo =		id, 				primary				10000
					business_id		foreign				6493
	viii. Tip = 		business_id		foreign				3979
					user_id			foreign				537
	ix. User = 		id				primary				10000
	x. Friend = 		user_id, 			foreign				11
					freind_id			foreign				9415
	xi. Elite_years =	user_id			foreign				2780
	——————————————————————————————————————————————————————————————————————————

Note: Primary Keys are denoted in the ER-Diagram with a yellow key icon.	



3. Are there any columns with null values in the Users table? Indicate "yes," or "no."

	Answer: no
	
	
	SQL code used to arrive at answer:
	
	SELECT
		id, name, review_count, yelping_since,
		useful,funny, cool,fans, average_stars,
		compliment_hot, compliment_more,compliment_profile,
		compliment_cute,compliment_list,compliment_note,
		compliment_plain,compliment_cool,compliment_funny,
		compliment_writer,compliment_photos
	FROM
    		user
	WHERE 
		id 				is null or 
		name 			is null or 
		review_count 		is null or 
		yelping_since		is null or 
		useful 			is null or 
		funny 			is null or 
		cool 			is null or 
		fans 			is null or 
		average_stars 		is null or
		compliment_hot		is null or 
		compliment_more	is null or 
		compliment_profile 	is null or 
		compliment_cute 	is null or 
		compliment_list 	is null or 
		compliment_note 	is null or
		compliment_plain 	is null or 
		compliment_cool 	is null or 
		compliment_funny 	is null or 
		compliment_writer 	is null or 
		compliment_photos 	is null


	
4. For each table and column listed below, display the smallest (minimum), largest (maximum), and average (mean) value for the following fields:

	——————————————————————————————————————————————————————————————————————————
	i. Table: Review, Column: Stars								
		SELECT MIN (Stars), MAX (Stars), AVG (Stars) FROM Review
		min:		max:		avg:
		1		5		3.7082
	——————————————————————————————————————————————————————————————————————————
	ii. Table: Business, Column: Stars
		SELECT MIN (Stars), MAX (Stars), AVG (Stars) FROM Business
		min:		max:		avg:
		1.0		5.0		3.6549
	——————————————————————————————————————————————————————————————————————————
	iii. Table: Tip, Column: Likes
		SELECT MIN (Likes), MAX (Likes), AVG (Likes) FROM Tip
		min:		max:		avg:
		0		2		0.0144
	——————————————————————————————————————————————————————————————————————————
	iv. Table: Checkin, Column: Count
		SELECT MIN (Count), MAX (Count), AVG (Count) FROM Checkin
		min:		max:		avg:
		1		53		1.9414
	——————————————————————————————————————————————————————————————————————————
	v. Table: User, Column: Review_count
	SELECT MIN (Review_count), MAX(Review_count), AVG(Review_count) FROM User
		min:		max:		avg:
		0		2000		24.2995
	——————————————————————————————————————————————————————————————————————————

5. List the cities with the most reviews in descending order:

	SQL code used to arrive at answer:
	SELECT city, SUM (review_count) AS review_amount
	FROM business
	GROUP BY city
	ORDER BY review_amount DESC

	
	Copy and Paste the Result Below:
	
	+-----------------+---------------+
	| city            | review_amount |
	+-----------------+---------------+
	| Las Vegas       |         82854 |
	| Phoenix         |         34503 |
	| Toronto         |         24113 |
	| Scottsdale      |         20614 |
	| Charlotte       |         12523 |
	| Henderson       |         10871 |
	| Tempe           |         10504 |
	| Pittsburgh      |          9798 |
	| Montréal        |          9448 |
	| Chandler        |          8112 |
	| Mesa            |          6875 |
	| Gilbert         |          6380 |
	| Cleveland       |          5593 |
	| Madison         |          5265 |
	| Glendale        |          4406 |
	| Mississauga     |          3814 |
	| Edinburgh       |          2792 |
	| Peoria          |          2624 |
	| North Las Vegas |          2438 |
	| Markham         |          2352 |
	| Champaign       |          2029 |
	| Stuttgart       |          1849 |
	| Surprise        |          1520 |
	| Lakewood        |          1465 |
	| Goodyear        |          1155 |
	+-----------------+---------------+

	
6. Find the distribution of star ratings to the business in the following cities:

i. Avon

SQL code used to arrive at answer:
	SELECT stars, sum(review_count)
	FROM business
	WHERE city = 'Avon'
	GROUP BY stars


Copy and Paste the Resulting Table Below (2 columns â€“ star rating and count):

	+-------+-------------------+
	| stars | sum(review_count) |
	+-------+-------------------+
	|   1.5 |                10 |
	|   2.5 |                 6 |
	|   3.5 |                88 |
	|   4.0 |                21 |
	|   4.5 |                31 |
	|   5.0 |                 3 |
	+-------+-------------------+

ii. Beachwood

SQL code used to arrive at answer:

	SELECT stars, sum(review_count)
	FROM business
	WHERE city = 'Beachwood'
	GROUP BY stars

Copy and Paste the Resulting Table Below (2 columns â€“ star rating and count):
	+-------+-------------------+
	| stars | sum(review_count) |
	+-------+-------------------+
	|   2.0 |                 8 |
	|   2.5 |                 3 |
	|   3.0 |                11 |
	|   3.5 |                 6 |
	|   4.0 |                69 |
	|   4.5 |                17 |
	|   5.0 |                23 |
	+-------+-------------------+


7. Find the top 3 users based on their total number of reviews:
		
	SQL code used to arrive at answer:
	SELECT name, review_count
	FROM user
	ORDER BY review_count DESC
	LIMIT 3

		
	Copy and Paste the Result Below:

	+--------+--------------+
	| name   | review_count |
	+--------+--------------+
	| Gerald |         2000 |
	| Sara   |         1629 |
	| Yuri   |         1339 |
	+--------+--------------+


8. Does posing more reviews correlate with more fans?

	no. 
	Please explain your findings and interpretation of the results:
	
	As the tables below implies, there is no interpretation between the amount 	of reviews one’s posting and the number of fans. For example, Gerald has 		2000 reviews posted, the largest amount, yet, his number of fans is 253, 		which is the 4th in line after Amy with 503 fans that posted 609 reviews 		only. The full tables are attached below and can indicate the lack of 		interpretations I am suggestion. 
	
	SELECT name,review_count,fans 			SELECT name,review_count,fans
	FROM user								FROM user
	order by fans desc						order by review_count desc
	limit 10								limit 10

+-----------+--------------+------+  	+-----------+--------------+------+
| name      | review_count | fans |	| name      | review_count | fans |
+-----------+--------------+------+	+-----------+--------------+------+
| Amy       |          609 |  503 |	| Gerald    |         2000 |  253 |
| Mimi      |          968 |  497 |	| Sara      |         1629 |   50 |
| Harald    |         1153 |  311 |	| Yuri      |         1339 |   76 |
| Gerald    |         2000 |  253 |	| .Hon      |         1246 |  101 |
| Christine |          930 |  173 |	| William   |         1215 |  126 |
| Lisa      |          813 |  159 |	| Harald    |         1153 |  311 |
| Cat       |          377 |  133 |	| eric      |         1116 |   16 |
| William   |         1215 |  126 |	| Roanna    |         1039 |  104 |
| Fran      |          862 |  124 |	| Mimi      |          968 |  497 |
| Lissa     |          834 |  120 |	| Christine |          930 |  173 |
+-----------+--------------+------+	+-----------+--------------+------+

	
9. Are there more reviews with the word "love" or with the word "hate" in them?

	Answer:
	Love
	
	SQL code used to arrive at answer:

	SELECT count(*) as hate
	FROM review H
	where H.text LIKE '%hate%'

	+------+
	| hate |
	+------+
	|  232 |
	+------+

	SELECT count(*) as love
	FROM review L
	where L.text LIKE '%love%'
	+------+
	| love |
	+------+
	| 1780 |
	+------+


10. Find the top 10 users with the most fans:

	SQL code used to arrive at answer:	
	SELECT name, fans
	FROM user
	ORDER BY fans desc
	limit 10

	Copy and Paste the Result Below:

	+-----------+------+
	| name      | fans |
	+-----------+------+
	| Amy       |  503 |
	| Mimi      |  497 |
	| Harald    |  311 |
	| Gerald    |  253 |
	| Christine |  173 |
	| Lisa      |  159 |
	| Cat       |  133 |
	| William   |  126 |
	| Fran      |  124 |
	| Lissa     |  120 |
	+-----------+------+


	Part 2: Inferences and Analysis

	1. Pick one city and category of your choice and group the businesses in 		that city or category by their overall star rating. Compare the businesses 	with 2-3 stars to the businesses with 4-5 stars and answer the following 		questions. Include your code.
	
	i. Do the two groups you chose to analyze have a different distribution of 	hours?
	Restaurants in Las Vegas are all open in Saturday, there is no strong 		different distribution in opening hours that might indicate the 				differences in rating. At rating group there is 1 restaurant open 12 h, 		one open 5/6 and third that open 10 hours.  

	ii. Do the two groups you chose to analyze have a different number of 		reviews?
	Yes. The 4/5 stars restaurants has 123 reviews togethers, which is 41 by 		average per each. while the 2/3 has 86 reviews togteher, which is 28 in 		average. That might indicate that the more reviews a restaurant in Toronto 	gets, it might imply at the satisfaction the customer will rate. Meaning, 		a happy customer will review more.         
         
	iii. Are you able to infer anything from the location data provided 			between these two groups? Explain.
	Yes, the higher rated restaurants will not be at the neighborhood cold 		“Downtown Core” while 2 or=f the lower rated are located in that area.
	
SQL code used for analysis:
	SELECT 
    		SUBSTR (B.name, 0,9) name,
    		B.review_count AS Reviews,
    		SUBSTR (B.address , 0,13) address,
   		H.hours,B.neighborhood,
    		CASE
        		WHEN stars BETWEEN 2 AND 3 THEN '2/3 Stars'
        		WHEN stars BETWEEN 4 AND 5 THEN '4/5 Stars'
    		END AS Rating
	FROM business B
		INNER JOIN hours H ON B.id = H.business_id
		INNER JOIN category C on C.business_id = B.id
	WHERE city = 'Toronto'
    		AND category = 'Restaurants'
    		AND Rating IN ('2/3 Stars','4/5 Stars')
	GROUP BY B.name
	ORDER BY stars DESC


	+----------+---------+------------------------+--------------+----------------------+-----------+
	| name     | Reviews | neighborhood           | address      | hours                | Rating    |
	+----------+---------+------------------------+--------------+----------------------+-----------+
	| Cabin Fe |      26 | High Park              | 1669 Bloor S | Saturday|16:00-2:00  | 4/5 Stars |
	| Sushi Os |       8 | Etobicoke              | 5084 Dundas  | Saturday|11:00-23:00 | 4/5 Stars |
	| Edulis   |      89 | Niagara                | 169 Niagara  | Saturday|18:00-23:00 | 4/5 Stars |
	| Big Smok |      47 | Downtown Core          | 260 Yonge St | Saturday|10:30-21:00 | 2/3 Stars |
	| Pizzaiol |      34 | Entertainment District | 270 Adelaide | Saturday|10:00-4:00  | 2/3 Stars |
	| 99 Cent  |       5 | Downtown Core          | 389 Church S | Saturday|11:00-23:00 | 2/3 Stars |
	+----------+---------+------------------------+--------------+----------------------+-----------+

	2. Group business based on the ones that are open and the ones that are 		closed. What differences can you find between the ones that are still open 	and the ones that are closed? List at least two differences and the SQL 		code you used to arrive at your answer.
		
	i. Difference 1:
 	The average amount of stars rated closed businesses have got was lower 		than the open ones.

	ii. Difference 2:
		The average amount of reviews an open business have got was higher  than 			the close ones.        
	+---------------+---------------+---------+-----------+----------------+
	|       Reviews |     avg_stars | is_open | numCities | NumOfBussiness |
	+---------------+---------------+---------+-----------+----------------+
	| 36.9098360656 | 3.66393442623 |       0 |        19 |             32 |
	| 56.6672473868 | 3.89982578397 |       1 |        54 |            152 |
	+---------------+---------------+---------+-----------+----------------+         
         
	SQL code used for analysis:
	SELECT 
    		AVG(B.review_count) AS Reviews,
    		AVG(B.stars) AS avg_stars,
    		B.is_open,
    		COUNT(DISTINCT B.city) AS numCities,
    		COUNT(DISTINCT B.id) AS NumOfBussiness
		FROM business B
			INNER JOIN category C on C.business_id = B.id
		GROUP BY B.is_open

	
	3. For this last part of your analysis, you are going to choose the type 		of analysis you want to conduct on the Yelp dataset and are going to 			prepare the data for analysis.

	
	i. Indicate the type of analysis you chose to do:
 
	I chose to test wether more reviews in a state meens that the coustomers 		thought that the place (of every category) was funny or cool, and rated 		the place higher. 
         
	ii. Write 1-2 brief paragraphs on the type of data you will need for your 		analysis and why you chose that data:
     I will need the review count in average, alongside with the average stars 		rated, the state and the number of times people thought the place was 		cool ,usefulor funny.                     
                  
	iii. Output of your finished dataset:

     As the dataset indicate, there is a correlation between the number of 		times a place was reified and the number of times it thought to be either 		cool, useful or funny. The sat NV was review the largest average amount of 	times, 768, it has average star rate of 4, and the largest number of 			cool (14_ and useful (42)
+------------+-----------+-------+-----------+--------------+------------+
| avg_review | avg_stars | state | NumOfcool | NumOfusefeul | NumOfFunny |
+------------+-----------+-------+-----------+--------------+------------+
|        768 |         4 | NV    |        14 |           42 |          7 |
|        601 |         4 | OH    |        10 |           10 |         10 |
|        392 |         4 | AZ    |         0 |            9 |          0 |
|         33 |         3 | PA    |         2 |            4 |          0 |
|         29 |         3 | ON    |        12 |           18 |         18 |
+------------+-----------+-------+-----------+--------------+------------+
    
         
iv. Provide the SQL code you used to create your final dataset:
SELECT 
            CAST(AVG(B.review_count)AS INT) AS avg_review,
            CAST(AVG(B.stars)AS INT) AS avg_stars,
            B.state,
            SUM(R.cool) AS NumOfcool,
            SUM(R.useful) AS NumOfusefeul,
            SUM(R.funny) AS NumOfFunny
        FROM business B
            INNER JOIN category C on C.business_id = B.id
            INNER JOIN review R on B.id = R.business_id
        GROUP BY B.state 
        ORDER BY avg_review DESC
