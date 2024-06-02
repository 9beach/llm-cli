#!/bin/bash

set -e 

SUCCESS_JSON='{ "content": [ { "text": "text: long text" } ] }'
FAILURE_JSON='{ "error": { "type": "error-type" } }'
BAD_JSON=' "key }'

JQ_SCRIPT='
if (.content | length) > 0 then
	.content[] | select(.text?) | .text
elif (.error.type?) then
	error("Server terminated for the following reason: \(.error.type).") | halt_error(1)
else
	error("Server terminated for unknown reason.") | halt_error(1)
end
'

SUCCESS_OUTPUT=$(echo "$SUCCESS_JSON" | jq -r "$JQ_SCRIPT" 2> /dev/null)
FAILURE_OUTPUT=$(echo "$FAILURE_JSON" | jq -r "$JQ_SCRIPT" 2>&1 1>/dev/null || true)
NULL_OUTPUT=$(echo null | jq -r "$JQ_SCRIPT" 2>&1 1>/dev/null || true)

[ "$SUCCESS_OUTPUT" = 'text: long text' ] && echo Ok!
[ "$FAILURE_OUTPUT" = 'jq: error (at <stdin>:1): Server terminated for the following reason: error-type.' ] && echo Ok!
[ "$NULL_OUTPUT" = 'jq: error (at <stdin>:1): Server terminated for unknown reason.' ] && echo Ok!

echo "All testing completed."
