%dw 2.0
output application/json
---
{
  "audit-id": vars.auditId."audit-id",
  "requetPayload": {
    "success": if (!isEmpty(error)) 0 else 1,
    "hasProcessorError": if (!isEmpty(error)) 1 else 0
  }
}
