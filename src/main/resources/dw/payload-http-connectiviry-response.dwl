%dw 2.0
output application/json
---
{
  "x-event-code": correlationId,	
  "x-event-code": 9203,
  "x-event-msg": "Connectivity Error.",
  "result": {
    "error-type": error.errorType.namespace ++ ":" ++ error.errorType.identifier,
    "error-description": error.detailedDescription
  }
}
