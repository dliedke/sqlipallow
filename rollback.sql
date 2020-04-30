-- Rollback
DROP TRIGGER allow_ipaddress ON ALL SERVER
DROP TABLE master.dbo.IPAllow
DROP function dbo.IPAddressIsInRange
DROP function dbo.IPAddressToInteger
