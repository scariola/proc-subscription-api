%dw 2.0
output application/json
---
{
  "x-event-code": correlationId,	
  "x-event-code": 9204,
  "x-event-msg": "Bad Request - Invalid Parameter or Request",
  "result": {
    "error-type": error.errorType.namespace ++ ":" ++ error.errorType.identifier,
    "error-description": error.detailedDescription
  }
}
