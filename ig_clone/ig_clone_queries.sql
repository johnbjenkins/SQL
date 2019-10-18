# We want to reward our users who have been around the longest.
# Find the 5 oldest users

SELECT username,created_at 
FROM users
ORDER by created_at
LIMIT 5;

# What day of the week do most users register on?
# We need to figure out when to schedule an ad campaign.

SELECT DATE_FORMAT(created_at,"%a") AS registration_day,
COUNT(DATE_FORMAT(created_at,"%a")) AS signup_number
FROM users
GROUP BY registration_day
ORDER BY signup_number DESC
;

# We want to target our inactive users with an email campaign.
# Find the users who have never posted a photo.

SELECT *
FROM users 
LEFT JOIN photos
	ON users.id = photos.user_id
WHERE image_url IS NULL
;

# We're running a new contest to see who can get the 
# most likes on a single photo.
# Who won?

SELECT 
	users.username,
	photos.id,
	photos.image_url,
	COUNT(*) AS like_total
FROM photos
JOIN likes
	ON likes.photo_id = photos.id
JOIN users
	ON photos.user_id = users.id
GROUP BY photos.id
ORDER BY like_total DESC
LIMIT 1
;

# Our investors want to know how many times does
# the average user post?

SELECT 
    AVG(a.Num_User_Photos)
FROM
    (SELECT 
        COUNT(*) AS Num_User_Photos 
    FROM photos 
    GROUP BY user_id) AS a;
	
# OR ACROSS TOTAL USER DATABASE

SELECT
	(SELECT COUNT(*) FROM photos) / (SELECT COUNT(*) FROM users) AS avg;
	
# A brand wants to know which hashtags to use in a post.
# What are the top 5 most commonly used hashtags?

SELECT
	tags.tag_name,
	COUNT(photo_id) AS tag_count
FROM photo_tags
JOIN tags
	ON photo_tags.tag_id = tags.id
GROUP BY tags.id	
ORDER BY tag_count DESC
LIMIT 5
;

# We have a small problem with bots on our site...
# Find users who have liked every single photo in the database.

SELECT 
	users.username,
	COUNT(*) AS like_count
FROM users
JOIN likes
	ON users.id = likes.user_id
GROUP BY likes.user_id
HAVING like_count = (SELECT COUNT(*) FROM photos)
;

