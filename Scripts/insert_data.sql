USE uc_davis;

INSERT INTO noc (noc_name)
SELECT NOC
FROM athlete_events;