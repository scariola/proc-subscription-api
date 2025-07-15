%dw 2.0
output application/json skipNullOn = 'everywhere'
---
{
    "x-event-id": correlationId,
    "x-event-code": 1000,
    "x-event-msg": "success",
    "result": {
        "transaction-id": vars.originalPayload.'transaction-id',
        "msisdn": vars.originalPayload.'msisdn',
        "status":if (vars.provisionResponse.'x-event-msg' == "Provisioning Successful" or vars.provisionResponse.'x-event-msg' == "MSISDN successfully removed from whitelist" ) 1 else if (vars.provisionResponse.'x-event-msg' == "Deprovisioning Successful") 0 else null,
        "expiry-date": if (vars.formattedSubscriberData.keyword =='OPT-OUT') null else vars.expiryDetails.'expiry-date' 
                      default vars.stateResponse.result.'expiry-date',
        "sms-spiel": vars.smsSpiel.'sms-spiel' default null
    }
}