%dw 2.0
output application/json
---
{
	"audit-id": vars.auditId."audit-id",
	"requetPayload": vars.auditLog
}