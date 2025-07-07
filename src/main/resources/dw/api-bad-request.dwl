%dw 2.0
output application/json
---
{
  "x-event-id":	correlationId,	
  "x-event-code": 9402,
  "x-event-msg": "Bad request",
  "result":{
  	"error-type": error.errorType.namespace ++ ":" ++ error.errorType.identifier,
    "error-description": error.detailedDescription
  }
}