#!/bin/sh

# docker-compose exec db /opt/mssql-tools/bin/sqlcmd \
#   -S localhost \
#   -U sa \
#   -Pbla3311! \
#   -d master \
#   -i "/shared/marineDB.sql"

docker-compose exec msdb /opt/mssql-tools/bin/sqlcmd \
  -S localhost \
  -U sa \
  -Pbla3311! \
  -d master \
  -Q "
RESTORE DATABASE MarineDB
FROM DISK = '/shared-db/MarineDB.bak'
WITH MOVE 'MSFD_Reporting_v2' to '/var/opt/mssql/data/MarineDB.mdf',
MOVE 'MSFD_Reporting_v2_log' TO '/var/opt/mssql/data/MarineDB_log.ldf'
GO
"
