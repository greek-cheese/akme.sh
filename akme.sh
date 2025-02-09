#!/bin/sh
set -eu

INPUT_CODE=$(cat)

echo "$INPUT_CODE"

if ! printf '%s\n' "$INPUT_CODE" | grep -q '```'; then
    EXECUTION_RESULT=$(sh -c "$INPUT_CODE" 2>&1)
    [ -n "$EXECUTION_RESULT" ] && echo "$EXECUTION_RESULT"
    echo ""
    exit
fi

DETECTED_INTERPRETER=$(printf '%s\n' "$INPUT_CODE" | head -n 1 | cut -c4-)
EXECUTABLE_CONTENT=$(printf '%s\n' "$INPUT_CODE" | tail -n +2 | sed 's/```//g')

[ -z "$DETECTED_INTERPRETER" ] && DETECTED_INTERPRETER="sh"

START_TIME=$(date +%s%N)
EXECUTION_RESULT=$(exec "$DETECTED_INTERPRETER" <<EOF 2>&1
$EXECUTABLE_CONTENT
EOF
)
END_TIME=$(date +%s%N)

EXECUTION_DURATION_MS=$(( (END_TIME - START_TIME) / 1000000 ))

echo ""
echo '```'"$EXECUTION_DURATION_MS ms"
[ -n "$EXECUTION_RESULT" ] && echo "$EXECUTION_RESULT"
echo '```'
echo ""
