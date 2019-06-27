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
RESTORE DATABASE MSFD2018_production_feb
FROM DISK = '/shared-db/MSFD2018_production.bak'
WITH MOVE 'MSFD2018' to '/var/opt/mssql/data/MarineDB2018prodfeb.mdf',
MOVE 'MSFD2018_log' TO '/var/opt/mssql/data/MarineDB2018prodfeb_log.ldf'
GO
"

#   -Q "
# RESTORE FILELISTONLY
# FROM DISK = '/shared/MSFD2018_sandbox.bak'
# GO
# "
