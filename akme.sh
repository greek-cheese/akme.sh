#!/bin/bash

INPUT_CODE=$(cat)
echo "$INPUT_CODE"

if [[ "$INPUT_CODE" != *'```'* ]]; then
    EXECUTION_RESULT=$(echo "$INPUT_CODE" | eval bash 2>&1)
    echo "$EXECUTION_RESULT"
    echo ""
    exit
fi

DETECTED_INTERPRETER=$(echo "$INPUT_CODE" | head -n 1 | sed 's/```//g' | xargs)
EXECUTABLE_CONTENT=$(echo "$INPUT_CODE" | tail -n +2 | sed 's/```//g')

if [ -z "$DETECTED_INTERPRETER" ]; then
    DETECTED_INTERPRETER="bash"
fi

START_TIME=$(date +%s%N)
EXECUTION_RESULT=$(echo "$EXECUTABLE_CONTENT" | eval $DETECTED_INTERPRETER 2>&1)
END_TIME=$(date +%s%N)

EXECUTION_DURATION_MS=$(( (END_TIME - START_TIME) / 1000000 ))

echo ""
echo '```'"$EXECUTION_DURATION_MS ms"
echo "$EXECUTION_RESULT"
echo '```'
echo ""
