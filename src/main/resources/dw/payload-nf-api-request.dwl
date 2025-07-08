%dw 2.0
output application/json
---
{
    msisdn: vars.formattedSubscriberData.msisdn replace /^(0|63)/ with ""
}