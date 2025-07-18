%dw 2.0
output application/json skipNullOn = "everywhere"
---
{
  "csp_txid": payload.'transaction-id',
  "sms_message_string":payload.'sms-message',
  "sub_mobtel": payload.msisdn,
  "sms_source_address": payload.'sms-source-address',
  "sub_device_details":payload.'sub-device',
   "hplmn": payload.hplmn,
  "as_service_id": payload.'as-service-id'
}

