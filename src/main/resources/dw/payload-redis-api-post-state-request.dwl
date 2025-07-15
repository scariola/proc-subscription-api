%dw 2.0
output application/json skipNullOn = "everywhere"
---
{
	"msisdn": vars.formattedSubscriberData.msisdn,
	"requestPayload":{
		"state": if (["OPT-IN", "BONUS"] contains vars.formattedSubscriberData.keyword ) 1 else 0,
		"expiry-date": vars.expiryDetails.'expiry-date'
	}
	
}