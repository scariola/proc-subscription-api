%dw 2.0
output application/json
---
{
  "service-id": vars.originalPayload.'as-service-id',
  "expiry-date": (now() + |P7D|) as String { format: "yyyy-MM-dd HH:mm:ss" }
}
