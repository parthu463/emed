use master;

select da.name as AppName, ename as EventName, aa.message as AlertMessage,
ath.t_value as ThresholdValue, ath.t_unit as ThresholdUnit,
eseverity as EventSeverity,
id as EventID, emessage as EventMessage,
aa.name as AlertName, ath.name as ThresholdName,
event_guid as EventGUID, ev.app_guid as AppGUID,
aa.alert_guid as AlertGUID, ath.thresh_guid as ThreshGUID
from policies_events as ev
join dynamic_app as da on ev.app_guid = da.app_guid
join dynamic_app_alerts as aa on ev.Xoid = aa.alert_id
join dynamic_app_thresholds as ath on aa.app_guid = ath.app_guid
-- where eseverity != 0
-- and ev.app_guid is not NULL
-- where aa.alert_id = 1279
order by AppName, EventGUID

