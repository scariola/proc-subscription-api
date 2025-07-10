%dw 2.0
output application/json
---
{
    "audit-id": vars.auditId."audit-id",
    "requetPayload": if (isEmpty(vars.auditLog)) 
	{
        "success": 1,
        "hasProcessorError": 0
    } else vars.auditLog
}