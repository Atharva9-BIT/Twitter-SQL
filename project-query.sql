
select COUNT(tweet_id) as Tweets_in_total from Tweet;


select users.user_lang,COUNT(tweet_id) as Number_of_Tweets
from (
Tweet_User INNER JOIN users on users.user_id = Tweet_User.user_id)
GROUP BY user_lang;


select users.user_lang,CAST((SELECT COUNT(tweet_id) as Number_of_Tweets) as float)/CAST((SELECT Distinct Count(tweet_id) from Tweet) as float) as Fraction_tweets, CAST((SELECT COUNT(tweet_id) as Number_of_Tweets) as float)/CAST((select DISTINCT Count(user_id) from users) AS FLOAT) as fraction_users
from (
Tweet_User INNER JOIN users on users.user_id = Tweet_User.user_id)
group by user_lang;



select CAST((SELECT Count(tweet_id) from Retweet) as float)/CAST((select Count(tweet_id) from Tweet) as float)
as Fraction_of_tweets;

 

select AVG(retweet_count)as Avg_retweet_tweet from Tweet;


select CAST((SELECT Count(tweet_id) from Tweet where retweet_count = 0) as float)/CAST((SELECT Count(tweet_id) from Tweet) as float)
as Fraction_of_never_retweeted_tweets;


SELECT (CAST((SELECT COUNT(tweet_id) FROM Tweet where retweet_count < CAST((SELECT AVG(retweet_count) from Tweet as float)as float))as float)/CAST((SELECT COUNT(tweet_id) FROM Tweet)as float))
AS retweeted_tweets_fewer_times;


select count(DISTINCT hashtags)as distinct_hashtags from Hastags;


select DISTINCT hashtags as Popular_Hashtags, count(hashtags) as Number_of_hashtags
from Hastags
group by hashtags  
ORDER BY COUNT(hashtags) DESC limit 10;



select users.user_lang as language, hashtags as Popular_Hashtags,count(hashtags) as Number_of_hashtags
from ((Tweet_User
INNER JOIN users on users.user_id = Tweet_User.user_id)
INNER JOIN Hastags on Hastags.tweet_id = Tweet_User.tweet_id)
group by hashtags, users.user_lang
ORDER BY count(hashtags) DESC LIMIT 3;




select CAST ((SELECT Count(tweet_id) from Tweet)AS FLOAT) -  CAST ((SELECT Count(tweet_id) from Reply)AS FLOAT) as Not_replied_tweets; 


Select CAST ((SELECT count(user_lang) from users where user_lang = 'en')as Float)/CAST ((SELECT sum(in_reply_to_user_id) from Reply)as Float) as probability_of_same_language;


