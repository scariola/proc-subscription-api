%dw 2.0
output application/json skipNullOn = "everywhere"
---
{
	"msisdn": vars.formattedSubscriberData.msisdn,
	"requestPayload":{
		"state": if (vars.formattedSubscriberData.keyword == "OPT-IN" or vars.formattedSubscriberData.keyword == "BONUS") 1 else 0,
		"expiry-date": ""//vars.expiryDetails.'expiry-date'
	}
	
}