%dw 2.0
output application/json
---
if (!isEmpty(payload.result)) 
  {
    'prefix': payload.result[0].msisdn_prefix,
    'brand-id': (if (payload.result[0].brand_flag == 4) 1 else payload.result[0].brand_flag) as Number,
    'brand-name': (if (payload.result[0].brand_flag == 4) "GHP Prepaid" else payload.result[0].brand)
  }
else 
  {
    'prefix': vars.formattedSubscriberData.prefix, 
    'brand-id': 0,
    'brand-name': "unsupported"
  }