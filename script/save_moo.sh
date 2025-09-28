#!/bin/sh
echo "Content-Type: text/html"
echo ""
# Read POST data
echo "DEBUG: REQUEST_METHOD= [$REQUEST_METHOD]<br>"
echo "DEBUG: CONTENT_LENGTH= [$CONTENT_LENGTH]<br>"
echo "DEBUG: db_user= [$db_user]<br>"
echo "DEBUG: db_pass= [$db_pass]<br>"
echo "DEBUG: db_host= [$db_host]<br>"
echo "DEBUG: db_name= [$db_name]<br>"

if [ "$REQUEST_METHOD" = "POST" ] && [ "$CONTENT_LENGTH" -gt 0 ]; then
  read -n "$CONTENT_LENGTH" POST_DATA
fi
echo "DEBUG: POST_DATA= [$POST_DATA]<br>"

# Decode URL-encoded data
DECODED_DATA=$(echo "$POST_DATA" | sed -e 's/+/ /g' -e 's/%\(..\)/\\x\1/g' | xargs -0 printf "%b")
echo "DEBUG: decoded= [$DECODED_DATA]<br>"


# Extract the fortune value using a sed command that handles multi-line input.
FORTUNE=$(echo "$DECODED_DATA" | sed 's/^.*fortune=//')
echo "DEBUG: fortune= [$FORTUNE]<br>"

# Escape single quotes for SQL
ESCAPED_FORTUNE=$(echo "$FORTUNE" | sed "s/'/''/g")
echo "DEBUG: escaped= [$ESCAPED_FORTUNE]<br>"

# Insert into MySQL only if not empty
if [ -n "$ESCAPED_FORTUNE" ]; then
  mariadb -h db -u $db_user -p${db_pass} moo_db --ssl=false -e \
  "INSERT INTO fortunes (fortune) VALUES ('$ESCAPED_FORTUNE');"
  echo '<div class="fade-out">✅ Saved!</div>'
else
  echo '<div class="fade-out">❌ No fortune received.</div>'
fi

