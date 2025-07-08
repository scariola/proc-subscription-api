%dw 2.0
output application/json
---
{
  "prefix": payload.result[0].msisdn_prefix,
  "brand-id": (if (payload.result[0].brand_flag == 4) 1 else payload.result[0].brand_flag) as Number,
  "brand-name": payload.result[0].brand
}
