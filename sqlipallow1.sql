-- Function to check if IP is contained in range
create function dbo.IPAddressIsInRange(@ip as varchar(15), @range as varchar(18))
  returns bit
as
  begin
	declare @prefix varchar(15),
		@cidr varchar(2),
		@mask bigint

	set @prefix = left(@range, charindex('/', @range) - 1)
	set @cidr = right(@range, len(@range) - charindex('/', @range))
	-- Converts to a bit mask, e.g. /24 = 255.255.255.0
	set @mask = 4294967295 - power(2, 32 - @cidr) + 1

	if (dbo.IPAddressToInteger(@ip) & @mask) = dbo.IPAddressToInteger(@prefix)
		return 1
	return 0
  end
go

-- Function to convert IP to int
create function dbo.IPAddressToInteger(@ip as varchar(15))
  returns bigint
as
  begin
    return (
      convert(bigint, parsename(@ip, 1)) +
      convert(bigint, parsename(@ip, 2)) * 256 +
      convert(bigint, parsename(@ip, 3)) * 65536 +
      convert(bigint, parsename(@ip, 4)) * 16777216
    )
  end
go

-- Create new IPAllow table
CREATE TABLE master.dbo.IPAllow (ipaddress VARCHAR(15))
GO

-- Sample data for IPAllow table, in this case only local machine with SQL server and ip range 10.x.x.x would be allowed
INSERT INTO IPAllow VALUES('<local machine>')
INSERT INTO IPAllow VALUES('10.0.0.0/8')  -- Same as 10.x.x.x refer to explanation at https://networkengineering.stackexchange.com/questions/3697/the-slash-after-an-ip-address-cidr-notation
GO