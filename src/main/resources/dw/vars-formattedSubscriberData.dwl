%dw 2.0
output application/json
fun formatMsisdn(msisdn) = 
    msisdn match {
        case m if m startsWith "63" -> m
        case m if m startsWith "0" -> "63" ++ m[1 to -1]
        else -> "63" ++ msisdn
    }
---
{
    msisdn: formatMsisdn(vars.originalPayload.msisdn),
    prefix: formatMsisdn(vars.originalPayload.msisdn)[2 to 6],
    keyword: upper(vars.originalPayload.'sms-message') match {
        case "FREE FB ON" -> "OPT-IN"
        case "ON FREE FB" -> "OPT-IN"
        case "FREE FB OFF" -> "OPT-OUT"
        case "OFF FREE FB" -> "OPT-OUT"
        case "BONUSFB" -> "BONUS"
        case "BONUS FB" -> "BONUS"
        else -> "INVALID"
    }
}