\i bad-table-create.sql;
SET CLIENT_ENCODING TO 'utf8';
\COPY bad_giant_table FROM bad_giant_table.csv csv;


INSERT INTO Tweet(created_at,text,tweet_id,tweet_source,retweet_count) SELECT created_at,text,tweet_id,tweet_source,retweet_count FROM bad_giant_table;

INSERT INTO Retweet(tweet_id,retweet_of_tweet_id) SELECT tweet_id,retweet_of_tweet_id FROM bad_giant_table WHERE retweet_of_tweet_id IS NOT NULL;

INSERT INTO Reply(tweet_id,in_reply_to_screen_name,in_reply_to_status_id,in_reply_to_user_id) SELECT tweet_id,in_reply_to_screen_name,in_reply_to_status_id,in_reply_to_user_id FROM bad_giant_table WHERE in_reply_to_screen_name IS NOT NULL;


INSERT INTO Hastags(tweet_id,hashtags) SELECT tweet_id,hashtag1 FROM bad_giant_table WHERE hashtag1 IS NOT NULL;
INSERT INTO Hastags(tweet_id,hashtags) SELECT tweet_id,hashtag2 FROM bad_giant_table WHERE hashtag2 IS NOT NULL;
INSERT INTO Hastags(tweet_id,hashtags) SELECT tweet_id,hashtag3 FROM bad_giant_table WHERE hashtag3 IS NOT NULL;
INSERT INTO Hastags(tweet_id,hashtags) SELECT tweet_id,hashtag4 FROM bad_giant_table WHERE hashtag4 IS NOT NULL;
INSERT INTO Hastags(tweet_id,hashtags) SELECT tweet_id,hashtag5 FROM bad_giant_table WHERE hashtag5 IS NOT NULL;
INSERT INTO Hastags(tweet_id,hashtags) SELECT tweet_id,hashtag6 FROM bad_giant_table WHERE hashtag6 IS NOT NULL;


INSERT INTO users(user_id,user_name,user_screen_name,user_followers_count,user_friends_count,user_lang,user_status_count,user_created_at) SELECT DISTINCT user_id ,user_name,user_screen_name,user_followers_count,user_friends_count,user_lang,user_status_count,user_created_at FROM bad_giant_table;


INSERT INTO Location(user_id,user_location) SELECT user_id,user_location FROM bad_giant_table WHERE user_location <> '';

INSERT INTO Time(user_id,user_utc_offset,user_time_zone) SELECT  user_id ,user_utc_offset,user_time_zone FROM bad_giant_table WHERE user_time_zone IS NOT NULL;

INSERT INTO Descr(user_id,user_description) SELECT user_id,user_description FROM bad_giant_table WHERE user_description <> '';

INSERT INTO Tweet_User(tweet_id,user_id) SELECT tweet_id,user_id FROM bad_giant_table;	

