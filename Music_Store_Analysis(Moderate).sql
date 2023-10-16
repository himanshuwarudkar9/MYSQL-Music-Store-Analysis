-- 1. Write query to return the email, first name, last name, & Genre of all Rock Music
-- listeners. Return your list ordered alphabetically by email starting with A
select distinct email,first_name,last_name genre from customer c join invoice i on c.customer_id=i.customer_id
join invoice_line il on il.invoice_id=i.invoice_id
where track_id in 
(select track_id from track join genre 
on track.genre_id=genre.genre_id where genre.name='Rock')
order by email

-- 2. Let's invite the artists who have written the most rock music in our dataset. Write a
-- query that returns the Artist name and total track count of the top 10 rock bands.

select max(artist.name),artist.artist_id,count(artist.artist_id) as no_of_songs from track t join album2 al 
on t.album_id=al.album_id join artist on artist.artist_id=al.artist_id join genre on genre.genre_id=t.genre_id
where genre.name='Rock'
group by artist.artist_id order by no_of_songs desc limit 10 

-- 3. Return all the track names that have a song length longer than the average song length.
-- Return the Name and Milliseconds for each track. Order by the song length with the
-- longest songs listed first
select name,milliseconds from track where milliseconds > (select avg(milliseconds) from track)
order by milliseconds desc