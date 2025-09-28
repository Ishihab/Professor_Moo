#!/bin/sh

# 1. Send the HTTP headers to instruct the browser to start a download.
echo "Content-Type: text/csv"
echo "Content-Disposition: attachment; filename=fortunes_$(date +%Y-%m-%d_%H-%M-%S).csv"
echo ""
# 2. Let MySQL format the data into perfect CSV rows.
# The output of this command is streamed directly to the browser as the file content.
mariadb -h db -u $db_user -p${db_pass} --ssl=false -r -N moo_db <<EOF
SELECT CONCAT('"', REPLACE(fortune, '"', '""'), '"') 
FROM fortunes 
ORDER BY id DESC;
EOF
