#Approach 1:
Select a.player_id, a.device_id as first_login from Activity a where a.event_date in (select min(b.event_date) From Activity b where a.player_id=b.player_id);


#Approach 2:
select player_id,first_value(device_id) over (partition by player_id order by event_date) as device_id from activity;



#Approach 3:
select player_id,last_value(device_id) over (partition by player_id order by event_date desc range between unbounded preceding and unbounded following) as device_id from activity;

