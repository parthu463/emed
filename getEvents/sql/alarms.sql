use master;
select powerpack.name as PP_NAME,
dynamic_app.name as APP_NAME,
dynamic_app_alerts.name as ALERT_NAME,
dynamic_app_alerts.message as ALERT_MESSAGE,
dynamic_app_thresholds.name as THRESH_NAME,
dynamic_app_thresholds.t_value as THRESHOLD,
dynamic_app_thresholds.t_unit as UNITS,
powerpack.ppguid,
dynamic_app.app_guid,
dynamic_app_alerts.alert_guid,
dynamic_app_thresholds.thresh_guid
from powerpack
INNER JOIN dynamic_app on powerpack.ppguid = dynamic_app.ppguid
INNER JOIN dynamic_app_alerts on dynamic_app.app_guid = dynamic_app_alerts.app_guid
INNER JOIN dynamic_app_thresholds on dynamic_app.app_guid = dynamic_app_thresholds.app_guid
order by PP_NAME, APP_NAME, ALERT_NAME;
