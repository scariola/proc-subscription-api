%dw 2.0
output application/json

---
if ((!isEmpty(payload.bundles)) and (payload.bundles[0].service_id != null))
payload.bundles
  filter (
    $.service_id == vars.originalPayload.'as-service-id' and 
    now() < ($.expiry_date as LocalDateTime { format: "yyyy-MM-dd HH:mm:ss" })
  )
  reduce (item, acc = {}) -> {
    "service-id": item.service_id default vars.originalPayload.'as-service-id',
    "expiry-date": item.expiry_date default p('default.expiry.date')
  }
  else {
     "service-id": vars.originalPayload.'as-service-id',
    "expiry-date": p('default.expiry.date')
  }