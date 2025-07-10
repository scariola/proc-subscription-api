%dw 2.0
output application/json

---
payload.bundles
  filter (
    $.service_id == vars.originalPayload.'as-service-id' and 
    now() < ($.expiry_date as LocalDateTime { format: "yyyy-MM-dd HH:mm:ss" })
  )
  reduce (item, acc = {}) -> {
    "service-id": item.service_id,
    "expiry-date": item.expiry_date
  }
