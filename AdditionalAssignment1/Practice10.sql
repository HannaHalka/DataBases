create view filtered_videos_stat as
select *
from videos_stat
where videos_stat.views > 5 and videos_stat.likes > 10 and videos_stat.comments  > 0;

create view filtered_youtube_channels as
select *
from youtube_channels
where channel_subs > 1 and channel_videos > 1;

create view video_additional_info as
select videos.channel_id, videos.video_id, filtered_videos_stat.views , filtered_videos_stat.likes , filtered_videos_stat.comments
from videos
right join filtered_videos_stat on videos.video_id = filtered_videos_stat.id

-- views [0, 1]
create view video_views_normalized as
select channel_id, video_id, views,
	(views - (select min(views) from video_additional_info where channel_id = vai.channel_id)) / 
    ((select max(views) from video_additional_info where channel_id = vai.channel_id) - 
     (select min(views) from video_additional_info where channel_id = vai.channel_id)) as normalized_views
from video_additional_info vai;

-- views [1, 10]
create view video_views_scaled as
select video_id, normalized_views,
	  (normalized_views * 9 + 1) as scaled_views
from video_views_normalized;

-- likes [0, 1]
create view video_likes_normalized as
select channel_id, video_id, likes,
	(likes - (select min(likes) from video_additional_info where channel_id = vai.channel_id)) / 
    ((select max(likes) from video_additional_info where channel_id = vai.channel_id) - 
     (select min(likes) from video_additional_info where channel_id = vai.channel_id)) as normalized_likes
from video_additional_info vai;

-- likes [1, 10]
create view video_likes_scaled as
select video_id, normalized_likes,
	  (normalized_likes * 9 + 1) as scaled_likes
from video_likes_normalized;

-- comments [0, 1]
create view video_comments_normalized as
select channel_id, video_id, comments,
	(comments - (select min(comments) from video_additional_info where channel_id = vai.channel_id)) / 
    ((select max(comments) from video_additional_info where channel_id = vai.channel_id) - 
     (select min(comments) from video_additional_info where channel_id = vai.channel_id)) as normalized_comments
from video_additional_info vai;

-- comments [1, 10]
create view video_comments_scaled as
select video_id, normalized_comments,
	  (normalized_comments * 9 + 1) as scaled_comments
from video_comments_normalized;

create view joind_scaled_tables as
select video_views_scaled.video_id, video_views_scaled.scaled_views, video_likes_scaled.scaled_likes,
	   video_comments_scaled.scaled_comments
from video_views_scaled
right join video_comments_scaled on video_views_scaled.video_id = video_comments_scaled.video_id
right join video_likes_scaled on video_views_scaled.video_id = video_likes_scaled.video_id

create view rating as
select video_id, 
	  (jst.scaled_views * 0.5 + jst.scaled_likes * 0.3 + jst.scaled_comments * 0.2) as rating
from joind_scaled_tables jst;

select * -- per channel
from rating
order by rating desc
limit 10;
