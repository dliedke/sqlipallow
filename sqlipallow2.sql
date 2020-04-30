-- Trigger to allow connection only for client IPs/ranges found in table IPAllow
CREATE TRIGGER allow_ipaddress
ON ALL SERVER
FOR LOGON
AS
BEGIN
            DECLARE @capturedip NVARCHAR(15);
            SET @capturedip = (SELECT EVENTDATA().value('(/EVENT_INSTANCE/ClientHost)[1]', 'NVARCHAR(15)'));
            IF EXISTS(SELECT ipaddress FROM master.dbo.IPAllow WHERE ipaddress = @capturedip)
            BEGIN
                        RETURN
            END
            ELSE
            BEGIN
                        IF EXISTS(SELECT ipaddress FROM master.dbo.IPAllow WHERE ipaddress LIKE '%/%' and dbo.IPAddressIsInRange(@capturedip, ipaddress)=1)
						BEGIN
							RETURN
						END
                        BEGIN
                            Print 'Your IP Address is blocked, Contact Administrator'
                            ROLLBACK
                        END
            END
END
GO 