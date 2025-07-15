%dw 2.0
import * from dw::test::Asserts
---
payload must equalTo({
  "x-event-id": "123",
  "x-event-code": 1000,
  "x-event-msg": "success",
  "result": {
    "transaction-id": "20200224-004-003",
    "msisdn": "9177939217",
    "status": 1,
    "expiry-date": "2025-12-31 23:59:59",
    "sms-spiel": "You now have access to Free FB. To begin, go to m.facebook.com or use the official FB Android/iOS app. Free FB is valid until 12/31/25."
  }
})