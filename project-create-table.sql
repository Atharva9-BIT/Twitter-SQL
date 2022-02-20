CREATE TABLE Tweet(
    created_at timestamp with time zone,
    text varchar(255),
    tweet_id bigint PRIMARY KEY,
    tweet_source  varchar(255),
	retweet_count int
);

CREATE TABLE Retweet( 
	tweet_id bigint REFERENCES Tweet(tweet_id), 
	retweet_of_tweet_id bigint
);
	

CREATE TABLE Reply(
	tweet_id bigint REFERENCES Tweet(tweet_id),
    in_reply_to_screen_name  varchar(255),
    in_reply_to_status_id    bigint,
    in_reply_to_user_id      bigint 
);


CREATE TABLE Hastags(	
	tweet_id bigint REFERENCES Tweet(tweet_id),
    hashtags varchar(144)
);

CREATE TABLE users(
    user_id bigint PRIMARY KEY ,
    user_name character varying(255),
    user_screen_name  character varying(255), 
    user_followers_count integer,
    user_friends_count integer,
    user_lang character varying(10),
    user_status_count varchar(255),
    user_created_at timestamp with time zone
);

CREATE TABLE Location(
	user_id bigint REFERENCES users(user_id),
	user_location character varying(255)
);


CREATE TABLE Time(
	user_id bigint REFERENCES users(user_id),
	user_utc_offset integer,
    user_time_zone character varying(127)
);

	
CREATE TABLE Descr(
	user_id bigint REFERENCES users(user_id),
	user_description varchar(255)
);	


CREATE TABLE Tweet_User(
	tweet_id bigint REFERENCES Tweet(tweet_id),
	user_id bigint REFERENCES users(user_id)
);
	
