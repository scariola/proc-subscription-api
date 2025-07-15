%dw 2.0
output application/json
---
{
	'state': payload.result.state default "",
	'expiry-date': payload.result.'expiry-date'
}