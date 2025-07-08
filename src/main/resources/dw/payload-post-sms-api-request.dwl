%dw 2.0
output application/json
---
{
    "fromAddress": vars.originalPayload.msisdn,
    "smsMessaging": {
        "address": vars.originalPayload.'sms-source-address',
        "message": vars.smsSpielMapping.'sms-spiel'
    }
}