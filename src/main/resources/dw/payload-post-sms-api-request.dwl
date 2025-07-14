%dw 2.0
output application/json
---
{
    "fromAddress": vars.originalPayload.'sms-source-address',
    "smsMessaging": {
        "address": vars.originalPayload.msisdn,
        "message": vars.smsSpiel.'sms-spiel'
    }
}