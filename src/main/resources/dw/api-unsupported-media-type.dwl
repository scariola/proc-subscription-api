%dw 2.0
output application/json
---
{
  "x-event-id":	correlationId,	
  "x-event-code": 9010,
  "x-event-msg": "Unsupported media type",
  "result":{
  	"error-type": error.errorType.namespace ++ ":" ++ error.errorType.identifier,
    "error-description": error.detailedDescription
  }
}