%dw 2.0
output application/json

fun getBrandKey(brandName) = 
  if (lower(brandName) == "postpaid") "postpaid"
  else if (lower(brandName) == "tm") "tm"
  else "ghp_prepaid"

fun getScenario(keyword, state, brandName) = 
  if (upper(keyword) == "OPT-IN") (
    if (state == 1) "dual-provisioning"
    else if (state == 0) "reactivation"
    else "eligible"
  )
  else if (upper(keyword) == "OPT-OUT") (
    if (state == 0) "dual-off"
    else if (state == 1) "normal-off"
    else "not-registered"
  )
  else if (upper(keyword) == "BONUS") (
    if (upper(brandName) == "POSTPAID") "rejected"
    else if (state == 1) "dual-bonus"
    else "first-time"
  )
  else "unsupported"

var keyword = vars.formattedSubscriberData.keyword default "ANY"
var brandName = vars.brand.'brand-name' default "ANY"
var state = vars.stateResponse.result.state default null
var spielType = getScenario(keyword, state, brandName)

---
{
  "spiel-type": spielType,
  "sms-spiel": p(
    lower(keyword)
    ++ "." ++ getBrandKey(brandName)
    ++ "." ++ spielType
  ) default p("any.any.system-error")
}
