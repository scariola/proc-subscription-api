%dw 2.0
output application/json skipNullOn = "everywhere"
---
{
	"msisdn": vars.formattedSubscriberData.msisdn,
	"requestPayload":{
		"state": vars.state.state,
		"expiry-date": vars.expiryDetails.'expiry-date'
	}
	
}