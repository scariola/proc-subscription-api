%dw 2.0
output application/json
---
{
  "service-id": vars.originalPayload.'as-service-id',
  "expiry-date": p('default.expiry.date')
}