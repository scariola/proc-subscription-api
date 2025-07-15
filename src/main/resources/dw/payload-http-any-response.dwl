%dw 2.0
output application/json
---
{
  "x-event-code": correlationId,	
  "x-event-code": 9201,
  "x-event-msg": "failure",
  "result": {
    "error-type": error.errorType.namespace ++ ":" ++ error.errorType.identifier,
    "error-description": "We encountered a system issue while processing your request. Please try again later."
  }
}
