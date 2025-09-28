#!/bin/sh
echo "Content-Type: text/html"
echo ""

# Generate fortune
FORTUNE_TEXT=$(/usr/bin/fortune)

# Escape for HTML attribute
ESCAPED_FORTUNE=$(echo "$FORTUNE_TEXT" | sed 's/"/\&quot;/g')

# The span to show the text, and the input to hold the data
cat <<EOF
<span>$FORTUNE_TEXT</span>
<input type="hidden" id="fortune-input" name="fortune" value="$ESCAPED_FORTUNE">
EOF
