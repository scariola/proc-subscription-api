%dw 2.0
output application/json
---
{
	'state': payload.state default "",
	'expiry-date': payload.'expiry-date'
}