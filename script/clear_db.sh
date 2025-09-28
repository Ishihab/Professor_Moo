#!/bin/sh
echo "Content-Type: text/html"
echo ""
# Truncate the shared fortunes table
mariadb -h db -u $db_user -p${db_pass} --ssl=false moo_db -e "TRUNCATE TABLE fortunes;"

echo '<div class="fade-out">🧹 All fortunes cleared from the database.</div>'

