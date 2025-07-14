%dw 2.0
output application/json
---
{
    "brand-id": payload.result.'brand-id' default payload.'brand-id',
    "brand-name": payload.result.'brand-name'  default payload.'brand-name'
}