%dw 2.0
output application/json
---
{
    "prefix": payload.result.prefix default vars.bridgeResult.prefix, 
    "brand-id": payload.result.'brand-id' default vars.bridgeResult.'brand-id',
    "brand-name": payload.result.'brand-name'  default vars.bridgeResult.'brand-name'
}