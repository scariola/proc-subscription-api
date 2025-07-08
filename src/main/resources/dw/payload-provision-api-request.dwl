%dw 2.0
output application/json
---
{
  "msisdn": vars.formattedSubscriberData.msisdn,
  "provision": {
    "fb-product-id": vars.expiryDetails.'service-id' default vars.originalPayload.'as-service-id',
    "expiry-date": vars.expiryDetails."expiry-date" default "1"
  }
}
