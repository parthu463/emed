use master;
select ename as EventName
,eseverity as EventSeverity
,id as EventID
,emessage as EventMessage
,event_guid as EventGUID
from policies_events as ev
where ppguid = '5479472A416E160702305726EB03F8F7'
order by EventMessage;
